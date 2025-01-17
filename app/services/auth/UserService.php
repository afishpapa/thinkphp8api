<?php

namespace app\services\auth;

use app\model\EmailVerificationsModel;
use app\model\RuleModel;
use app\model\UserLoginModel;
use app\model\UserModel;
use app\services\BaseService;
use app\services\CryptService;
use app\services\EmailService;
use app\services\GoogleAuthenticatorService;
use DateTime;
use think\App;
use think\Exception;
use think\exception\InvalidArgumentException;
use think\exception\ValidateException;
use think\facade\Db;

class UserService extends BaseService
{
    /**
     * 构造函数
     * @param App $app
     */
    public function __construct(App $app, UserModel $model)
    {
        parent::__construct($app);
        $this->model = $model;
    }

    /**
     * 管理员登录
     * @param $param
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function login($p): array
    {
        $identity_type = $p['identity_type'];
        $identifier = $p['identifier'];
        $credential = $p['credential'];


        $user_login = UserLoginModel::where('identity_type', $identity_type)->where('identifier', $identifier)->find();
        if (!$user_login) {
            throw new Exception('The account does not exist');
        }

        $crypt_service = new CryptService();

        if (false === $crypt_service->checkPass($user_login['credential'], $credential, $user_login['salt'])) {
            throw new Exception('Password error');
        }

        // 验证用户登录方式是否禁用
        if ($user_login['status'] !== 'normal') {
            throw new Exception('This account has been disabled');
        }

        // 验证用户是否禁用
        if ($user_login->user['status'] !== 'normal') {
            throw new Exception('This account has been disabled');
        }

        // 获取权限菜单
        $rule = new RuleModel();
        $menu_list = $rule->tree();

        // 更新登录时间,登录IP
        $user_login->login_time = nowDate();
        $user_login->save();

        // 事件记录操作日志
//        event('AdminLog', ['admin_id' => $user['id'], 'username' => $user['username']]);

        return $this->success([
            'token'     => $crypt_service->makeJWT([
                'id' => $user_login['user_id'],
            ]),
            'user_info' => [
                'id' => $user_login['user_id'],
            ],
            'menu_list' => makeTree($menu_list),
        ]);
    }

    public function register($p): array
    {
        $user_login = UserLoginModel::where('identity_type', $p['identity_type'])->where('identifier', $p['identifier'])->find();
        if ($user_login) {
            throw new Exception('The account is exist');
        }

        $crypt_service = new CryptService();

        Db::startTrans();
        try {
            $user = UserModel::create([
                'first_name' => $p['first_name'],
                'last_name'  => $p['last_name'],
                'country'    => $p['country'],
                'phone'      => $p['phone']
            ]);

            $salt = randomNumber(6);
            $user_login = UserLoginModel::create([
                'user_id'       => $user->id,
                'identity_type' => $p['identity_type'],
                'identifier'    => $p['identifier'],
                'salt'          => $salt,
                'credential'    => $crypt_service->makePass($p['credential'], $salt)
            ]);
            // 提交事务
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            throw $e;
        }

        // 发送验证邮件
        $email_service = new EmailService();
        $token = $email_service->verifyEmail($user_login['user_id'], $user_login->identifier);

        return $this->success([
            'token' => $token
        ]);
    }

    public function verify($token)
    {
        $email_verifaction = EmailVerificationsModel::where('token', $token)->whereTime('expire_time', '>', nowDate())->find();
        if (!$email_verifaction) {
            throw new Exception('token is invalid');
        }

        // 修改邮箱验证状态
        UserLoginModel::where('identity_type', 'email')->where('user_id', $email_verifaction['user_id'])->where('identifier', $email_verifaction['email'])->update([
            'is_verified' => 'yes',
            'status' => 'normal'
        ]);

        // 删除当前数据
        $email_verifaction->delete();
        // 删除过期token
        randomNumber(1) > 5 && EmailVerificationsModel::whereTime('expire_time', '<', nowDate())->delete();

        return $this->success();
    }

    public function check($token)
    {
        $user_id = EmailVerificationsModel::where('token', $token)->value('user_id');
        if (!$user_id) {
            throw new Exception('token is invalid');
        }

        // 查询邮箱验证状态
        $is_verified = UserLoginModel::where('identity_type', 'email')->where('user_id', $user_id)->value('is_verified');

        return $this->success([
            'is_verified' => $is_verified
        ]);
    }

    public function resend($token)
    {
        $email_verifaction = EmailVerificationsModel::where('token', $token)->find();
        if (!$email_verifaction) {
            throw new Exception('token is invalid');
        }
        // 发送验证邮件
        $domain = $this->app->request->domain();

        $email_service = new EmailService();
        $email_service->send($email_verifaction['email'], 'verify email', $domain . '/register/verify/token/' . $token);
    }

    public function another($token, $email)
    {
        $email_verifaction = EmailVerificationsModel::where('token', $token)->find();
        if (!$email_verifaction) {
            throw new Exception('token is invalid');
        }

        // 邮箱是否已经存在
        $other_user_login = UserLoginModel::where('identity_type', 'email')->where('identifier', $email)->find();
        if ($other_user_login['uid'] != $email_verifaction['user_id']) {
            throw new Exception('email is invalid');
        }

        $user_login = UserLoginModel::where('identity_type', 'email')->where('user_id', $email_verifaction['user_id'])->find();
        if (!$user_login) {
            throw new Exception('user is invalid');
        }

        //@todo 事务吗?
        $email_verifaction->email = $email;
        $email_verifaction->expire_time = (new DateTime())->modify('+7 days')->format('Y-m-d H:i:s');
        $email_verifaction->save();

        $user_login->identifier = $email;
        $user_login->is_verified = 'no';
        $user_login->status = 'forbidden';
        $user_login->save();
    }


}
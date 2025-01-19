<?php

namespace app\controller;

use app\BaseController;
use app\enums\errorCode\ErrorCode;
use app\model\UserBalanceModel;
use app\model\UserLoginModel;
use app\services\CryptService;
use DateTime;
use think\facade\Db;
use think\Model;

class Index extends BaseController
{
    public function index()
    {

        $balance = new UserBalanceModel();

        $balance->change(2, 'GBP', 10);
        $balance->change(2, 'GBP', -20);
        $balance->change(2, 'GBP', -30);


        return $this->Error(ErrorCode::USER_NOT_FOUND);
        die;
        halt((new DateTime())->modify('+7 days')->format('Y-m-d H:i:s'));
        json_validate();
//        $data = Db::table('user_login')->find(1);
        $data = UserLoginModel::find(1)->user->toArray();
        halt($data);
//        halt(UserLoginModel::find(1)->toArray());
//        halt($this->request->user);
//        $service = new CryptService();
//        $data = $service->encrypt('sdfsdf');

//        $data = $service->decrypt($data);

//        $data = $service->makeJWT([1,2,3,4]);
//        $data = $service->getJWT($data);

//        halt($data);

    }

    public function hello($name = 'ThinkPHP8')
    {
        return 'hello,' . $name;
    }

    public function emailVerification() {
//        验证流程演示
//        用户注册时：
//        在 users 表中插入用户信息，is_verified 默认设置为 0。
//        在 email_verifications 表中插入一条记录，包括 user_id、email、token、expires_at。
//        发送验证邮件：
//        拼接验证链接（如 https://example.com/verify?token=abc123）并发送到用户邮箱。
//        用户点击验证链接：
//        后端接收 token，查询 email_verifications 表，验证 token 是否存在且未过期。
//        验证成功后：
//        更新 users 表中对应用户的 is_verified 字段为 1。
//        删除 email_verifications 表中对应的记录。
    }
}

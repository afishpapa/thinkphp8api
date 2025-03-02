<?php
declare (strict_types=1);

namespace app\controller\auth;

use app\BaseController;
use app\services\auth\UserService;
use app\validate\auth\RegisterValidate;
use think\App;
use think\Response;

class Register extends BaseController
{
    private $service;

    public function __construct(App $app, UserService $service)
    {
        parent::__construct($app);
        $this->service = $service;
    }


    public function register(): Response
    {
        $p = input();

        $this->validate($p, RegisterValidate::class . '.register');

        $params = [
            'first_name'    => $p['first_name'],
            'last_name'     => $p['last_name'],
            'country'       => $p['country'],
            'identity_type' => 'email',
            'identifier'    => $p['email'],
            'credential'    => $p['password'],
            'phone'         => $p['phone'],
        ];

        // 调用服务层逻辑
        $ret = $this->service->register($params);
        $token = $ret['data']['token'];

        // 返回成功响应
        return $this->Success($token);

    }

    public function verify()
    {
        $p = input();

        $this->validate($p, RegisterValidate::class . '.verify');

        // 调用服务层逻辑
        $this->service->verify($p['token']);

        return $this->Success();
    }

    public function check()
    {
        $p = input();

        $this->validate($p, RegisterValidate::class . '.verify');

        // 调用服务层逻辑
        $ret = $this->service->check($p['token']);
        $is_verified = $ret['data']['is_verified'];

        return $this->Success($is_verified);
    }

    public function resend()
    {
        $p = input();

        $this->validate($p, RegisterValidate::class . '.verify');

        // 调用服务层逻辑
        $this->service->resend($p['token']);

        return $this->Success();
    }

    public function another()
    {
        $p = input();

        $this->validate($p, RegisterValidate::class . '.another');

        // 调用服务层逻辑
        $this->service->another($p['token'], $p['email']);

        return $this->Success();
    }

}

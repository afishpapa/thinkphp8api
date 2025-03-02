<?php
declare (strict_types=1);

namespace app\controller\auth;

use app\BaseController;
use app\services\auth\UserService;
use app\validate\auth\LoginValidate;
use think\App;
use think\Response;
use think\response\Json;

class Login extends BaseController
{
    private $service;

    public function __construct(App $app, UserService $service)
    {
        parent::__construct($app);
        $this->service = $service;
    }


    public function login(): Response
    {
        $p = input();

        $this->validate($p, LoginValidate::class);
        $data = $this->service->login($p);

        return $this->Success($data);
    }

    public function captcha(): Json
    {
//        $captcha = new Captcha();
//        $captcha = $captcha->create();
//        return $this->Success($captcha);
    }
}

<?php
declare (strict_types=1);

namespace app\controller\auth;

use app\BaseController;
use app\Enums\ErrorCode\ErrorCode;
use app\services\auth\UserService;
use app\validate\auth\LoginValidate;
use BaseException;
use think\App;
use think\exception\ValidateException;
use think\Request;
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

        try {
            $this->validate($p, LoginValidate::class);

            $data = $this->service->login($p);

            return $this->Success($data);
        } catch (ValidateException $e) {
            return $this->Error(ErrorCode::VALIDATION_ERROR, $e->getError());
        } catch (BaseException $e) {
            return $this->Error($e->getCode());
        } catch (\Exception $e) {
            return $this->Error($e->getCode());
        }
    }

    public function captcha(): Json
    {
        $captcha = new Captcha();
        $captcha = $captcha->create();
        return $this->Success($captcha);
    }
}

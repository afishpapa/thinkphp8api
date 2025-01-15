<?php
declare (strict_types = 1);

namespace app\controller\auth;

use app\BaseController;
use app\services\auth\UserService;
use think\App;
use think\Request;
use think\response\Json;

class User extends BaseController
{
    public function __construct(App $app, UserService $service)
    {
        parent::__construct($app);
        $this->service = $service;
    }

    public function save(): Json
    {
        $data = $this->service->save(input());
        return json($data);
    }
}

<?php
declare (strict_types=1);

namespace app\controller\auth;

use app\BaseController;
use app\services\GoogleAuthenticatorService;
use think\App;
use think\response\Json;

class GoogleAuthenticator extends BaseController
{
    private $service;

    public function __construct(App $app, GoogleAuthenticatorService $service)
    {
        parent::__construct($app);
        $this->service = $service;
    }

    public function generateSecretAndQRCode(): Json
    {
        $user = $this->request->user;
        $data = $this->service->generateSecretAndQRCode($user['id']);

        return $this->Success($data);
    }

    public function verify(): Json
    {
        $p = input();
        //validate  @todo
        $user = $this->request->user;
        $data = $this->service->verify($user['id'], $p['code']);

        return $this->Success($data);
    }
}

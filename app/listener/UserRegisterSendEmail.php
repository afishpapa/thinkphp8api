<?php
declare (strict_types=1);

namespace app\listener;


use app\services\EmailService;

/**
 * 用户注册事件处理
 */
class UserRegisterSendEmail
{

    /**
     * 事件监听处理
     *
     * @return mixed
     */
    public function handle($p)
    {
        $user_login = $p['user_login'];
        $token = $p['token'];

        $email_service = new EmailService();
        $email_service->verifyEmail($user_login->user_id, $user_login->identifier, $token);
    }

}

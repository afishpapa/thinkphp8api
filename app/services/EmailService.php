<?php

namespace app\services;

use app\model\EmailVerificationsModel;
use DateTime;
use PHPMailer\PHPMailer\PHPMailer;

class EmailService extends BaseService
{
    private $mail;

    public function __construct()
    {
        parent::__construct();

        $this->mail = new PHPMailer(true);

        $this->mail->isSMTP();
        $this->mail->Host = config('smtp.Host');
        $this->mail->SMTPAuth = config('smtp.SMTPAuth');
        $this->mail->Username = config('smtp.Username');
        $this->mail->Password = config('smtp.Password');
        $this->mail->SMTPSecure = config('smtp.SMTPSecure');
        $this->mail->Port = config('smtp.Port');
        $this->mail->SMTPDebug = config('smtp.SMTPDebug');

        // 设置发件人信息
        $this->mail->setFrom(config('smtp.from_address'), config('smtp.from_name'));
        // 抄送
        //$this->mail->AddReplyTo('bbaggins@example.com', 'Bilbo Baggins');
    }

    /**
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function send($to, $subject, $body)
    {
        $this->mail->clearAddresses();
        $this->mail->AddAddress($to);
        $this->mail->Subject = $subject;
        $this->mail->MsgHTML($body);
//        $this->mail->Send();
    }

    /**
     * 验证注册邮箱
     * @param int $uid
     * @param string $email
     * @return string
     * @throws \PHPMailer\PHPMailer\Exception
     */
    public function verifyEmail(int $uid, string $email, string $token)
    {
        $domain = $this->app->request->domain();

        EmailVerificationsModel::create([
            'user_id'     => $uid,
            'email'       => $email,
            'token'       => $token,
            'expire_time' => (new DateTime())->modify('+7 days')->format('Y-m-d H:i:s')
        ]);

        $this->send($email, 'verify email', $domain . '/register/verify/token/' . $token);
    }

}
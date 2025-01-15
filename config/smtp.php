<?php

// +----------------------------------------------------------------------
// | SMTP 设置
// +----------------------------------------------------------------------
return [
    'Host'       => 'smtp1.example.com',               // SMTP服务器地址
    'SMTPAuth'   => true,                              // 启用SMTP认证
    'Username'   => 'your-email@example.com',         // SMTP用户名
    'Password'   => 'your-email-password',            // SMTP密码
    'SMTPSecure' => 'tls',   // 启用TLS加密
    'Port'       => 587,                              // SMTP端口
    'SMTPDebug'  => 2,

    'from_address' => 'from@example.com',
    'from_name'    => 'mailer'
];

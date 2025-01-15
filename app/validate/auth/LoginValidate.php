<?php
declare (strict_types = 1);

namespace app\validate\auth;

use think\Validate;

class LoginValidate extends Validate
{
    protected $rule = [
        'identity_type' => 'require',
        'identifier' => 'require|max:55',
        'credential' => 'require|max:32',
    ];

    protected $message = [
//        'identity_type.require' => '',
//        'identifier.max' => '',
//        'identifier.require' => '',
//        'credential.max' => '',
//        'credential.require' => '',
    ];
}

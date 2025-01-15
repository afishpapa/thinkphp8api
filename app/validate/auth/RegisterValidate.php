<?php
declare (strict_types=1);

namespace app\validate\auth;

use think\Validate;

class RegisterValidate extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名' =>  ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'first_name' => 'require',
        'last_name'  => 'require',
        'email'      => 'require|email',
        'phone'      => 'require',
        'password'   => 'require',
        'country'    => 'require',
        'token' => 'require',
    ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名' =>  '错误信息'
     *
     * @var array
     */
    protected $message = [];

    protected $scene = [
        'register' => ['first_name', 'last_name', 'email', 'phone', 'password', 'country'],
        'verify'   => ['token'],
        'another'  => ['token', 'email']
    ];
}

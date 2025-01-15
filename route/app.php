<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

Route::get('think', function () {
    return 'hello,ThinkPHP8!';
});

Route::get('hello/:name', 'index/hello');


// 登录管理
Route::group('/login', function () {
    // 后台登录
    Route::post('/login', '/auth.Login/login');
    // 获取验证码
    Route::get('/captcha', '/admin/auth.Login/captcha');
});

// 注册管理
Route::group('/register', function () {
    // 注册
    Route::post('/register', '/auth.Register/register');
    // 重发邮件
    Route::get('/resend', '/auth.Register/resend');
    // 使用其他邮箱
    Route::post('/another', '/auth.Register/another');
    // 验证邮箱
    Route::get('/verify', '/auth.Register/verify');
    // 查询邮箱验证状态
    Route::get('/check', '/auth.Register/check');
});

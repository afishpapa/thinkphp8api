<?php

namespace app\Enums\ErrorCode;

/**
 * 通用错误 如果以后业务太多 每个业务一个错误码
 */
enum ErrorCode: int
{
    // 通用错误码  范围 0-1999
    case SUCCESS = 0; // 成功
    case UNKNOWN_ERROR = 1000; // 未知错误
    case VALIDATION_ERROR = 1001; // 参数校验失败
    case AUTHENTICATION_FAILED = 1002; // 认证失败
    case REQUIRE_2FA = 1003;    //需要2FA token
    case VERIFY_2FA_ERROR = 1004;   //2FA token 验证错误


    // 每个业务+1000 以此类推

    // 用户模块错误码
    case USER_NOT_FOUND = 2000; // 用户不存在
    case USER_ALREADY_EXISTS = 2001; // 用户已存在
    case USER_BALANCE_NOT_EXITS = 2002; //用户余额记录不存在
    case USER_BALANCE_NOT_ENOUGH = 2003; //用户余额不足
    case USER_BALANCE_UPDATE_ERROR = 2004; //用户余额更新失败
    case USER_BALANCE_LOG_CREATE_ERROR = 2005; //用户余额更新记录添加

    // vendor模块错误码
    case VENDOR_NOT_FOUND = 3000; // 用户不存在


    public function message(): string
    {
        return match ($this) {
            self::SUCCESS => 'success',
            self::UNKNOWN_ERROR => 'unknown error',
            self::VALIDATION_ERROR => 'validate error',
            self::AUTHENTICATION_FAILED => 'authentication failed',
            self::REQUIRE_2FA => 'require 2fa',
            self::VERIFY_2FA_ERROR => '2fa verify error',

            self::USER_NOT_FOUND => '用户不存在',
            self::USER_ALREADY_EXISTS => '用户已存在',
            self::USER_BALANCE_NOT_EXITS => '用户余额记录不存在',
            self::USER_BALANCE_NOT_ENOUGH => '用户余额不足',
            self::USER_BALANCE_UPDATE_ERROR => '用户余额更新失败',
            self::USER_BALANCE_LOG_CREATE_ERROR => '用户余额更新记录添加',

            default => 'unset error message'  // 默认返回
        };
    }
}
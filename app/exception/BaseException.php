<?php
declare (strict_types=1);

namespace app\exception;

use app\Enums\ErrorCode\ErrorCode;
use think\Exception;

class BaseException extends Exception
{
    public function __construct(private ErrorCode $errorCode)
    {
        parent::__construct($errorCode->message(), $errorCode->value);
    }

    public function getErrorCode(): ErrorCode
    {
        return $this->errorCode;
    }
}
//
//// 抛出异常
//throw new ApiException(ErrorCode::USER_NOT_FOUND);
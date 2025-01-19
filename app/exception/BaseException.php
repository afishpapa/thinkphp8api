<?php
declare (strict_types=1);

namespace app\exception;

use app\enums\ErrorCode\ErrorCode;
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

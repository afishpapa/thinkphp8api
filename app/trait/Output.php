<?php


namespace app\trait;

use app\enums\errorCode\ErrorCode;
use think\Response;
use think\response\Json;

trait Output
{
    public function Success($data = [], ErrorCode $errorCode = ErrorCode::SUCCESS): Json
    {
        return json([
            'code'    => $errorCode->value, // 错误码值
            'message' => $errorCode->message(), // 错误码对应的描述信息
            'data'    => $data, // 可选的返回数据
            'time'    => time()
        ]);
    }

    public function Error(string|ErrorCode $errorCode = ErrorCode::UNKNOWN_ERROR, string $message = ''): Json
    {
        if ($errorCode instanceof ErrorCode) {
            return json([
                'code'    => $errorCode->value, // 错误码值
                'message' => $message ?: $errorCode->message(), // 错误码对应的描述信息
                'time'    => time()
            ]);
        }

        return json([
            'code'    => ErrorCode::UNKNOWN_ERROR, // 错误码值
            'message' => $errorCode, // 错误码对应的描述信息
            'time'    => time()
        ]);
    }
}

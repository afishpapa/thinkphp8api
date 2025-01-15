<?php


namespace app\trait;

use think\facade\Log;
use think\Response;

trait Output
{

    public function Success($data = [], string $message = 'success', int $code = 200, string $type = 'json', array $header = []): Response
    {
        $result = [
            'code' => $code,
            'message' => $message,
            'time' => time(),
            'data' => $data
        ];
        return Response::create($result, $type)->header($header)->code(200);
    }

    /**
     * 返回封装后的API数据到客户端
     * @param mixed $data 要返回的数据
     * @param integer $code 返回的code
     * @param mixed $message 提示信息
     * @param string $type 返回数据格式
     * @param array $header 发送的Header信息
     * @return Response
     */
    public function Error(string $message = 'fail', int $code = 400, string $type = 'json', array $header = []): Response
    {
        $result = [
            'code' => $code,
            'message' => $message,
        ];
        return Response::create($result, $type)->header($header)->code($code);
    }
}

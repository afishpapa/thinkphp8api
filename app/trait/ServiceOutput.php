<?php


namespace app\trait;

use stdClass;
use think\facade\Log;
use think\Response;

trait ServiceOutput
{
    /**
     * 错误信息
     * @param string $msg
     * @param int $code
     * @return array
     */
    function failed(string $msg = 'failed', int $code = 0): array
    {
        return ['code' => $code, 'msg' => lang($msg), 'data' => new stdClass()];
    }

    /**
     * 成功信息
     * @param array $data
     * @param int $code
     * @return array
     */
    function success(array $data = [], int $code = 200): array
    {
        if (empty($data)) $data = new stdClass();
        return ['code' => $code, 'msg' => lang('success'), 'data' => $data];
    }
}

<?php
declare (strict_types=1);

namespace app\middleware;

use app\services\CryptService;
use app\trait\Output;
use think\facade\Log;
use think\facade\Request;

class CheckJwt
{
    use Output;

    public function handle($request, \Closure $next)
    {
        // 从请求头中获取 Token
        $token = $request->header('Authorization');

        if (!$token) {
            return $this->Error('Access token missing', 402);
        }

        // 去掉 "Bearer " 前缀
        $token = str_replace('Bearer ', '', $token);

        try {
            $decoded = (new CryptService())->getJWT($token);

            // @todo JWT黑名单排除  实现单点登录 等奇葩操作

            // 将解码后的数据赋值给请求实例，方便后续使用
            $request->user = $decoded;
        } catch (\Exception $e) {
            // 记录错误日志
            Log::error('JWT decode failed: ' . $e->getMessage());

            return $this->Error('Invalid token', 401);
        }

        return $next($request);
    }
}

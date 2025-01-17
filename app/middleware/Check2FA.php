<?php
declare (strict_types=1);

namespace app\middleware;

use app\Enums\ErrorCode\ErrorCode;
use app\services\GoogleAuthenticatorService;
use app\trait\Output;
use think\facade\Log;
use think\Request;

class Check2FA
{
    use Output;

    public function handle($request, \Closure $next)
    {
        // 从请求头中获取 Token
        $code = $request->header()['2fa_token'];
        if (!$code) {
            return $this->Error(ErrorCode::REQUIRE_2FA);
        }

        try {
            $user = $request->user;

            $result = (new GoogleAuthenticatorService)->verifyCode($secret, $code);
            if ($result === false) {
                return $this->Error(ErrorCode::VERIFY_2FA_ERROR);
            }
        } catch (\Exception $e) {
            // 记录错误日志
            Log::error('Check2FA failed: ' . $e->getMessage());

            return $this->Error();
        }

        return $next($request);
    }
}

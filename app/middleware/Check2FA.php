<?php
declare (strict_types=1);

namespace app\middleware;

use app\enums\errorCode\ErrorCode;
use app\model\UserLoginModel;
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
        $user_id = $request->user['id'] ?? $this->notLoggedIn();
        (new GoogleAuthenticatorService)->verified($user_id, $code);

        return $next($request);
    }

    private function notLoggedIn(): int
    {
        $p = input();

        return UserLoginModel::where('identity_type', $p['identity_type'])->where('identifier', $p['identifier'])->value('user_id');
    }
}

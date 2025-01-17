<?php

namespace app\services;

use app\Enums\ErrorCode\ErrorCode;
use app\exception\BaseException;
use app\model\User2FAModel;
use OTPHP\TOTP;

/**
 * 谷歌验证2FA类
 */
class GoogleAuthenticatorService extends BaseService
{
    /**
     * 生成密钥和二维码
     * @param string $username
     * @param string $issuer
     * @return array
     */
    public function generateSecretAndQRCode(int $username, string $issuer = 'Metaprise'): array
    {
        $totp = TOTP::create();
        $totp->setLabel($username);
        $totp->setIssuer($issuer);

        $secret = $totp->getSecret();
        $qrCodeUrl = $totp->getProvisioningUri();

        User2FAModel::create([
            'user_id' => $username,
            'secret' => $secret
        ]);

        $crypt_service = new CryptService();

        return [
            'secret' => $secret,
            'image' => $crypt_service->qrcode($qrCodeUrl)
        ];
    }

    /**
     * 验证动态验证码
     * @param string $secret
     * @param string $code
     * @return bool
     */
    public function verifyCode(int $user_id, string $code): bool
    {
        $secret = User2FAModel::where('user_id', $user_id)->where('status', 'unverified')->value('secret');
        if (empty($secret)) {
            throw New BaseException(ErrorCode::VERIFY_2FA_ERROR);
        }

        $totp = TOTP::create($secret);
        $result = $totp->verify($code);
        if ($result === false) {
            throw New BaseException(ErrorCode::VERIFY_2FA_ERROR);
        }

        return true;
    }

}
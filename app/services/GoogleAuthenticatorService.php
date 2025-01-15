<?php

namespace app\services;

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
    public function generateSecretAndQRCode(string $username, string $issuer): array
    {
        $totp = TOTP::create();
        $totp->setLabel($username);
        $totp->setIssuer($issuer);

        return [
            'secret' => $totp->getSecret(),
            'qrCodeUrl' => $totp->getProvisioningUri(),
        ];
    }

    /**
     * 验证动态验证码
     * @param string $secret
     * @param string $code
     * @return bool
     */
    public function verifyCode(string $secret, string $code): bool
    {
        $totp = TOTP::create($secret);
        return $totp->verify($code);
    }

}
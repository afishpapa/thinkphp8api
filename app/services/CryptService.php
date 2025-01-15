<?php

namespace app\services;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use think\App;
use think\facade\Log;

class CryptService extends BaseService
{
    /**
     * 生成密码
     * @param string $password
     * @param string $salt
     * @return string
     */
    function makePass(string $password, string $salt = ''): string
    {
        return password_hash($password . $salt, PASSWORD_DEFAULT);
    }

    /**
     * 验证密码
     * @param $hashedPassword string  持久化密文
     * @param $password string 密码
     * @param string $salt 盐
     * @return bool
     */
    function checkPass(string $hashedPassword, string $password, string $salt = ''): bool
    {
        return password_verify($password . $salt, $hashedPassword);
    }

    /**
     * 设置jwt
     * @param $data
     * @return string
     */
    function makeJWT($data): string
    {
        $jwt = new JWT();
        $token = [
            'iat'  => time(), // 签发时间
            'nbf'  => time(), // 生效时间
            'data' => $data, // 加签数据
            'iss'  => config('jwt.iss'),
            'aud'  => config('jwt.aud'),
            'exp'  => time() + config('jwt.exp_time'),
        ];

        return $jwt::encode($token, env('APP_SECRET'), 'HS256');
    }

    /**
     * 获取token中的信息
     * @param $token
     * @return array|null
     */
    function getJWT($token): ?array
    {
        $jwt = new JWT();
        try {
            $jwtData = $jwt::decode($token, new Key(env('APP_SECRET'), 'HS256'));
            $data = (array)($jwtData->data);
        } catch (\Exception $e) {
            Log::write($e->getMessage(), 'error');
            return null;
        }
        return $data;
    }

    /**
     * 对称加密函数
     *
     * @param string $data 要加密的数据
     * @param string|null $key 加密密钥
     * @param string $algo
     * @return string 加密后的数据（Base64编码）
     */
    function encrypt(string $data, string $key = null, string $algo = 'aes-256-cbc'): string
    {
        $key === null && $key = env('APP_SECRET');

        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
        $encrypted = openssl_encrypt($data, $algo, $key, OPENSSL_RAW_DATA, $iv);
        $ivHex = bin2hex($iv);

        return base64_encode($encrypted . "::" . $ivHex);
    }

    /**
     * 对称解密函数
     *
     * @param string $data
     * @param string|null $key 解密密钥
     * @param string $algo
     * @return string 解密后的数据
     */
    function decrypt(string $data, string $key = null, string $algo = 'aes-256-cbc'): string
    {
        $key === null && $key = env('APP_SECRET');

        $encryptedData = base64_decode($data);
        [$encryptedData, $ivHex] = explode("::", $encryptedData);
        $iv = hex2bin($ivHex);

        return openssl_decrypt($encryptedData, $algo, $key, OPENSSL_RAW_DATA, $iv);
    }



}
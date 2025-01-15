<?php

use Ramsey\Uuid\Uuid;

/**
 * 生成子孙树
 * @param $data
 * @return array
 */
function makeTree($data): array
{
    $param = $tree = [];
    // 整理数组
    foreach ($data as $item) {
        $param[$item['id']] = $item;
    }
    // 查询子孙
    foreach ($param as $key => $val) {
        if ($val['pid'] == 0) continue;
        $param[$val['pid']]['children'][] = &$param[$key];
    }
    // 去除杂质
    foreach ($param as $item) {
        if ($item['pid'] != 0) continue;
        $tree[] = $item;
    }

    unset($param, $data);

    return $tree;
}

/**
 * 跨域
 * @return void
 */
function crossDomain(): void
{
    header("access-control-allow-headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-Requested-With");
    header("access-control-allow-methods: OPTIONS,GET, POST, PATCH, PUT, DELETE");
    header("access-control-allow-origin: *");
}

/**
 * 随机数生成生成
 * @param int $length
 * @return int
 */
function randomNumber(int $length = 6): int
{
    if ($length <= 0) {
        throw new InvalidArgumentException('Length must be a positive integer.');
    }

    // 创建随机数生成器实例
    $randomizer = new Random\Randomizer();

    // 生成指定长度的随机整数
    $min = (int) str_pad('1', $length, '0'); // 最小值，比如 6 位就是 100000
    $max = (int) str_pad('', $length, '9'); // 最大值，比如 6 位就是 999999

    return $randomizer->getInt($min, $max);
}

/**
 * 随机数生成生成
 * @param int $length
 * @return string
 */
function randomByte(int $length = 6): string
{
    if ($length <= 0) {
        throw new InvalidArgumentException('Length must be a positive integer.');
    }

    // 创建随机数生成器实例
    $randomizer = new Random\Randomizer();

    return bin2hex($randomizer->getBytes($length));
}

/**
 * 获取当前时间
 * @param string $format
 * @return string
 */
function nowDate(string $format = 'Y-m-d H:i:s'): string
{
    return date($format);
}

/**
 * 生成唯一id
 * @return string
 */
function uuid(): string
{
    $uuid4 = Uuid::uuid4();
    return $uuid4->toString(); // 输出类似：550e8400-e29b-41d4-a716-446655440000
}

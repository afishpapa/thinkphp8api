<?php

// +----------------------------------------------------------------------
// | 日志设置
// +----------------------------------------------------------------------
return [
    // 默认日志记录通道
    'default'      => 'file',
    // 日志记录级别
    'level'        => [],
    // 日志类型记录的通道 ['error'=>'email',...]
    'type_channel' => [
        'error' => 'email',
        'sql'   => 'sql',
    ],
    // 关闭全局日志写入
    'close'        => false,
    // 全局日志处理 支持闭包
    'processor'    => null,

    // 日志通道列表
    'channels'     => [
        'file' => [
            // 日志记录方式
            'type'           => 'File',
            // 日志保存目录
            'path'           => '',
            // 单文件日志写入
            'single'         => false,
            // 独立日志级别
            'apart_level'    => ['error', 'sql'], // error和sql日志单独记录
            // 最大日志文件数量
            'max_files'      => 0,
            // 使用JSON格式记录
            'json'           => true,
            // 日志处理
            'processor'      => null,
            // 关闭通道日志写入
            'close'          => false,
            // 时间格式
            'time_format'    => 'Y-m-d H:i:s',
            // 日志输出格式化
            'format'         => '[%s][%s] %s',
            // 是否实时写入
            'realtime_write' => false,
        ],
        // 其它日志通道配置
        'email' => [
            // 日志记录方式
            'type'           => 'File', //自定义驱动替换为带命名空间的类名
            // 日志保存目录
            'path'           => '',
            // 单文件日志写入
            'single'         => false,
            // 独立日志级别
            'apart_level'    => ['error', 'sql'], // error和sql日志单独记录
            // 最大日志文件数量
            'max_files'      => 0,
            // 使用JSON格式记录
            'json'           => true,
            // 日志处理
            'processor'      => null,
            // 关闭通道日志写入
            'close'          => false,
            // 时间格式
            'time_format'    => 'Y-m-d H:i:s',
            // 日志输出格式化
            'format'         => '[%s][%s] %s',
            // 是否实时写入
            'realtime_write' => false,
        ],
        'sql' => [
            // 日志记录方式
            'type'           => 'File',
            // 日志保存目录
            'path'           => '',
            // 单文件日志写入
            'single'         => false,
            // 独立日志级别
            'apart_level'    => ['error', 'sql'], // error和sql日志单独记录
            // 最大日志文件数量
            'max_files'      => 0,
            // 使用JSON格式记录
            'json'           => true,
            // 日志处理
            'processor'      => null,
            // 关闭通道日志写入
            'close'          => false,
            // 时间格式
            'time_format'    => 'Y-m-d H:i:s',
            // 日志输出格式化
            'format'         => '[%s][%s] %s',
            // 是否实时写入
            'realtime_write' => false,
        ],
    ],

];

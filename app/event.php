<?php
// 事件定义文件
return [
    'bind'      => [
    ],

    'listen'    => [
        'AppInit'  => [],
        'HttpRun'  => [],
        'HttpEnd'  => [],
        'LogLevel' => [],
        'LogWrite' => [],

        'UserRegister' => [
            'app\listener\UserRegister'
        ]
    ],

    'subscribe' => [
    ],
];

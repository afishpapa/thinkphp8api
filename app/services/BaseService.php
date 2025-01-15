<?php
declare (strict_types=1);

namespace app\services;

use app\trait\ServiceOutput;
use think\App;
use think\Request;

/**
 * 服务基础类
 */
class BaseService
{
    use ServiceOutput;

    /**
     * 应用实例
     * @var App
     */
    protected App $app;

    protected mixed $param;

    protected object $model;

    /**
     * Request实例
     * @var Request
     */
    protected Request $request;

    /**
     * 构造方法
     * @access public
     * @param App|null $app 应用对象
     */
    public function __construct()
    {
        $this->app = app();
        $this->request = $this->app->request;
        // 控制器初始化
        $this->initialize();
    }

    /**
     * 初始化
     * @return void
     */
    protected function initialize()
    {
    }

}
<?php
declare (strict_types=1);

namespace app;

use think\App;
use think\Model;

/**
 * @mixin \think\Model
 */
class BaseModel extends Model
{
    /**
     * 构造方法
     * @access public
     * @param App $app 应用对象
     */
    public function __construct(array | object $data = [])
    {
        parent::__construct( $data);

        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
    }
}

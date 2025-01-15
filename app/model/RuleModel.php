<?php
declare (strict_types=1);

namespace app\model;

use app\BaseModel;

/**
 * @mixin \think\Model
 */
class RuleModel extends BaseModel
{
    protected $table = 'rule';

    protected $visible = ['id', 'name', 'title', 'icon'];

    public function tree()
    {
        $rule = $this->where('pid', 0)->where('status', 'normal')->where('is_menu', 1)->order('weigh', 'asc')->select();
        foreach ($rule as &$value) {
            $value['child'] = $this->where('pid', $value['id'])->where('status', 'normal')->where('is_menu', 1)->order('weigh', 'asc')->select();
        }

        return $rule;
    }
}

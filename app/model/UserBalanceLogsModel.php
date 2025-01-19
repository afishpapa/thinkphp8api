<?php
declare (strict_types = 1);

namespace app\model;

use app\BaseModel;
use think\Model;

/**
 * @mixin \think\Model
 */
class UserBalanceLogsModel extends BaseModel
{
    protected $table = 'user_balance_logs';

}

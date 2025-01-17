<?php
declare (strict_types = 1);

namespace app\model;

use app\BaseModel;

/**
 * @mixin \think\Model
 */
class User2FAModel extends BaseModel
{
    protected $table = 'user_2fa';

}

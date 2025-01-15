<?php
declare (strict_types=1);

namespace app\model;

use app\BaseModel;

/**
 * @mixin \think\Model
 */
class UserLoginModel extends BaseModel
{
    protected $table = 'user_login';

    public function User()
    {
        return $this->hasOne(UserModel::class, 'id', 'user_id');
    }
}

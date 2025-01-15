<?php
declare (strict_types = 1);

namespace app\model;

use think\Model;

/**
 * @mixin \think\Model
 */
class EmailVerificationsModel extends Model
{
    protected $table = 'email_verifications';

}

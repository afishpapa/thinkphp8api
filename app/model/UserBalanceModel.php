<?php
declare (strict_types=1);

namespace app\model;

use app\BaseModel;
use app\Enums\ErrorCode\ErrorCode;
use app\exception\BaseException;

/**
 * @mixin \think\Model
 */
class UserBalanceModel extends BaseModel
{
    protected $table = 'user_balance';

    /**
     * 修改余额并记录流水
     *
     * @param int $user_id
     * @param string $currency 币种
     * @param float $amount 变动金额（正数增加，负数减少）
     * @param string $type 变动类型（recharge/withdraw/consume等）
     * @param string|null $description 描述信息
     * @param string|null $related_id
     * @param int|null $operator_id
     * @param string $operator_type
     * @return bool 是否成功
     * @throws BaseException
     */
    public function change(int     $user_id,
                           string  $currency,
                           float   $amount,
                           string  $type = 'recharge',
                           ?string $description = null,
                           ?string $related_id = null,
                           ?int    $operator_id = null,
                           string  $operator_type = 'customer')
    {
        // 1. 查询当前余额
        $current = $this->where('user_id', $user_id)->where('currency', $currency)->lock()->find();
        if ($current === false) {
            throw new BaseException(ErrorCode::USER_BALANCE_NOT_EXITS);
        }
        $current_balance = $current['balance'];

        // 2. 计算新余额
        $new_balance = $current_balance + $amount;
        if ($new_balance < 0) {
            throw new BaseException(ErrorCode::USER_BALANCE_NOT_ENOUGH);
        }

        $current->balance = $new_balance;
        $ret = $current->save();
        if ($ret === false) {
            throw new BaseException(ErrorCode::USER_BALANCE_UPDATE_ERROR);
        }

        // 插入流水
        $log = UserBalanceLogsModel::create([
            'user_id'        => $user_id,
            'amount'         => $amount,
            'balance_before' => $current_balance,
            'balance_after'  => $new_balance,
            'type'           => $type,
            'related_id'     => $related_id,
            'description'    => $description,
            'operator_id'    => $operator_id,
            'operator_type'  => $operator_type,
        ]);

        if ($log === false) {
            throw new BaseException(Errorcode::USER_BALANCE_LOG_CREATE_ERROR);
        }

        return $log->id;
    }
}

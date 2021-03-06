<?php
// +----------------------------------------------------------------------
// | 框架 [ thinkphp ]
// +----------------------------------------------------------------------
// | 版权所有 2008~2017 thinkphp [ http://www.thinkphp.cn ]
// +----------------------------------------------------------------------
// | 官方网站: http://thinkphp.cn
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\common\model;

use think\Model;
use think\helper\Hash;
use think\Db;

/**
 * 附件模型
 * @package app\common\model
 */
class AdminAttachment extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__ADMIN_ATTACHMENT__';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    // protected $insert = ['create_time'];
    // protected $update = ['update_time'];

    // public function setUpdateTimeAttr()
    // {
    //     return date("Y-m-d H:i:s", time());
    // }

    // public function setCreateTimeAttr()
    // {
    //     return date("Y-m-d H:i:s", time());
    // }

    public function getValue($where, $field="name"){
        return $this->where($where)->value($field);
    }

    /** 查询一列的值 返回数组
     * @param $where 查询条件
     * @param string $field 指定索引
     * @return mixed
     */
    public function getColumn($where, $field="*"){
        return $this->where($where)->column($field);
    }

    /**查询一条数据
     * @param $where
     * @param string $field
     * @return array|false|\PDOStatement|string|Model
     */
    public function getOneData($where, $field = "*"){
        return $this->where($where)->field($field)->find();
    }

    /**查询一条数据
     * @param $where
     * @param string $field
     * @return array
     */
    public function getOneDarry($where, $field="*"){
        $returndata = [];
        $data = $this->where($where)->field($field)->find();
        if(!empty($data)){
          $returndata = $data->toArray();
        }
        return $returndata;
    }

    public function upData($data, $where){
        return $this->allowField(true)->save($data,$where);
    }

    
}

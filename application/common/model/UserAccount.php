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
 * 用户资金变动模型
 * @package app\common\model
 */
class UserAccount extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__USER_ACCOUNT__';

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

    public function getValue($where, $field="id"){
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

    //列表数据
    public function getLists($where = 1, $order = ['id'], $field = "*", $limit = 10){
     $lists = $this->where($where)->order($order)->field($field)->limit($limit)->select();
     $return_lists = [];
     foreach ($lists as $k => $v){
         $return_lists[$k] = $v->toArray();
     }
     return $return_lists;
    }

    //分页数据
    public function getPageLists($where = 1, $order = ['id'], $field = "*", $num){
    $lists = $this->where($where)->order($order)->paginate($num);
    $page = $lists->render();
    $return_lists = [];
    foreach ($lists as $k => $v){
       $return_lists[$k] = $v->toArray();
    }
    return [$return_lists, $page];
    }

    public function upData($data, $where){
        return $this->allowField(true)->save($data,$where);
    }

    
}

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
 * 规格模型
 * @package app\common\model
 */
class Spec extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__SPEC__';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    protected $deleteTime = 'deleted_at';
    protected $insert = ['created_at'];
    protected $update = ['updated_at'];

    public function setUpdatedAtAttr()
    {
        return date("Y-m-d H:i:s",time());
    }

    public function setCreatedAtAttr()
    {
        return date("Y-m-d H:i:s",time());
    }

    public function setDeletedAtAttr()
    {
        return date("Y-m-d H:i:s",time());
    }

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

    public function addData($data){
        $data['username'] = trim($data['username']);
        $data['password'] = trim($data['password']);

        //定义验证规则
        $rule = [
            'username|用户名' => 'require|chsDash|unique:User',
            'password|密码'  => 'require|length:6,20',
            // 'mobile|手机号'      => 'require',
            'mobile|手机号'   => 'require|regex:^1\d{10}|unique:User',
            // 'ref_mobile|推荐人手机号'      => 'require',
            'ref_mobile|推荐人手机号'   => 'require|regex:^1\d{10}',
            // 'email|邮箱'     => 'email|unique:User',
        ];

        //定义验证提示
        $msg = [
            'username.require' => '请输入用户名',
            'username.chsDash' => '请输入有效字符',
            'username.unique'     => '该用户名已存在',
            // 'email.require'    => '邮箱不能为空',
            // 'email.email'      => '邮箱格式不正确',
            // 'email.unique'     => '该邮箱已存在',
            'password.require' => '密码不能为空',
            'password.length'  => '密码长度6-20位',
            'mobile.require' => '手机号不能为空',
            'mobile.regex'     => '手机号不正确',
            'mobile.unique'     => '该手机号已存在',
            'ref_mobile.require' => '推荐人手机号不能为空',
            'ref_mobile.regex'     => '推荐人手机号不正确',
        ];
        
        $result = $this->allowField(true)->validate($rule,$msg)->save($data);

        if(false === $result){
            return $this->getError();
        }else{
            return '注册成功';
        }
    }

    public function upData($data, $where){
        return $this->allowField(true)->save($data,$where);
    }

    
}

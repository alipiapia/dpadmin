<?php

/*
* @Theme API Model:论坛
* @Author pp
* @Date 02th Dec,2016
*
*/

namespace app\common\model;
use think\Model;
use \traits\model\SoftDelete;
use think\Db;

class Article extends Model{
    use SoftDelete;

    protected $deleteTime = 'deleted_at';
    protected $insert = ['created_at'];
    protected $update = ['updated_at'];

    public function __construct()
    {
        parent::__construct();
    }

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

    public function getPageList($map,$page)
    {
        $list = $this->where($map)->paginate($page,false);
        $p = $list->render();
        return [$list,$p];
    }
    public function getPs($where,$type=1,$pageSize){

        $lists=$this->where($where)->paginate($pageSize,false);
        $page = $lists->render();
        if($type==2){
            $return=array();
            foreach ($lists as $k=>$v){
                $return[$k]=$v->toArray();
            }
        }
        return $type==1 ? [$lists,$page] : [$return,$page];
    }
    public function getValue($where,$field="*"){
        return $this->where($where)->value($field);
    }

    /** 查询一列的值 返回数组
     * @param $where 查询条件
     * @param string $field 指定索引
     * @return mixed
     */
    public function getColumn($where,$field="title"){
        $lists = $this->where($where)->column($field);
        return $lists;
    }

    /**查询指定字段
     * @param $where
     * @param $group
     * @param string $field
     * @return mixed
     */
    public function getFieldList($where = "id>0", $field = '*'){
        $lists = $this->where($where)->field($field)->select();
        return $lists;
    }

    /**查询一条数据
     * @param $where
     * @param string $field
     * @return array|false|\PDOStatement|string|Model
     */
    public function getOneData($where, $field = "*"){
        $lists = $this->where($where)->field($field)->find();
        return $lists;
    }

    public function addArticle($data){

        $rules = [
            'title' => 'require',//标题
            'author' => 'require',//作者
            'art_type' => 'require',//文章类型
            'file9_id' => 'require',//文章图片
            'content' => 'require',//内容
        ];

        $msg =  [
                'title.require' => '标题不能为空',
                'author.require' => '作者不能为空',
                'art_type.require' => '文章类型不能为空',
                'file9_id.require' => '文章图片不能为空',
                'content.require'=> '内容不能为空',
            ];
        
        $result = $this->allowField(true)->validate($rules,$msg)->save($data);

        if(false === $result){
            return false;
        }else{
            return '添加成功';
        }
    }

    public function sumTotalFee($id = 0){
        if(!$id)return 0;
        return Db::name('articleOrder')->where(['art_id' => $id, 'pay_status' => 1])->sum('total_fee');
    }

}
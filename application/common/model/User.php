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
 * 后台用户模型
 * @package app\common\model
 */
class User extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__USER__';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    // 对密码进行加密
    public function setPasswordAttr($value)
    {
        return Hash::make((string)$value);
    }

    // 对支付密码进行加密
    public function setPaypassAttr($value)
    {
        return Hash::make((string)$value);
    }

    // 获取注册ip
    public function setSignupIpAttr()
    {
        return get_client_ip(1);
    }

    public function getValue($where, $field="username"){
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
        // $data = array_merge($data, $where);
        // return $data;
        // return $this->data($data,true)->isUpdate(true)->save();
        // return db('ArticleOrder')->where($where)->save($data);
        return $this->allowField(true)->save($data,$where);
    }

    //密码验证
    public function checkPass($uid, $pass, $word){
        $word = trim($word);
        $userInfo = $this->getOneDarry(['id' => $uid]);
        // if(isset($userInfo["'". $pass . "'"])){
            $check = Hash::check((string)$word, $userInfo[$pass]);
        // }else{
        //     $check = 1;
        // }
        return $check ? 1 : 0;
    }

    /**
     * 用户登录
     * @param string $username 用户名
     * @param string $password 密码
     * @param bool $rememberme 记住登录
     * @author thinkphp
     * @return bool|mixed
     */
    public function login($username = '', $password = '', $rememberme = false)
    {
        $username = trim($username);
        $password = trim($password);

        // 匹配登录方式
        if (preg_match("/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/", $username)) {
            // 邮箱登录
            $map['email'] = $username;
        } elseif (preg_match("/^1\d{10}$/", $username)) {
            // 手机号登录
            $map['mobile'] = $username;
        } else {
            // 用户名登录
            $map['username'] = $username;
        }

        // $map['status'] = 1;

        // 查找用户
        $user = $this::get($map);
        // $userArr = db('user')->where($map)->find();
        $userArr = $this->getOneDarry($map);
        // pp($userArr);
        if (!$user) {
            $this->error = '用户不存在或被禁用！';
        } else {
            if (!Hash::check((string)$password, $userArr['password'])) {
                $this->error = '密码错误！';
            } else {
                $id = $userArr['id'];

                // 更新登录信息
                $user->last_login_time = request()->time();
                $user->last_login_ip   = get_client_ip(1);
                if ($user->save()) {
                    // 自动登录
                    return $this->autoLogin($this::get($id), $rememberme);
                } else {
                    // 更新登录信息失败
                    $this->error = '登录信息更新失败，请重新登录！';
                    return false;
                }
            }
        }
        return false;
    }

    /**
     * 自动登录
     * @param object $user 用户对象
     * @param bool $rememberme 是否记住登录，默认7天
     * @author thinkphp
     * @return bool|int
     */
    public function autoLogin($user, $rememberme = false)
    {
        // pp($user);
        // 记录登录SESSION和COOKIES
        $auth = array(
            'id'             => $user->id,
            'username'        => $user->username,
            'mobile'     => $user->mobile,
            'ref_mobile'     => $user->ref_mobile,
            'last_login_time' => $user->last_login_time,
            'last_login_ip'   => get_client_ip(1),
        );
        session('user_auth', $auth);
        session('user_auth_sign', $this->dataAuthSign($auth));

        // 记住登录
        if ($rememberme) {
            $signin_token = $user->username.$user->id.$user->last_login_time;
            cookie('id', $user->id, 24 * 3600 * 7);
            cookie('signin_token', $this->dataAuthSign($signin_token), 24 * 3600 * 7);
        }

        return $user->id;
    }

    /**
     * 数据签名认证
     * @param array $data 被认证的数据
     * @author thinkphp
     * @return string 签名
     */
    public function dataAuthSign($data = [])
    {
        // 数据类型检测
        if(!is_array($data)){
            $data = (array)$data;
        }

        // 排序
        ksort($data);
        // url编码并生成query字符串
        $code = http_build_query($data);
        // 生成签名
        $sign = sha1($code);
        return $sign;
    }

    /**
     * 判断是否登录
     * @author thinkphp
     * @return int 0或用户id
     */
    public function isLogin()
    {
        $user = session('user_auth');
        if (empty($user)) {
            // 判断是否记住登录
            if (cookie('?id') && cookie('?signin_token')) {
                $user = $this::get(cookie('id'));
                if ($user) {
                    $signin_token = $this->dataAuthSign($user->username.$user->id.$user->last_login_time);
                    if (cookie('signin_token') == $signin_token) {
                        // 自动登录
                        $this->autoLogin($user, true);
                        return $user->id;
                    }
                }
            };
            return 0;
        }else{
            return session('user_auth_sign') == $this->dataAuthSign($user) ? $user['id'] : 0;
        }
    }
}

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

// 为方便系统核心升级，二次开发中需要用到的公共函数请写在这个文件，不要去修改common.php文件



if (!function_exists('is_mobile')) {
    /**
     * 检查是否为移动设备
     * @author pp
     * @return boolean
     */
    function is_mobile()
    {
        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])){
            return true;
        } 
        // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        if (isset ($_SERVER['HTTP_VIA'])){ 
            // 找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
        } 
        // 脑残法，判断手机发送的客户端标志,兼容性有待提高
        if (isset ($_SERVER['HTTP_USER_AGENT'])){
            $clientkeywords = ['nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile']; 
            // 从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))){
                return true;
            } 
        } 
        // 协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])){ 
            // 如果只支持wml并且不支持html那一定是移动设备
            // 如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))){
                return true;
            } 
        } 
        return false;
    }
}

if (!function_exists('has_signin')) {
    /**
     * 判断是否登录
     * @author pp
     * @return Boolean
     */
    function has_signin()
    {
        return model('index/user')->isLogin();
    }
}

if (!function_exists('pp')) {
    /**
     * 断点打印测试
     * @author pp
     * @return Mixed
     */
    function pp($arr){
        echo "<pre>";        
        var_dump($arr);
        echo "</pre>";
        die;
    }
}

if (!function_exists('get_user_value')) {
    /**
     * 获取某一column
     * @author pp
     * @return String
     */
    function get_user_value($id, $column){
        return model('common/user')->getValue(['id' => $id], $column);
    }
}

if (!function_exists('get_product_value')) {
    /**
     * 获取某一column
     * @author pp
     * @return String
     */
    function get_product_value($id, $column){
        return model('common/product')->getValue(['id' => $id], $column);
    }
}

if (!function_exists('get_cate_value')) {
    /**
     * 获取某一column
     * @author pp
     * @return String
     */
    function get_cate_value($id, $column){
        return model('common/cate')->getValue(['id' => $id], $column);
    }
}

if (!function_exists('get_spec_value')) {
    /**
     * 获取某一column
     * @author pp
     * @return String
     */
    function get_spec_value($id, $column){
        return model('common/spec')->getValue(['id' => $id], $column);
    }
}

if (!function_exists('get_user_address_value')) {
    /**
     * 获取某一column
     * @author pp
     * @return String
     */
    function get_user_address_value($id, $column){
        return model('common/useraddress')->getValue(['id' => $id], $column);
    }
}

if (!function_exists('get_order_status_count')) {
    /**
     * 订单状态统计
     * @author pp
     * @return Int
     */
    function get_order_status_count($uid, $status){
        return model('common/order')->where(['buyer' => $uid, 'order_status' => $status])->count();
    }
}
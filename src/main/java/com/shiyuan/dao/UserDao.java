package com.shiyuan.dao;

import com.shiyuan.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author Admin
 */
public interface UserDao {
    void upUserName(@Param("account") String account,@Param("newName") String newName);//更新用户昵称

    public boolean upUserPass(@Param("account") String account,@Param("pass") String pass);//修改用户密码

    public User selectUser( String account);//通过id查询用户信息

    public int checkName(String name);//检查用户昵称
}

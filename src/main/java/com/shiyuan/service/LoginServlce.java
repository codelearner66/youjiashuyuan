package com.shiyuan.service;

import com.shiyuan.entity.User;

import java.util.List;

public interface LoginServlce {
    /** 只有帐号时检测帐号是否已经存在
     * 同时有账号和密码时检测账号和密码
     * 登陆检测账号密码 是否存在
     * @param user
     * @return
     */
    public  Boolean Checkaccount(User user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 删除用户
     * @param user
     * @return
     */
    public boolean deleteUser(User user);

    /**
     * 查询用户所有信息
     * @param user
     * @return
     */
    public User getUserAll(User user);

    /**
     * 查询所有用户
     * @return
     */
    public List<User> selectUsers();
}

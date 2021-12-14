package com.shiyuan.dao;


import com.shiyuan.entity.User;

import java.util.List;

public interface Login {
    //登陆检测账号密码
    public int getUser(User user);
    //登陆检测账号密码
    public  boolean Checkaccount(User user);
    //用户注册
    public boolean addUser(User user);
    //删除用户
    public  int deleteUser(User user);
    //获取用户所有信息
    public User getUserAll(User user);
    //获取所有用户
    public List<User> selectUser();

}

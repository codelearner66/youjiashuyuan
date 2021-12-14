package com.shiyuan.service;

import com.shiyuan.entity.User;

public interface UserService {
    public boolean upName(String account,String newName);//更新用户昵称

    public User getUser(String account);//通过账号查讯用户

    public int checkName(String name);//检查昵称

    public boolean upPass(String account,String pass);

    public void closeSession();//关闭资源

}

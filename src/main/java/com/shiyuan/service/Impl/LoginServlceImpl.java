package com.shiyuan.service.Impl;
import com.shiyuan.dao.Login;
import com.shiyuan.entity.User;
import com.shiyuan.service.LoginServlce;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class LoginServlceImpl implements LoginServlce {
    SqlSession session = DBtool.getSqlSession();
    Login login = session.getMapper(Login.class);
    @Override
    public Boolean Checkaccount(User user) {
        boolean checkaccount = login.Checkaccount(user);
        return checkaccount;
    }

    @Override
    public boolean addUser(User user) {
        boolean b = login.addUser(user);
        session.commit();
        return b;
    }

    @Override
    public boolean deleteUser(User user) {
        int b = login.deleteUser(user);
        if(b>0){
            return true;
        }
        session.commit();
        return false;
    }

    @Override
    public User getUserAll(User user) {
        return login.getUserAll(user);
    }

    @Override
    public List<User> selectUsers() {
        return login.selectUser();
    }

    public void closeSession(){
        session.close();
    }
}

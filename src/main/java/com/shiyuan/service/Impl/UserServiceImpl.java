package com.shiyuan.service.Impl;

import com.shiyuan.dao.UserDao;
import com.shiyuan.entity.User;
import com.shiyuan.service.UserService;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;

public class UserServiceImpl implements UserService {
    SqlSession session = DBtool.getSqlSession();
    UserDao userDao = session.getMapper(UserDao.class);
    /**
     * 修改昵称
     * @param account
     * @param newName
     * @return
     */
    @Override
    public boolean upName(String account,String newName) {
        try {
            userDao.upUserName(account,newName);
            session.commit();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询用户
     * @param account 用户账号
     * @return User
     */
    @Override
    public User getUser(String account) {
        return userDao.selectUser(account);
    }
    /**
     * 检查昵称
     * @param name 用户昵称
     * @return  返回数条数，若为0则无重复(昵称查重)
     */
    @Override
    public int checkName(String name) {
        return userDao.checkName(name);
    }
    /**
     * 修改用户密码
     * @param account 用户账号
     * @param pass  用户密码
     * @return
     */
    @Override
    public boolean upPass(String account,String pass) {
        if (userDao.upUserPass(account, pass)){
            System.out.println("密码修改成功");
        }
        return userDao.upUserPass(account, pass);
    }
    /**
     * 关闭session资源
     */
    @Override
    public void closeSession(){
        session.close();
    }
}

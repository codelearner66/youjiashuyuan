package com.shiyuan.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;


public class DBtool {
    //定义会话工厂SqlSessionFactory对象

    private static SqlSessionFactory sqlSessionFactory;


    static { //创建静态块，它比类的构造方法先执行
        try {
            //通过文件流获取mybatis配置文件（mybatis.xml放在Resources文件夹中）

            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");

            //实例化会话工厂，因为通过会话工厂才获取 SqlSession会话，这样才能通过 SqlSession对象对数据表进行操作。

            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 返回会话工厂
     * @return
     */
    public static SqlSessionFactory getSqlSessionFactory(){

        return sqlSessionFactory;

    }
    /**
     * 返回会话
     * @return
     */
    public  static SqlSession getSqlSession(){

        return getSqlSessionFactory().openSession(true);

    }

}

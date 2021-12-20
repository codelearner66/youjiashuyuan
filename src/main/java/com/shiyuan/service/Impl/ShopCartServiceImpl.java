package com.shiyuan.service.Impl;


import com.shiyuan.dao.ShopDao;
import com.shiyuan.entity.ShopCart;
import com.shiyuan.service.ShopCartService;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ShopCartServiceImpl implements ShopCartService {
    SqlSession session = DBtool.getSqlSession();
    ShopDao shopDao = session.getMapper(ShopDao.class);
    /**
     * 通过账号
     * @param account
     * @return
     */
    @Override
    public List<ShopCart> selectShopCart(String account) {
        try {
            return shopDao.selectShopCart(account);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }



    /**
     * 关闭资源
     */
    @Override
    public void closeSession(){
        session.close();
    }
}

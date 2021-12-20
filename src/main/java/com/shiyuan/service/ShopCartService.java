package com.shiyuan.service;

import com.shiyuan.entity.ShopCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopCartService {
    /**
     * 通过账号
     * @param account
     * @return
     */
    List<ShopCart> selectShopCart(@Param("account") String account);

    /**
     * 关闭资源
     */
    void closeSession();
}

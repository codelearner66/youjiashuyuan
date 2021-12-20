package com.shiyuan.dao;

import com.shiyuan.entity.ShopCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopDao {
    /**
     * 通过账号
     * @param account
     * @return
     */
    List<ShopCart> selectShopCart(@Param("account") String account);

}

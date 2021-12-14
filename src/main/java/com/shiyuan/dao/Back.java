package com.shiyuan.dao;


import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.back.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Back {
    /**
     * 获取Echarts数据
     * @return
     */
    public List<Echarts> getEcharts();
    /**
     * 获取 backRevenutrend数据
     * @return
     */
    public List<BackRevenuetrend> getbackRevenutrend();
    List<BackRevenuetrend> getbackRevenutrendByID(@Param("id") String id);
    /**
     * 获取top100排名
     * @return
     */
    public  List<BackRevenuetrend> getHotTop100();
    public  List<BackRevenuetrend> getSortNp();
    /**
     * @param start
     * @param size
     * @return
     * 返回购物车表
     * start分页的起始序号
     *  size分页的大小
     */
    public List<BackShoppingCart> getbackshoppingcart(@Param("start") int start, @Param("size") int size);
           boolean insertshoppingcart(BackShoppingCart car);
    public List<BackRevenuetrend> getBack_strend(@Param("type") String type);
    /**
     * 用户账号
     * @param Id
     * @param start 分页起始位置
     * @return  帐单列表list
     */
     List<SellFrom> getSellFormByUserId(@Param("Id") String Id, @Param("start") int start);

    /**
     * 添加账单
     * @param sellFrom
     * @return
     */
     boolean insertSellForm(SellFrom sellFrom);
    /**
     * 获取杂志信息
     * @param start
     * @param size
     * @return
     */
    public List<Magazines> getManazines(@Param("start") int start, @Param("size") int size);
    List<Magazines> getManazinesnull();
    public  Magazines getMagazinesByID(@Param("id") String id);
    /**
     * 插入新的杂志
     * @return
     */
    public boolean setMagazine(Magazines magazines);
     boolean deleteMagazinesById(@Param("id") String id);
    boolean upDataBooks(Magazines magazines);
    /**
     *
     * @param TableName
     * @return
     */
    int getPagesSum(String TableName);
    /**
     *
     * @param
     * @return
     */
    public  double getTmoney(String date) throws Exception;

    /**
     *
     * @return
     */
    public double getYearmoney();

    /**
     *
     * @return
     */
    public double getMonthmoney();

    /**
     *
     * @param admin
     * @return
     */
    public boolean checkadmin(Admin admin);

    /**
     *
     * @param admin
     * @return
     */
    public Admin adminlogin(Admin admin);
     public List<Admin> getAllAdmin(@Param("start") int start, @Param("size") int size);
    public boolean setAdmin(Admin admin);
    boolean deleteAdmin(Admin admin);
    boolean insertAdmin(Admin admin);
}

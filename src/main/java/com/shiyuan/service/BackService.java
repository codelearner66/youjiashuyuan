package com.shiyuan.service;

import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.back.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BackService {

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
    List<BackRevenuetrend> getbackRevenutrendByID(String id);
     public int getPagesSum(String TableName);
    /**
     * @param start
     * @param size
     * @return
     * 返回购物车表
     * start分页的起始序号
     C  size分页的大小
     */
    public List<BackShoppingCart> getbackshoppingcart(int start, int size);
    boolean insertshoppingcart(BackShoppingCart car);
     public  List<BackRevenuetrend> getBack_strend(String type);
    /**
     * 获取杂志信息
     * @param start
     * @param size
     * @return
     */
    public List<Magazines> getManazines(int start, int size);
    public Magazines getMagazinesByID(String id);
    List<SellFrom> getSellFormByUserId(String id, int start);

    /**
     * 获取top100
     * @return
     */
    List<BackRevenuetrend> getHotTop100();

    /**
     * 返回分类图书总销售额
     * @return
     */
    List<BackRevenuetrend> getSortNp();
    public  double getTmoney(String date);
    public double getYearmoney();
    public double getMonthmoney();
    public boolean checkadmin(String acc, String passwd);
    /**
     *
     * @param acc
     * @param passwd
     * @return
     */
    public Admin adminlogin(String acc, String passwd);

    /**
     * 更新admin
     * @param admin
     * @return
     */
    boolean setAdmin(Admin admin);

    /**
     * 删除管理员
     * @param admin
     * @return
     */
    boolean deleteAdmin(Admin admin);

    /**
     * 添加新的管理员
     * @param admin
     * @return
     */
    boolean insertAdmin(Admin admin);
    /**
     * 获取所有的管理员
     * @return
     */
    List<Admin> getAllAdmin(int start, int size);
    /**
     * 插入新的杂志
     */
    public boolean setMagazine(Magazines magazines);

    /**
     * 单本分析时表单
     * @param start
     * @return
     */
    Map<String,Object> getManazinesnull(int start);
    int getpagessum(String ch);
    /**
     * 按ID删除图书
     * @param id
     * @return
     */
    boolean deleteMagazinesById(String id);
    /**
     * 更新杂志
     * @param magazines
     * @return
     */
    boolean upDataBooks(Magazines magazines);

}

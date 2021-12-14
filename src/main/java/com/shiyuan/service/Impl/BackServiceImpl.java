package com.shiyuan.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shiyuan.dao.Back;
import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.back.*;
import com.shiyuan.service.BackService;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BackServiceImpl implements BackService {
  private static    SqlSession session = DBtool.getSqlSession();
  private static Back back = session.getMapper(Back.class);
  private static List<Magazines> hwlist=null;
    @Override
    public List<Echarts> getEcharts() {
        List<Echarts> echarts = back.getEcharts();
        session.commit();
        return echarts;
    }

    @Override
    public List<BackRevenuetrend> getbackRevenutrend() {
        List<BackRevenuetrend> backRevenuetrends = back.getbackRevenutrend();
        return backRevenuetrends;
    }

    @Override
    public List<BackRevenuetrend> getbackRevenutrendByID(String id) {
        List<BackRevenuetrend> backRevenuetrends = back.getbackRevenutrendByID(id);
        return backRevenuetrends;
    }

    @Override
    public int getPagesSum(String TableName) {
        int pagesSum = back.getPagesSum(TableName);
        return pagesSum;
    }

    @Override
    public List<BackShoppingCart> getbackshoppingcart(int start, int size) {
        List<BackShoppingCart> getbackshoppingcart = back.getbackshoppingcart(start, size);
        return getbackshoppingcart;
    }

    @Override
    public boolean insertshoppingcart(BackShoppingCart car) {
        boolean insertshoppingcart = back.insertshoppingcart(car);
        return insertshoppingcart;
    }

    @Override
    public List<BackRevenuetrend> getBack_strend(String type) {
        List<BackRevenuetrend> back_strend = back.getBack_strend(type);
        return back_strend;
    }

    @Override
    public List<Magazines> getManazines(int start, int size) {
        List<Magazines> manazines = back.getManazines(start, size);
        return manazines;
    }

    @Override
    public Magazines getMagazinesByID(String id) {
        Magazines magazinesByID = back.getMagazinesByID(id);
        return magazinesByID;
    }

    @Override
    public List<SellFrom> getSellFormByUserId(String id, int start) {
        List<SellFrom> sellFormByUserId = back.getSellFormByUserId(id, start);
        return sellFormByUserId;
    }

    @Override
    public List<BackRevenuetrend> getHotTop100() {
        List<BackRevenuetrend> hotTop100 = back.getHotTop100();
        return hotTop100;
    }

    @Override
    public List<BackRevenuetrend> getSortNp() {
        List<BackRevenuetrend> sortNp = back.getSortNp();
        return sortNp;
    }

    @Override
    public double getTmoney(String date) {
        double tmoney = 0;
        try {
            tmoney = back.getTmoney(date);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return tmoney;
    }

    @Override
    public double getYearmoney() {
        double yearmoney = back.getYearmoney();
        return yearmoney;
    }

    @Override
    public double getMonthmoney() {
        double monthmoney = back.getMonthmoney();
        return monthmoney;
    }

    @Override
    public boolean checkadmin(String acc, String passwd) {
        Admin admin = new Admin();
        admin.setAdmin(acc);
        admin.setPasswd(passwd);
        boolean checkadmin = back.checkadmin(admin);
        return checkadmin;
    }

    @Override
    public Admin adminlogin(String acc, String passwd) {
        Admin admin = new Admin();
        admin.setAdmin(acc);
        admin.setPasswd(passwd);
        Admin adminlogin = back.adminlogin(admin);
        return adminlogin;
    }

    @Override
    public boolean setAdmin(Admin admin) {
        boolean admin1 = back.setAdmin(admin);
        if (admin1) session.commit();
        return admin1;
    }

    @Override
    public boolean deleteAdmin(Admin admin) {
        boolean b = back.deleteAdmin(admin);
        if (b) session.commit();
        return b;
    }

    @Override
    public boolean insertAdmin(Admin admin) {
        boolean b = back.insertAdmin(admin);
        if (b) session.commit();
        return b;
    }

    @Override
    public List<Admin> getAllAdmin(int start,int size) {
        List<Admin> allAdmin = back.getAllAdmin(start,size);
        return allAdmin;
    }

    @Override
    public boolean setMagazine(Magazines magazines) {
        boolean b = back.setMagazine(magazines);
        if (b) session.commit();
        return b;
    }

    @Override
    public Map<String, Object> getManazinesnull(int start) {
        PageHelper.startPage(start, 10);//使用pageHelper开启分页 1是页码 10是页面的size
        List<Magazines> hwlist = back.getManazinesnull();
        PageInfo<Magazines> page = new PageInfo<>(hwlist);
        Map<String, Object> map=new HashMap<>();
        map.put("hwlist",hwlist);
           int total=  (int)page.getTotal();
           int pages = page.getPages();
           int pageNum = page.getPageNum();
           map.put("total",total);
           map.put("pages",pages);
           map.put("pageNum",pageNum);
           return map;
    }

    @Override
    public int getpagessum(String ch) {

         return  0;
    }

    @Override
    public boolean deleteMagazinesById(String id) {
        boolean b = back.deleteMagazinesById(id);
        if (b) session.commit();
        return b;
    }

    @Override
    public boolean upDataBooks(Magazines magazines) {
        boolean b = back.upDataBooks(magazines);
        if (b) session.commit();
        return b;
    }
}

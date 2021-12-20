package com.shiyuan.service;

import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.PageBean;

import java.util.List;

public interface MainService {


    public List<Magazines> magazinesData();//获取主页数据

    public PageBean<Magazines> findMagaByPage(String currentPage, String rows);//获取全部杂志分页数据
    //方法重载
    public PageBean<Magazines> findMagaByPage(String currentPage, String rows, String type);//按照分类获取杂志分页数据

    public PageBean<Magazines> findMagaByPageByCycle(String currentPage, String rows, String cycle);//按照分类获取杂志分页数据

}

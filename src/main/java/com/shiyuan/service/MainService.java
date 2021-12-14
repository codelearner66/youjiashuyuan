package com.shiyuan.service;

import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.PageBean;

import java.util.List;

public interface MainService {


    public List<Magazines> magazinesData();//获取主页数据


    public PageBean<Magazines> findMagaByPage(String currentPage, String rows,String type);//获取分页数据
}

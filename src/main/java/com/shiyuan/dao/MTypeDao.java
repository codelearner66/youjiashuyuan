package com.shiyuan.dao;

import com.shiyuan.entity.MType;

import java.util.List;

public interface MTypeDao {

    //查询杂志种类数据
    List<MType> selectByType();
    //查询杂志信息

}
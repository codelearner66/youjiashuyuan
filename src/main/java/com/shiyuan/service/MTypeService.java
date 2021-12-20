package com.shiyuan.service;

import com.shiyuan.entity.MType;

import java.util.List;

public interface MTypeService {
    /**
     * 查询杂志分类
     */
    List<MType> selectByMType();

    void closeSession();
}

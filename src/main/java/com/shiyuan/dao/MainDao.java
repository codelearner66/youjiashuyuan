package com.shiyuan.dao;

import com.shiyuan.entity.Magazines;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MainDao {
     List<Magazines> selectData();//查询数据
    /**
     * 查询Magazines分页总记录数
     * @param type
     * @return
     */
    int findTotalCount(int type);
    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param type
     * @return
     */
    List<Magazines> findByPage(@Param("start") int start,@Param("rows") int rows,@Param("type") int type);
}

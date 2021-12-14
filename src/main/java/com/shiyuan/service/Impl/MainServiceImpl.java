package com.shiyuan.service.Impl;

import com.shiyuan.dao.MainDao;
import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.PageBean;

import com.shiyuan.service.MainService;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;


import java.util.List;

/**
 * 实现主页数据
 */

public class MainServiceImpl implements MainService {

    SqlSession session = DBtool.getSqlSession();
    MainDao mainDao = session.getMapper(MainDao.class);

    @Override
    public List<Magazines> magazinesData(){
        List<Magazines> magazines =  mainDao.selectData();
        return magazines;
    }

    public void closeSession(){
        session.close();
    }

    @Override
    public PageBean<Magazines> findMagaByPage(String currentPage1, String rows1,String type1) {
        System.out.println("*********rows = " + rows1);
        //当前页码
        int currentPage = Integer.parseInt(currentPage1);
        //每页显示条数
       int rows = Integer.parseInt(rows1);
       int type = Integer.parseInt(type1);
        System.out.println("rows = " + rows);

        PageBean<Magazines> pb = new PageBean<Magazines>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        //总记录数
        int totalCount = mainDao.findTotalCount(type);
        pb.setTotalCount(totalCount);

        int start = (currentPage - 1) * rows;

       //String _start = Integer.toString(start);
        //每页的数据 list集合
        List<Magazines> magazines = mainDao.findByPage(start,rows,type);
        pb.setList(magazines);

        int totalPage = totalCount % rows == 0 ? totalCount/rows : (totalCount/rows) + 1;
        //总页码=总页数 % 每页显示条数 == 0 ? 总记录数 / 每页显示条数 ：总记录数 / 每页显示条数 +1
        pb.setTotalPage(totalPage);

        return pb;
    }
}

package com.shiyuan.service.Impl;

import com.shiyuan.dao.MTypeDao;
import com.shiyuan.entity.MType;
import com.shiyuan.service.MTypeService;
import com.shiyuan.utils.DBtool;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MTypeServiceImpl implements MTypeService {
    SqlSession session = DBtool.getSqlSession();
    MTypeDao mTypeDao = session.getMapper(MTypeDao.class);
    /**
     * 查询杂志分类
     * @return
     */
    @Override
    public List<MType> selectByMType() {
        if(mTypeDao.selectByType()!=null){
            return mTypeDao.selectByType();
        }
        return null;
    }

    /**
     * 关闭资源
     */
    @Override
    public void closeSession() {
        session.close();
    }
}

package com.web.service;

import com.github.pagehelper.PageInfo;
import com.web.bean.Students;
import org.apache.ibatis.annotations.Param;

/**
 * Created by zyz on 2016/11/9.
 */
public interface StudentSerivce
{

     /**
      * 根据条件查询用户分页信息
      * @param pageNum
      * @param students
      * @return
      */
     PageInfo<Students> selectByStudentsExample(Integer pageNum, Students students);

     int insertStudents(Students students);

     int updateStudents(Students students);

     Students selectById(long stuCode);

     int deleteById(long stuCode);

     Students login(String username);

     /**
      * 修改余额
      * @param account
      * @param stu_code
      * @return
      */
     int addAccount(double account,long stu_code);
}

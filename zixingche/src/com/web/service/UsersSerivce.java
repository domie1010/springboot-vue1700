package com.web.service;

import com.github.pagehelper.PageInfo;
import com.web.bean.Users;

/**
 * Created by zyz on 2016/11/9.
 */
public interface UsersSerivce
{

     /**
      * 根据条件查询用户分页信息
      * @param pageNum
      * @param user
      * @return
      */
     PageInfo<Users> selectByUsersExample(Integer pageNum,Users user);

     int insertUsers(Users users);

     int updateUsersById(Users users);

     int deleteById(long userid);

     Users selectUsersById(long userid);

     Users login(String username);

}

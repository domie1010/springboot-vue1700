package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.bean.Users;
import com.web.bean.UsersExample;
import com.web.dao.UsersMapper;
import com.web.service.UsersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class UserServiceImpl implements UsersSerivce {
    @Autowired
    private UsersMapper mapper;


    public PageInfo<Users> selectByUsersExample(Integer pageNum, Users user) {
        //设定查询条件
        UsersExample example = new UsersExample();
        example.setOrderByClause("user_id");
        UsersExample.Criteria criteria = example.createCriteria();
        if (user.getUsername() != null&&!"".equals(user.getUsername().trim()))
            criteria.andUsernameLike("%"+user.getUsername()+"%");
        if (user.getRealName() != null&&!"".equals(user.getRealName().trim()))
            criteria.andRealNameLike("%"+user.getRealName()+"%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);

        List<Users> userses = mapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<Users>(userses);
    }

    @Transactional(readOnly = false)
    public int insertUsers(Users users) {

       return mapper.insert(users);
    }
    @Transactional(readOnly = false)
    public int updateUsersById(Users users) {

        return mapper.updateByPrimaryKey(users);
    }
    @Transactional(readOnly = false)
    public int deleteById(long userid) {
        return mapper.deleteByPrimaryKey(userid);
    }

    public Users selectUsersById(long userid) {
        return mapper.selectByPrimaryKey(userid);
    }

    public Users login(String username) {
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Users> userses = mapper.selectByExample(example);
        if(userses!=null&&userses.size()>0)
            return userses.get(0);
        return null;
    }
}

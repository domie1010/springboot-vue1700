package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.bean.Students;
import com.web.bean.StudentsExample;
import com.web.bean.Users;
import com.web.bean.UsersExample;
import com.web.dao.StudentsMapper;
import com.web.dao.UsersMapper;
import com.web.service.StudentSerivce;
import com.web.service.UsersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class StudentsServiceImpl implements StudentSerivce {

    @Autowired
    private StudentsMapper mapper;

    public PageInfo<Students> selectByStudentsExample(Integer pageNum, Students students) {
        //设定查询条件
        StudentsExample example = new StudentsExample();
        example.setOrderByClause("stu_code");
        StudentsExample.Criteria criteria = example.createCriteria();

        if (students.getStuCode() != null&&students.getStuCode()>0)
            criteria.andUsernameLike("%"+students.getStuCode()+"%");
        if (students.getRealName() != null&&!"".equals(students.getRealName().trim()))
            criteria.andRealNameLike("%"+students.getRealName()+"%");
        //设置分页条件
        PageHelper.startPage(pageNum, 10);

        List<Students> studentses = mapper.selectByExample(example);
        //返回分页结果
        return new PageInfo<Students>(studentses);
    }
    @Transactional
    public int insertStudents(Students students) {
        return mapper.insert(students);
    }
    @Transactional
    public int updateStudents(Students students) {
        return mapper.updateByPrimaryKeySelective(students);
    }

    public Students selectById(long stuCode) {
        return mapper.selectByPrimaryKey(stuCode);
    }

    @Transactional(readOnly = false)
    public int deleteById(long stucode) {
        return mapper.deleteByPrimaryKey(stucode);
    }

    public Students login(String username) {
        StudentsExample example = new StudentsExample();
        StudentsExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Students> studentses = mapper.selectByExample(example);
        if(studentses!=null&&studentses.size()>0)
            return studentses.get(0);
        return null;
    }
    @Transactional(readOnly = false)
    public int addAccount(double account, long stu_code) {
        Students students = new Students();
        students.setAccount(account);
        students.setStuCode(stu_code);
        return mapper.updateByPrimaryKeySelective(students);
    }


}

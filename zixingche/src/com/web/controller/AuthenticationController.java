package com.web.controller;

import com.web.bean.Students;
import com.web.bean.Users;
import com.web.dto.WebResult;
import com.web.service.StudentSerivce;
import com.web.service.UsersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录与退出
 * Created by zyz on 2016/11/14.
 */
@Controller
@RequestMapping("/auth")
public class AuthenticationController {
    @Autowired
    private StudentSerivce stus;
    @Autowired
    private UsersSerivce us;

    /**
     *
     * @return
     */
    @RequestMapping(value = "/login",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<String> login(String username,String password,String type, HttpServletRequest request){

        if("users".equals(type)){
            return userLogin(username,password,request);
        }else if("students".equals(type)){
            return studentLogin(username, password, request);
        }
        return null;
    }

    /**
     * 学生登录
     * @param username
     * @param password
     * @param request
     * @return
     */
    private WebResult<String> studentLogin(String username, String password, HttpServletRequest request) {


        Students students = stus.login(username);
        if(students==null){//账号错误
            return  new WebResult<String>(false,"您输入的账号不存在");
        }

        if(!students.getPassword().equals(password)){//密码错误
            return  new WebResult<String>(false,"密码输入错误");
        }

        //登录成功
        HttpSession session = request.getSession();
        session.setAttribute("students",students);
        return new WebResult<String>(true,"登录成功","/main");
    }

    /**
     * 系统用户登录
     * @param username
     * @param password
     * @return
     */
    private WebResult<String> userLogin(String username, String password,HttpServletRequest request) {
        Users users = us.login(username);
        if(users==null){//账号错误
            return  new WebResult<String>(false,"您输入的账号不存在");
        }

        if(!users.getPassword().equals(password)){//密码错误
            return  new WebResult<String>(false,"密码输入错误");
        }

        //登录成功
        HttpSession session = request.getSession();
        session.setAttribute("users",users);
        return new WebResult<String>(true,"登录成功","/main");
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/login";
    }
}

package com.web.controller;

import com.github.pagehelper.PageInfo;
import com.web.bean.Users;
import com.web.dto.WebResult;
import com.web.service.UsersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by zyz on 2016/11/9.
 */
@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    UsersSerivce us;
    /**
     * 查询所有用户
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model,Users users,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
        PageInfo<Users> info = us.selectByUsersExample(pageNum, users);
        model.addAttribute("info",info);
        model.addAttribute("users",users);
        return "users/list";
    }
    @RequestMapping(value = "/edit",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> editUsers(Users users){
        int result = -1;
        try {
            if(users.getUserId()!=null&&users.getUserId()>0){
                //修改
                result =us.updateUsersById(users);
            }else {
                //添加
                result = us.insertUsers(users);
            }
            if(result>0){
                return new WebResult<Void>(true,"操作成功");
            }else{
                return new WebResult<Void>(false,"操作失败");
            }

        }catch (Exception e){
            return new WebResult<Void>(false,"操作失败:可能原因：该账号已经被占用了\n\r"+e.getMessage());
        }

    }

    @RequestMapping(value = "/{userid}/detail",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    @ResponseBody
    public WebResult<Users> detail(@PathVariable("userid")Long userid){
        Users users=null;
        try {
            if(userid!=null){
                users=us.selectUsersById(userid);
            }
            if(userid==null||users==null){
                return new WebResult<Users>(false,"查找失败");
            }else{
                return new WebResult<Users>(true,"查找成功",users);
            }
        }catch (Exception e){
            return new WebResult<Users>(false,"操作失败:"+e.getMessage());
        }

    }


    @RequestMapping(value = "/{userid}/delete",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> delete(@PathVariable("userid")Long userid){
        int result = -1;
        try {
            if(userid!=null){
               result = us.deleteById(userid);
            }
            if(result>0){
                return new WebResult<Void>(true,"删除成功！");
            }else{
                return new WebResult<Void>(false,"删除失败");
            }
        }catch (Exception e){
            return new WebResult<Void>(false,"操作失败:"+e.getMessage());
        }

    }

}

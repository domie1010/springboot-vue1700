package com.web.controller;

import com.github.pagehelper.PageInfo;
import com.web.bean.Students;
import com.web.dto.WebResult;
import com.web.service.StudentSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zyz on 2016/11/9.
 */
@Controller
@RequestMapping("/students")
public class StudentsController {

    @Autowired
    StudentSerivce stus;
    /**
     * 查询所有用户
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model,Students students,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
        PageInfo<Students> info = stus.selectByStudentsExample(pageNum,students);
        model.addAttribute("info",info);
        model.addAttribute("students",students);
        return "students/list";
    }
    @RequestMapping(value = "/edit",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> editStudents(Students students){
        int result = -1;
        try {
            if(students.getStuCode()!=null&&students.getStuCode()>0){
                //修改
                result =stus.updateStudents(students);
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

    @RequestMapping(value = "/{stuCode}/detail",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    @ResponseBody
    public WebResult<Students> detail(@PathVariable("stuCode")Long stuCode){
        Students students=null;
        try {
            if(stuCode!=null){
                students=stus.selectById(stuCode);
            }
            if(students==null||stuCode==null){
                return new WebResult<Students>(false,"查找失败");
            }else{
                return new WebResult<Students>(true,"查找成功",students);
            }
        }catch (Exception e){
            return new WebResult<Students>(false,"操作失败:"+e.getMessage());
        }

    }


    @RequestMapping(value = "/{stuCode}/delete",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> delete(@PathVariable("stuCode")Long stuCode){
        int result = -1;
        try {
            if(stuCode!=null){
               result = stus.deleteById(stuCode);
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



    @RequestMapping(value = "/insert",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<String> insert(Students students){
        int result = -1;
        try {
                //修改
                result =stus.insertStudents(students);
            if(result>0){
                return new WebResult<String>(true,"注册成功，请登录","/main");
            }else{
                return new WebResult<String>(false,"注册失败,可能原因：该账号或者学号已经被占用");
            }

        }catch (Exception e){
            return new WebResult<String>(false,"操作失败:可能原因：该账号已经被占用了\n\r"+e.getMessage());
        }

    }

    /**
     * 更改账户余额
     * @return
     */
    @RequestMapping(value = "/addAccount",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> addAccount(HttpServletRequest request,@RequestParam( value ="account", defaultValue = "0")Double account){

        int result = -1;
        try{
            Students students= (Students) request.getSession().getAttribute("students");

            students.setAccount((students.getAccount()==null?0:students.getAccount())+account);

            result =stus.addAccount(students.getAccount(),students.getStuCode());
            if (result>0){
                return  new WebResult<Void>(true,"充值成功,当前余额是:"+students.getAccount());
            }

        }catch (Exception e){
            return  new WebResult<Void>(false,"充值失败");
        }

        return  new WebResult<Void>(false,"充值失败");
    }
}

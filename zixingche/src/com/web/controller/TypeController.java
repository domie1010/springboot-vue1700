package com.web.controller;

import com.web.bean.Type;
import com.web.dto.WebResult;
import com.web.service.TypeSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Controller
@RequestMapping("/types")
public class TypeController {

    @Autowired
    private TypeSerivce ts;
    /**
     * 查询所有用户
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model){
        List<Type> types = ts.querySelectAllType();
        model.addAttribute("types",types);
        return "types/list";
    }
    @RequestMapping(value = "/edit",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> editStudents(Type type){
        int result = -1;
        try {
            if(type.getTypeId()!=null&&type.getTypeId()>0){
                //修改
                result =ts.updateType(type);
            }else{
               result= ts.insertType(type);
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

    @RequestMapping(value = "/{typeId}/detail",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    @ResponseBody
    public WebResult<Type> detail(@PathVariable("typeId")Integer typeId){
        Type type=null;
        try {
            if(typeId!=null){
                type=ts.selectById(typeId);
            }
            if(typeId==null||typeId==null){
                return new WebResult<Type>(false,"查找失败");
            }else{
                return new WebResult<Type>(true,"查找成功",type);
            }
        }catch (Exception e){
            return new WebResult<Type>(false,"操作失败:"+e.getMessage());
        }

    }


    @RequestMapping(value = "/{TypeId}/delete",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> delete(@PathVariable("TypeId")Integer TypeId){
        int result = -1;
        try {
            if(TypeId!=null){
               result = ts.deleteById(TypeId);
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

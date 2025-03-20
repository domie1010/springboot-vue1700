package com.web.controller;

import com.github.pagehelper.PageInfo;
import com.web.bean.Entity;
import com.web.dto.WebResult;
import com.web.service.EntitySerivce;
import com.web.service.TypeSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by zyz on 2016/11/9.
 */
@Controller
@RequestMapping("/entity")
public class EntityController {

    @Autowired
    private EntitySerivce es;
    @Autowired
    private TypeSerivce ts;
    /**
     * 查询所有自行车
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model,Entity entity,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
        PageInfo<Entity> info = es.selectEntity(entity,pageNum);
        model.addAttribute("info",info);
        model.addAttribute("entity",entity);
        model.addAttribute("ts",ts.querySelectAllType());
        return "entities/list";
    }
    @RequestMapping(value = "/edit",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> edit(Entity entity){
        int result = -1;
        try {
            if(entity.getEntityid()!=null&&entity.getEntityid()>0){
                //修改
                result =es.updateEntity(entity);
            }else {
                //添加
                result = es.insertEntity(entity);
            }
            if(result>0){
                return new WebResult<Void>(true,"操作成功");
            }else{
                return new WebResult<Void>(false,"操作失败");
            }

        }catch (Exception e){
            return new WebResult<Void>(false,"操作失败:可能原因：\n\r"+e.getMessage());
        }

    }

    @RequestMapping(value = "/{entityId}/detail",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    @ResponseBody
    public WebResult<Entity> detail(@PathVariable("entityId")Long entityId){
        Entity entity=null;
        try {
            if(entityId!=null){
               entity =es.selectById(entityId);
            }
            if(entityId==null||entity==null){
                return new WebResult<Entity>(false,"查找失败");
            }else{
                return new WebResult<Entity>(true,"查找成功",entity);
            }
        }catch (Exception e){
            return new WebResult<Entity>(false,"操作失败:"+e.getMessage());
        }

    }


    @RequestMapping(value = "/{entityId}/delete",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> delete(@PathVariable("entityId")Long entityId){
        int result = -1;
        try {
            if(entityId!=null){
               result = es.deleteById(entityId);
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


    /**
     * 查询所有自行车
     * @param model
     * @return
     */
    @RequestMapping("/rent")
    public String rent(Model model,Entity entity,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum){
        PageInfo<Entity> info = es.selectEntity(entity,pageNum);
        model.addAttribute("info",info);
        model.addAttribute("entity",entity);
        model.addAttribute("ts",ts.querySelectAllType());
        return "entities/rent";
    }

    //


    @RequestMapping(value = "/{entityid}/torent")
    public String toRent(@PathVariable("entityid")Long entityId,Model model){
        Entity entity =es.selectById(entityId);
        model.addAttribute("e",entity);
        return "/entities/detail";
    }
}

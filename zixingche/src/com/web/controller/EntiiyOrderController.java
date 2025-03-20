package com.web.controller;

import com.github.pagehelper.PageInfo;
import com.web.bean.EntityOrder;
import com.web.bean.Students;
import com.web.dto.WebResult;
import com.web.service.EntityOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zyz on 2016/11/14.
 */
@Controller
@RequestMapping("/order")
public class EntiiyOrderController {
    @Autowired
    private EntityOrderService es;
    @RequestMapping("/list")
    public String list(Model model,EntityOrder order,@RequestParam(value ="pageNum",defaultValue = "1")Integer pageNum){
        PageInfo<EntityOrder> in = es.list(order, pageNum);
        model.addAttribute("order",order);
        model.addAttribute("info",in);
        return "order/list";
    }

    @RequestMapping(value = "/edit",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> edit(EntityOrder order){
        int result = -1;
        try {
            if(order.getOrderId()!=null&&order.getOrderId()>0){
                //修改
                result =es.updateState(order.getOrderId(),order.getOrderState());
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

    @RequestMapping(value = "/{orderId}/delete",produces = {"application/json;charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public WebResult<Void> delete(@PathVariable("orderId")Long orderId){
        int result = -1;
        try {
            if(orderId!=null){
                result = es.deleteOrder(orderId);
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
    public WebResult<Void> insert(EntityOrder order,HttpServletRequest request){
        int result = -1;
        try {
            Students students= (Students) request.getSession().getAttribute("students");
            result = es.insertOrder(order,students);
            if(result>0){
                return new WebResult<Void>(true,"租车成功,请联系管理员去取车！");
            }else{
                return new WebResult<Void>(false,"租车失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return new WebResult<Void>(false,"操作失败:"+e.getMessage());
        }

    }



}

package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by zyz on 2016/11/14.
 */
@Controller
public class PageController {
    @RequestMapping("/{page}")
    public String toPage(@PathVariable(value ="page" )String page){
        return "/main/"+page;
    }
}

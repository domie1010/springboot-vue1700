package com.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传控制
 */
@Controller
public class FileUploaderController implements ServletConfigAware{
	private ServletContext servletContext;

	@RequestMapping(value = "/FileUploaderController",method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String,Object> upload( @RequestParam("file") MultipartFile file) {

		//获取文件原始名称
		String oldName = file.getOriginalFilename();

		//获取后缀
		String ext=oldName.substring(oldName.lastIndexOf("."));
		//重新命名
		String  newName = new Date().getTime()+ext;
		//获取上传路径根
		String rootPath =servletContext.getRealPath("/uploadfile");
		File newFile = new File(rootPath,newName);


		//返回结果
		Map<String,Object> result = new HashMap<String, Object>();
		/*
	 * //成功时 { "error" : 0, "url" : "http://www.example.com/path/to/file.ext" }
	 * //失败时 { "error" : 1, "message" : "错误信息" }
	 */
		try {
			if(!newFile.exists()){
				newFile.createNewFile();
			}
			IOUtils.copy(file.getInputStream(), new FileOutputStream(newFile));
			result.put("error",0);
			result.put("url","/uploadfile/"+newName);
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			result.put("error",1);
			result.put("message","上传失败："+e.getMessage());
			return result;
		}
	}

	public void setServletConfig(ServletConfig servletConfig) {
		servletContext = servletConfig.getServletContext();
	}
	
	

}

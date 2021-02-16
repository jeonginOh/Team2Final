package com.spring.tour.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.tour.service.ServiceService;
import com.spring.tour.vo.AccomInfoVo;
import com.spring.tour.vo.Accom_serviceVo;
import com.spring.tour.vo.ImageVo;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService service;
	@Autowired ServletContext sc;

	@GetMapping("/tourmain")
	public String tourmain(HttpSession session,Model model) {
		try {
			System.out.println(session);
			String user_id=(String)session.getAttribute("user_id");
			System.out.println(session.getAttribute("user_id"));
			if(user_id.equals("")||user_id==null) {
				return ".userjoin.userlogin";
			}else {
				List<Accom_serviceVo> list = service.selectAccomServiceList(user_id);
				model.addAttribute("list",list);
				return ".service.tourmain";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ".userjoin.userlogin";
		}
	}

	@GetMapping("/accommain")
	public String accommain(HttpSession session,Model model) {
		try {
			System.out.println(session);
			String user_id=(String)session.getAttribute("user_id");
			System.out.println(session.getAttribute("user_id"));
			if(user_id.equals("")||user_id==null) {
				return ".userjoin.userlogin";
			}else {
				List<Accom_serviceVo> list = service.selectAccomServiceList(user_id);
				model.addAttribute("list",list);
				return ".service.accommain";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ".userjoin.userlogin";
		}
	} 
	@GetMapping("/accominsert")
	public String accominsertpage() {
		return ".service.accominsert"; 
	}
	@GetMapping("/accomupdate")
	public String accomupdatepage(String accom_service_number, Model model) {
		Accom_serviceVo vo1 = service.selectAccomService(accom_service_number);
		AccomInfoVo vo2=service.selectAccomInfo(accom_service_number);
		model.addAttribute("vo1",vo1);
		model.addAttribute("vo2",vo2);
		return "service.accomupdate"; 
	}
	@GetMapping("/accomdelete")
	public String accomdelete(String accom_service_number) {
		service.deleteAccomService(accom_service_number);
		return "/accommain"; 
	}
	@PostMapping("/accominsert")
	public String accominsert(String cate, String accom_name, String accom_addr, String accom_info_content, String accom_how, String accom_rule, String accom_checkinfo, String[] facility, String[] conven, MultipartFile[] img, HttpSession session, Model model) {
		try {
			String path = sc.getRealPath("/resources/upload");
			System.out.println(path);
			
			String user_id="";
			try {
				user_id=(String)session.getAttribute("user_id");
				System.out.println(user_id);
			}catch(Exception e){
				e.printStackTrace();
				return ".userjoin.userlogin"; 
			}
			String f=facility[0]; 
			for (int i = 1; i < facility.length; i++) {
				f+=","+facility[i];
			}
			String c=conven[0];
			for (int i = 1; i < conven.length; i++) {
				c+=","+conven[i];
			}
			Accom_serviceVo servicevo=new Accom_serviceVo(0, Integer.parseInt(cate), user_id, accom_name, accom_addr);
			AccomInfoVo infovo=new AccomInfoVo(0, 0, accom_info_content, accom_how, accom_rule, accom_checkinfo, f, c);
			service.insertAccomService(servicevo);
			service.inserAccomInfo(infovo);

			for(int i=0;i<img.length;i++) {
				String orgfilename=img[i].getOriginalFilename();
				String savefilename=UUID.randomUUID()+"_"+orgfilename;
				try {
					InputStream is=img[i].getInputStream();
					FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
					ImageVo vo=new ImageVo(0, orgfilename, savefilename, 0, Integer.parseInt(cate));
					service.insertImg(vo);
					
				} catch (IOException e) {
					e.printStackTrace();
					return "error";
				}
			}
			return "/accommain";
		}catch(Exception e) {
			e.printStackTrace();
			return ".userjoin.userlogin";
		}
	}
	
}

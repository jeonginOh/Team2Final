package com.spring.tour.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.tour.service.AccomService;
import com.spring.tour.vo.AccomServiceReviewJoinVo;
import com.spring.tour.vo.Accom_serviceVo;
import com.spring.tour.vo.ImageVo;

@RestController
public class AccomListController {
	@Autowired
	private AccomService service;
	
	@RequestMapping(value="/accomSelect_list",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public HashMap<String, Object> getAccomList(@RequestParam(value="facility[]", required = false)List<String> flist,
			@RequestParam(value="conven[]" , required = false)List<String> clist,
			@RequestParam(value="category" , defaultValue = "0")int category,
			@RequestParam(value="count",defaultValue = "1") int count,
			@RequestParam(value="startDate") Date startDate,
			@RequestParam(value="endDate") Date endDate,
			@RequestParam(value="maxprice" , defaultValue = "0")int maxprice,
			@RequestParam(value = "classification", defaultValue = "1") int classification // ���丹����, ���� �Ѽ� ���
			) {
		HashMap<String, Object> wholeMap=new HashMap<String, Object>();
		wholeMap.put("count", count);
		wholeMap.put("startDate", startDate);
		wholeMap.put("endDate", endDate);
		wholeMap.put("facility", flist);
		wholeMap.put("conven", clist);
		wholeMap.put("classification", classification);
		
		if(category!=0) {
			wholeMap.put("category", category);
		}
		if(maxprice!=0) {
			wholeMap.put("maxprice", maxprice);
		}
		
		int howLong=service.howLong(wholeMap);
		HashMap<String, Object> result=new HashMap<String, Object>(); //����� ���� �ؽø�
		
		List<AccomServiceReviewJoinVo> resultlist=service.accom_service_list(wholeMap);
		
		List<ImageVo> image=new ArrayList<ImageVo>();
		for(AccomServiceReviewJoinVo vo:resultlist) {
			int serviceNum=vo.getAccom_service_number();
			ImageVo ivo=service.accomRepresentImage(serviceNum);		
			image.add(ivo);
		}
		
		result.put("list",resultlist);
		result.put("image",image);
		result.put("classification", classification);
		result.put("howLong", howLong);
		return result;
	}
}

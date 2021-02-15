package com.spring.tour.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tour.dao.BookingDao;
import com.spring.tour.vo.AccomBookVo;
import com.spring.tour.vo.TourBookVo;

@Service
public class BookingService {
	@Autowired
	private BookingDao dao;
	
	public List<AccomBookVo> accomBookList(HashMap<String, Object> accomMap){
		return dao.accomBookList(accomMap);
	}
	public int accomCount(String user_id) {
		return dao.accomCount(user_id);
	}
	//���� ���� ���
	public List<AccomBookVo> accompastList(HashMap<String, Object> accomMap){
		return dao.accompastList(accomMap);
	}
	public int accompastCount(String user_id) {
		return dao.accompastCount(user_id);
	}
	//���� ��Ҹ��
	public List<AccomBookVo> accomCancleList(String user_id){
		return dao.accomCancleList(user_id);
	}
	
	
	public List<TourBookVo> tourBookList(HashMap<String, Object> tourMap){
		return dao.tourBookList(tourMap);
	}
	public int tourCount(String user_id) {
		return dao.tourCount(user_id);
	}
	//���� ������
	public List<TourBookVo> tourpastList(HashMap<String, Object> tourMap){
		return dao.tourpastList(tourMap);
	}
	public int tourpastCount(String user_id) {
		return dao.tourpastCount(user_id);
	}
	//���� ��Ҹ��
	public List<TourBookVo> tourCancleList(String user_id){
		return dao.tourCancleList(user_id);
	}
}
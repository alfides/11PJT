package com.model2.mvc.service.bbsEval.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.bbsEval.BbsEvalDao;
import com.model2.mvc.service.bbsEval.BbsEvalService;
import com.model2.mvc.service.domain.BbsEval;
import com.model2.mvc.service.domain.Product;

@Service("BbsEvalServiceImpl")
public class BbsEvalServiceImpl implements BbsEvalService {

	///Field
	@Autowired
	@Qualifier("BbsEvalDaoImpl")
	private BbsEvalDao bbsEvalDao;
	public void setBbsEvalDao(BbsEvalDao bbsEvalDao) {
		this.bbsEvalDao=bbsEvalDao;
	}
	
	///Constructor
	public void BbsEvalDao() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		bbsEvalDao.insertBbsEval(bbsEval);
		
	}

	@Override
	public BbsEval getBbsEval(int contentNo) throws Exception {
		// TODO Auto-generated method stub
		return bbsEvalDao.findBbsEval(contentNo);
	}

	@Override
	public Map<String, Object> getBbsEvalList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<BbsEval> list=bbsEvalDao.getBbsEvalList(search);
		int totalCount=bbsEvalDao.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		bbsEvalDao.updateBbsEval(bbsEval);
		
	}

	@Override
	public void removeBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		bbsEvalDao.removeBbsEval(bbsEval);
		
	}
	

}
package com.model2.mvc.service.bbsEval;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.BbsEval;
import com.model2.mvc.service.domain.Product;

/*
 * 상품관리를 추상화 캡슐화한 ProductService Interface
 */
public interface BbsEvalService {
	
	public void addBbsEval(BbsEval bbsEval) throws Exception;
	
	public BbsEval getBbsEval(int contentNo) throws Exception;
	
	public Map<String, Object> getBbsEvalList(Search search) throws Exception;
	
	public void updateBbsEval(BbsEval bbsEval) throws Exception;
	
	public void removeBbsEval(BbsEval bbsEval) throws Exception;
	
}
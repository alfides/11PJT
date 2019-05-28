package com.model2.mvc.service.bbsEval;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.BbsEval;
import com.model2.mvc.service.domain.Product;

public interface BbsEvalDao {
	
	public void insertBbsEval(BbsEval bbsEval) throws Exception;
	
	public BbsEval findBbsEval(int contentNo) throws Exception;
	
	public List<BbsEval> getBbsEvalList(Search search) throws Exception;
	
	public void updateBbsEval(BbsEval bbsEval) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void removeBbsEval(BbsEval bbsEval) throws Exception;
	
}
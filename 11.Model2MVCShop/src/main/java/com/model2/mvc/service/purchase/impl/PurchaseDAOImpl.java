package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDAO;

@Repository("purchaseDAOImpl")
public class PurchaseDAOImpl implements PurchaseDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDAOImpl(){
		System.out.println(this.getClass());
	}
	
	///Method
	public void insertPurchase(Purchase purchase) throws Exception{
		System.out.println(sqlSession.insert("PurchaseMapper.addPurchase", purchase));
	}
	
	public Purchase getPurchase(int tranNo) throws Exception{
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
		
	}
	
	public Purchase getPurchase2(int prodNo) throws Exception{
		return sqlSession.selectOne("PurchaseMapper.getPurchase2", prodNo);
	}
	
	public List<Purchase> getPurchaseList(Search search,String buyerId) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("buyerId", buyerId);
		System.out.println("±¸¸ÅDAO ¸Ê : "+map.toString());
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
		
	}
	
	public void updatePurchase(Purchase purchase) throws Exception{
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}
	
	public void removePurchase(Purchase purchase) throws Exception{
		sqlSession.delete("PurchaseMapper.removePurchase", purchase);
	}
	
	public int getTotalCount(Search search, String buyerId) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("buyerId", buyerId);
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}
	
		
}
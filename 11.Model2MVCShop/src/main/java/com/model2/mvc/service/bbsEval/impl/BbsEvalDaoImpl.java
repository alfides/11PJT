package com.model2.mvc.service.bbsEval.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.bbsEval.BbsEvalDao;
import com.model2.mvc.service.domain.BbsEval;
import com.model2.mvc.service.domain.Product;

@Repository("bbsEvalDaoImpl")
public class BbsEvalDaoImpl implements BbsEvalDao {

	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	///Constructor
	public BbsEvalDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void insertBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("BbsEvalMapper.addBbsEval", bbsEval);
		
	}

	@Override
	public BbsEval findBbsEval(int contentNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BbsEvalMapper.getBbsEval", contentNo);
	}

	@Override
	public List<BbsEval> getBbsEvalList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BbsEvalMapper.getBbsEvalList", search);
	}

	@Override
	public void updateBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("BbsEvalMapper.updateBbsEval", bbsEval);		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BbsEvalMapper.getTotalCount", search);
	}
	
	@Override
	public void removeBbsEval(BbsEval bbsEval) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("BbsEvalMapper.removeBbsEval", bbsEval);
		
	}

	
}
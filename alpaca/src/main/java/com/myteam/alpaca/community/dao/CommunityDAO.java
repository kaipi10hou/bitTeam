package com.myteam.alpaca.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.alpaca.community.vo.CommunityVO;





@Repository("communityDAO")
public class CommunityDAO{
	@Autowired
	private SqlSession sqlSession;
	

	public List selectAllCommunityList() throws DataAccessException {
		List<CommunityVO> communityList = sqlSession.selectList("mapper.community.selectAllCommunityList");
		return communityList;
	}

	 
	public int insertNewCommunity(Map communityMap) throws DataAccessException {
		int c_no = selectNewC_no();
		communityMap.put("c_no", c_no);
		sqlSession.insert("mapper.community.insertNewCommunity",communityMap);
		return c_no;
	}
    
	 
	public CommunityVO selectCommunity(int c_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectCommunity", c_no);
	}

	 
	public void updateCommunity(Map communityMap) throws DataAccessException {
		sqlSession.update("mapper.community.updateCommunity", communityMap);
	}

	 
	public void deleteCommunity(int c_no) throws DataAccessException {
		sqlSession.delete("mapper.community.deleteCommunity", c_no);
		
	}
	
	private int selectNewC_no() throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectNewC_no");
	}
	
	

}

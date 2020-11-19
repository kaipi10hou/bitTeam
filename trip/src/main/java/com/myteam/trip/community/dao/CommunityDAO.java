package com.myteam.trip.community.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.trip.community.vo.CommunityVO;



@Repository("communityDAO")
public class CommunityDAO{
	@Autowired
	private SqlSession sqlSession;

	 
	public List selectAllCommunitysList() throws DataAccessException {
		List<CommunityVO> communitysList = communitysList = sqlSession.selectList("mapper.community.selectAllCommunitysList");
		return communitysList;
	}

	
	 
	public int insertNewCommunity(Map communityMap) throws DataAccessException {
		int c_no = selectNewCommunityNO();
		communityMap.put("c_no", c_no);
		sqlSession.insert("mapper.community.insertNewCommunity",communityMap);
		return c_no;
	}
    
	
	 
	public CommunityVO selectCommunity(int communityNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectCommunity", communityNO);
	}

	 
	public void updateCommunity(Map communityMap) throws DataAccessException {
		sqlSession.update("mapper.community.updateCommunity", communityMap);
	}

	 
	public void deleteCommunity(int communityNO) throws DataAccessException {
		sqlSession.delete("mapper.community.deleteCommunity", communityNO);
		
	}
	
	private int selectNewCommunityNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectNewCommunityNO");
	}
	

}
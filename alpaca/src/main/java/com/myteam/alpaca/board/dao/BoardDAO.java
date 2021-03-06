package com.myteam.alpaca.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myteam.alpaca.board.vo.ArticleVO;






public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;

}

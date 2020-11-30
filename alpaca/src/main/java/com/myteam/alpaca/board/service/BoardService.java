package com.myteam.alpaca.board.service;

import java.util.List;
import java.util.Map;

import com.myteam.alpaca.board.vo.ArticleVO;
import com.myteam.alpaca.board.vo.ThumbnailVO;





public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
	public List<ThumbnailVO> listThumbnails() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	//public ArticleVO viewArticle(int articleNO) throws Exception;
	public Map viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	public void removeImageFile(int articleNO) throws Exception;
}
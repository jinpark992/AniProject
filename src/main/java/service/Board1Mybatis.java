package service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board1;
import model.Comment1;


@Repository
public class Board1Mybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NS = "mybatis.board1.";
	   		  public int insertBoard(Board1 board1) {
	   			 return sqlSession.insert(NS+"insertBoard", board1);
	   		 
		   }
	   		public int insertComment(String comment, int num, String nicname) {
	   			Map map = new HashMap();
	   			map.put("comment", comment);
	   			map.put("num", num);
	   			map.put("nicname", nicname);
	   			return sqlSession.insert(NS+"insertComment", map);
	   			
	   		}
	   		

	public int boardCount(String boardid) {
		return sqlSession.selectOne(NS+"boardCount",boardid);
	}
	   		  
	
	public List<Board1> boardList(int pageInt, int limit, String boardid){
		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("start", (pageInt-1)*limit + 1);
		map.put("end", pageInt*limit);
		System.out.println(map);
		return sqlSession.selectList(NS+"boardList",map);  
		
	}
	      

	public List<Comment1> commentList(int num){
		return sqlSession.selectList(NS+"commentList",num);
	   }
	
	
	public Board1 boardOne(int num){
		return sqlSession.selectOne(NS+"boardOne",num);
	}
	
	
	public int boardUpdate(Board1 board1) {
		 return sqlSession.insert(NS+"boardUpdate", board1);
		
		}
	
	public int boardDelete(int num) {
		return sqlSession.insert(NS+"boardDelete", num);
		
	}
	
	public int deleteComment(int ser) {
		return sqlSession.delete(NS+"deleteComment", ser);
	}
	
	public int updateComment(int ser, String content) {
		Map map = new HashMap();
		map.put("ser", ser);
		map.put("content", content);
		
		System.out.println(map);
		return sqlSession.update(NS+"updateComment", map);
	}
	
	public List<Board1> searchBoard(String query, int pageInt, int limit, String boardid) {
	       Map<String, Object> map = new HashMap<>();
	       
	      map.put("boardid", boardid);
	      map.put("start", (pageInt-1)*limit + 1);
	      map.put("end", pageInt*limit);
	      map.put("query", "%" + query + "%"); // 검색어를 포함하는 게시물 검색
	      System.out.println(map);
	       return sqlSession.selectList(NS + "searchBoard", map);
	   }
	   public int searchBoardCount(String boardid, String query) {
	       Map<String, Object> map = new HashMap<>();
	       map.put("boardid", boardid);
	       map.put("query", query);
	       return sqlSession.selectOne(NS + "searchBoardCount", map);
	   }

	   public List<Board1> searchBoardList(String boardid, String query, int pageInt, int limit) {
	       Map<String, Object> map = new HashMap<>();
	       map.put("boardid", boardid);
	       map.put("query", query);
	       map.put("start", (pageInt - 1) * limit + 1);
	       map.put("end", pageInt * limit);
	       return sqlSession.selectList(NS + "searchBoardList", map);
	   }
	   
	   public int incrementReadCount(int num) {
		      return sqlSession.update(NS + "incrementReadCount", num);
		       
		   }
	   
}//end class
	

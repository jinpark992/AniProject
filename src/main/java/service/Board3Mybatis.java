package service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import model.Board3;
import model.Comment3;



@Repository
public class Board3Mybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private    static final String NS = "mybatis.board3.";
	
	public int insertBoard(Board3 board) {
		return sqlSession.insert(NS+"insertBoard", board);
	}
	
	
	public int insertComment(String comment, int num, String nicname) {
		Map map = new HashMap();
		map.put("comment", comment);
		map.put("num", num);
		map.put("nicname", nicname);
		return sqlSession.insert(NS+"insertComment", map);
		

	}
	
	public int boardCount(String boardid) {
		return sqlSession.selectOne(NS+"boardCount", boardid);	
	}
	
	

	public List<Board3> boardList(String line, int pageInt, int limit, String boardid) {
		
		System.out.println(line);
		
		
		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("start", (pageInt-1)*limit + 1);
		map.put("end", pageInt*limit);
		
	  if (line!=null && line.contains("desc")) {
		  map.put("orderBy",line);
		  map.put("location", "");
	  } else {
		  map.put("orderBy","regdate desc");
		  map.put("location", line);
	  }
		
		
		
		return sqlSession.selectList(NS+"boardList", map);	
		
			
	}
	
	
	
	
	public List<Comment3> commentList(int num) {
		return sqlSession.selectList(NS+"commentList", num);		
	}
	
	
	public Board3 boardOne(int num) {
		return sqlSession.selectOne(NS+"boardOne", num);			
	}
	
	public int boardUpdate(Board3 board) {
		return sqlSession.insert(NS+"boardUpdate", board);
	

	}
	
	public int boardDelete(int num) {
		sqlSession.delete(NS+"commentDelete", num);
		return sqlSession.delete(NS+"boardDelete", num);
		
	}	
	
	
	public List<Board3> searchBoard(String query, int pageInt, int limit, String boardid) {
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

	public List<Board3> searchBoardList(String boardid, String query, int pageInt, int limit) {
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
	/*
	 * public List<Board3> boardListOrderByReadCnt(int pageInt, int limit, String
	 * boardid) { Map<String, Object> map = new HashMap<>(); map.put("boardid",
	 * boardid); map.put("start", (pageInt - 1) * limit + 1); map.put("end", pageInt
	 * limit); return sqlSession.selectList(NS + "boardListOrderByReadCnt", map); }
	 * 
	 * 
	 * public List<Board3> boardListOrderByRegDate(int pageInt, int limit, String
	 * boardid) { Map<String, Object> map = new HashMap<>(); map.put("boardid",
	 * boardid); map.put("start", (pageInt - 1) * limit + 1); map.put("end", pageInt
	 * limit); return sqlSession.selectList(NS + "boardListOrderByRegDate", map); }
	 * 
	 * 
	 * public List<Board3> boardListOrderByLocation(int pageInt, int limit, String
	 * boardid) { Map<String, Object> map = new HashMap<>(); map.put("boardid",
	 * boardid); map.put("start", (pageInt - 1) * limit + 1); map.put("end", pageInt
	 * limit); return sqlSession.selectList(NS + "boardListOrderByLocation", map); }
	 */
	

	public int updateComment(int ser, String updatedComment) {
		
		Map<String, Object> map = new HashMap<>();
	    map.put("ser", ser); 
	    map.put("updatedComment", updatedComment);
		System.out.println(map);
		return sqlSession.update(NS+"updateComment", map);
		
	}
	
	public int deleteComment(int ser) {
	
		return sqlSession.delete(NS+"deleteComment", ser);
		
	}
	

}  //end class

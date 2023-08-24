package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Active;
import mybatis.mapAnno;

@Repository
public class MapMybatis {
    
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Active> mapsList(Active ac) {
		System.out.println(ac);
		try {
			return sqlSession.getMapper(mapAnno.class).mapsList(ac);
	    
			} catch (Exception e) {
				e.printStackTrace();
			} 
			 return null;
	}
}


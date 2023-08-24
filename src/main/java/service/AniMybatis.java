package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Ani;
import mybatis.AniAnno;

@Service
public class AniMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertAni(Ani m) {
		return sqlSession.getMapper(AniAnno.class).insertAni(m);
	}	
	
	public List<Ani> selectAni(String email) {
		return sqlSession.getMapper(AniAnno.class).selectAni(email);
	}

	public int deleteAni(int ser) {
		return sqlSession.getMapper(AniAnno.class).deleteAni(ser);
	}
}
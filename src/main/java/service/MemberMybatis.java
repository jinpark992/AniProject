package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Member;
import mybatis.MemberAnno;


@Service
public class MemberMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMember(Member m) {
		return sqlSession.getMapper(MemberAnno.class).insertMember(m);
	}
	   
	public Member oneMember(String email) {
		return sqlSession.getMapper(MemberAnno.class).oneMember(email);
	}
	
	public Member oneNicname(String nicname) {
		return sqlSession.getMapper(MemberAnno.class).oneNicname(nicname);
	}
	
	public int updateMember(Member newm) {
		return sqlSession.getMapper(MemberAnno.class).updateMember(newm);
	}

	public int deleteMember(String email) {
		return sqlSession.getMapper(MemberAnno.class).deleteMember(email);
	}
	   
	public int changePass(String email, String newPass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("newPass", newPass);
		return sqlSession.getMapper(MemberAnno.class).changePass(map);
	}
	
	public List<Member> memberList() {
		return sqlSession.getMapper(MemberAnno.class).memberList();
	}

	public Member findMemberByNickname(String nicname) {
		return sqlSession.getMapper(MemberAnno.class).findMemberByNickname(nicname);
	}
}
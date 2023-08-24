package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberAnno {
	
	@Insert("insert into animember values (#{email}, #{pass}, #{nicname}, "
			+ "#{birthday}, sysdate)")
	int insertMember(Member m);
	
	@Select ("select *  from animember where email = #{email}")
	Member oneMember(String email);
	
	@Select ("select email, pass, nicname, to_char(birthday, 'yyyymmdd') birthday  from animember where nicname = #{nicname}")
	Member oneNicname(String nicname);
	
	@Update ("update animember set email=#{email}, pass=#{pass}, nicname=#{nicname}, "
			+ " birthday=#{birthday} where email = #{email}")
	int updateMember(Member newm);
	
	@Delete ("delete from animember where email = #{email}")
	int deleteMember(String pass);
	
	@Update ("update animember set pass=#{newPass} where email = #{email}")
	int changePass(Map<?, ?> map);
	
	@Select ("select * from animember")
	List<Member> memberList();
	
	@Select ("select *  from animember where nicname = #{nicname}")
	Member findMemberByNickname(String nicname);
}
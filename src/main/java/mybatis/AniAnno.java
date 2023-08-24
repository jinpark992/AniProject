package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Ani;

public interface AniAnno {

	
	@Insert("insert into myanimal values (myaniseq.nextval, #{email}, #{groupid}, #{neuter}, "
			+ "#{name}, #{age}, #{gender}, #{picture})")
	int insertAni(Ani m);

	@Select ("select *  from myanimal where email = #{email}")
	List<Ani> selectAni(String email);
	
	@Delete ("delete from myanimal where ser = #{ser}")
	int deleteAni(int ser);
}

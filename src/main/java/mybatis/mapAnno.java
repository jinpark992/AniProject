package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;


import model.Active;


public interface mapAnno {
	@Select("SELECT * FROM active WHERE con = #{con} and location1 =  #{location1} and location2 = #{location2}  ORDER BY active_id DESC")
	List<Active> mapsList(Active ac);   // "SELECT * FROM active WHERE con = ? and location1 = ? and location2 = ?  ORDER BY active_id DESC";
	

}

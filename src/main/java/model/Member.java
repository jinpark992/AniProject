package model;

import java.util.Date;

public class Member {

   private String email;
   private String pass;
   private String nicname;
   private String birthday;
   private Date rdate;
   
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPass() {
      return pass;
   }
   public void setPass(String pass) {
      this.pass = pass;
   }
   public String getNicname() {
      return nicname;
   }
   public void setNicname(String nicname) {
      this.nicname = nicname;
   }
   public String getBirthday() {
      return birthday;
   }
   public void setBirthday(String birthday) {
      this.birthday = birthday;
   }
   public Date getRdate() {
      return rdate;
   }
   public void setRdate(Date rdate) {
      this.rdate = rdate;
   }
@Override
public String toString() {
	return "Member [email=" + email + ", pass=" + pass + ", nicname=" + nicname + ", birthday=" + birthday + ", rdate="
			+ rdate + "]";
}


}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<form  name="f" 
	action="${pageContext.request.contextPath}/member/memberUpdatePro" method="post">
		<table class="table table-bordered">
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="email"  class="form-control" readonly="readonly"
					value="${m.email}">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pass"  class="form-control" ></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nicname"  class="form-control"  
					value="${m.nicname}">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="2">
					<input type="text" name="birthday"  class="form-control" readonly="readonly"
					value="${m.birthday.split(' ')[0]}">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary mt-0" 
					style="background-color: #19110B; border: #19110B;" 
					value="변경사항 저장하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
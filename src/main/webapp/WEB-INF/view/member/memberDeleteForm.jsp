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
	<form class="w3-container" action="${pageContext.request.contextPath}/member/memberDeletePro" method="post">
	<table class="table table-bordered">
		<tr>
			<td>비밀번호</td> 
			<td>
				<input  class="form-control" type="password" name="pass">
			</td>	
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary mt-0" type="submit" 
			style="background-color: #19110B; border: #19110B; color:white;" value="탈퇴하기">
			</td>
		</tr>
	</table>	
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function passChk(form) {
	if (form.chgpass1.value != form.chgpass2.value){
		alert("변경 비밀번호와 재입력 번호가 다릅니다")
		form.chgpass2.value=""
		form.chgpass2.focus()
		return false;
	} else {
		return true;
	}	
}

</script>
</head>

<body>
<br>
	<form  name="f" action="${pageContext.request.contextPath}/member/memberPassPro" method="post" 
	onsubmit="return passChk(this)">
	<input type="hidden" name="email" value="${email}">
	<table class="table table-bordered">
	
		<tr>
			<td>현재 비밀번호</td>
			<td>
				<input type="password" class="form-control" name="pass">
			</td>	
		</tr>
		<tr>
			<td>변경 비밀번호</td>
			<td>
				<input type="password" class="form-control"	name="chgpass1">
			</td>
		</tr>
		<tr>
			
			<td>변경 비밀번호 재입력</td>
			<td>
				<input type="password" class="form-control"	name="chgpass2">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-primary mt-0" 
				style="background-color: #19110B; border: #19110B; color:white;" value="비밀번호 변경">
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>
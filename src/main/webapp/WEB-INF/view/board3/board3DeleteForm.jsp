<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>게시판 삭제화면</title>
</head>
<body>
<div class="container mt-5 col d-flex justify-content-center">
	<form class="w3-container" action="${pageContext.request.contextPath}/board3/board3DeletePro"
	name="f" method="post">
		<input class="form-control" type="hidden" name="num" value="${num}">
		<table class="w3-table-all">
			<caption></caption>
			<tr>
				<td>게시글 비밀번호</td>
				<td><input class="form-control" type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input class="form-control col d-flex justify-content-center btn btn-primary" 
				 type="submit" value="게시글 삭제" ></td>
			</tr>	 			
		</table>
	</form>
	</div>
</body>
</html>
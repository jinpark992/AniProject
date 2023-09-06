<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- core 태그가 있어야 데이터를 가져올수가 있음 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}
/*    .container {
            width: 70%;
            margin: auto;
            background-color: white;
            padding: 20px;
            margin-top: 50px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        } */
label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 15px;
	font-size: 14px;
}

textarea {
	resize: vertical;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h2>쪽지 보내기</h2>
		<form action="${pageContext.request.contextPath}/message/messageSend"
			method="post">
			<label for="sender">보내는 사람(닉네임)</label> 
			<input type="text" id="sender" name="sender" value="${nicname}" readonly="readonly"><br>
			<!-- 로그인 한 id의 nicname(발신자) -->
			<label for="receiver">받는 사람</label> 
			<select id="receiver" name="receiver" required>
				<c:forEach items="${li}" var="nic">
					<!-- select box 만들기 -->
					<c:if test="${nic ne nicname }">
						<option value="${nic}">${nic}</option>
					</c:if>
				</c:forEach>
			</select> <label for="subject">제목:</label> <input type="text" id="subject"
				name="subject" required><br> <label for="content">쪽지
				내용:</label>
			<textarea id="message" name="content" rows="4" cols="50" required></textarea>
			<br> <input type="submit" value="전송">
		</form>
	</div>
</body>
</html>
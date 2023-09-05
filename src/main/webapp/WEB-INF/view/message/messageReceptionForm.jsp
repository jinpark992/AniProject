<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- core 태그가 있어야 데이터를 가져올수가 있음, jstl을 사용하기 위해 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.con {
	display: flex;
	justify-content: space-between;
	width: 70%;
	margin: auto;
	background-color: white;
	padding: 20px;
	margin-top: 50px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.inbox {
	flex: 1; /* 수신함을 왼쪽으로 정렬 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 10px;
}

.outbox {
	flex: 1; /* 발신함을 오른쪽으로 정렬 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 10px;
	overflow-y: auto; /* 콘텐츠가 넘칠 때 스크롤 가능하도록 설정 */
	max-height: 300px; /* 스크롤 높이를 조정하세요. */
}

.inbox h2, .outbox h2 {
	font-weight: bold;
	margin: 0;
}

.inbox p, .outbox p {
	margin: 0;
}

.inbox {
	background-color: #e6f7ff; /* 수신함 스타일 */
}

.outbox {
	background-color: #ffedcc; /* 발신함 스타일 */
}
</style>
</head>
<body>

<div class="con">
		<!-- 수신함 -->
		<div class="inbox">
			<h2>수신함</h2>
			<div class="message">
				<h3>제목</h3>
				<p>보낸 사람: 보낸사람1</p>
				<p>내용: 이 쪽지는 테스트용입니다.</p>
			</div>
			<div class="message">
				<h3>쪽지 제목 2</h3>
				<p>보낸 사람: 보낸사람2</p>
				<p>내용: 이 쪽지도 테스트용입니다.</p>
			</div>
		</div>

		<!-- 발신함 -->
		<div class="outbox">
			<h2>발신함</h2>

			<c:forEach items="${Re}" var="message">
				<!-- items는 Controller에서 데이터를 가져오기 위함, var는 데이터를 찍기위해 사용 -->
				<div class="message">
					<h3>제목: ${message.subject}</h3>
					<!-- 제목 -->
					<p>보낸 사람: ${message.sender}</p>
					<!-- 보낸 사람(현재 로그인 한 nicname으로 수정) -->
					<p>받는 사람: ${message.receiver}</p>
					<!-- 받는 사람 -->
					<p>내용: ${message.content}</p>
					<!-- 보낸 내용 -->
					<p>발신일: <fmt:formatDate pattern="yyyy-MM-dd" value="${message.send_date}" /></p>
					<p>----------------------------------------------------------------------------------------</p>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>
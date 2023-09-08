<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha384-oG7BpG2FvZK+6I0uR85s3lwnTlzOMLr6YgdzYrF2RtE/6b5FJ0nL3IhG9XsS+JfS"
	crossorigin="anonymous">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.container {
	margin-top: 50px;
	display: flex;
	justify-content: space-between;
	gap: 20px;
}

.message {
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #fff;
}

.inbox {
	background-color: #e6f7ff;
	width: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.outbox {
	background-color: #ffedcc;
	width: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.message h3 {
	font-weight: bold;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
}

.table th {
	background-color: #f0f0f0;
}

.table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

.button-delete {
	background-color: #ff4d4d; /* 배경색 */
	color: #fff; /* 텍스트 색상 */
	border: none; /* 테두리 없음 */
	padding: 8px 12px; /* 내부 여백 */
	border-radius: 4px; /* 둥근 모서리 */
	cursor: pointer; /* 커서를 손가락 모양으로 변경 */
}

.button-delete:hover {
	background-color: #e60000; /* 마우스 호버 상태일 때 배경색 */
}
</style>

<script>
function deleteMessage(ser) { 
	alert(ser)
    if (confirm('이 메시지를 삭제하시겠습니까?')) {
        fetch('${pageContext.request.contextPath}/message/deleteMessage?ser='+ser, {
            method: 'GET'
        })
        .then(response => {
        	location.href = "${pageContext.request.contextPath}/message/messageReceptionForm";
            
           
        })
      
        .catch(error => {
            console.log('오류:', error);
        });
    }
}
</script>
</head>
<body>

	<div class="container">

		<!-- 수신함 -->
		<div class="inbox">
			<h2 class="mb-3">수신함</h2>
			<table class="table">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>보낸사람</th>
						<th>받는사람</th>
						<th>메세지삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="inMessage" items="${re}">
						<tr>
							<td>${inMessage.subject}</td>
							<td>${inMessage.content}</td>
							<td>${inMessage.sender}</td>
							<td>${inMessage.receiver}</td>
							<td>
								<button class="button-delete"
									onclick="deleteMessage('${inMessage.ser}')">
									<i class="fas fa-trash"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 발신함 -->
		<div class="outbox">
			<h2 class="mb-3">발신함</h2>
			<table class="table">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>보낸사람</th>
						<th>받는사람</th>
						<th>메세지삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="outmessage" items="${di}">
						<tr>
							<td>${outmessage.subject}</td>
							<td>${outmessage.content}</td>
							<td>${outmessage.sender}</td>
							<td>${outmessage.receiver}</td>
							<td>
								<button class="button-delete"
									onclick="deleteMessage('${outmessage.ser}')">
									<i class="fas fa-trash"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>

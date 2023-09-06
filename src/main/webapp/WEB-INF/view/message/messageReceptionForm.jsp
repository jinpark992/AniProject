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

.container {
	margin-top: 50px;
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
}

.outbox {
	background-color: #ffedcc;
}

.message h3 {
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="container">
    <div class="row">
        <!-- 수신함 -->
        <div class="col-md-6">
            <div class="inbox">
                <h2 class="mb-3">수신함</h2>  <!-- 구현중.. -->
                <c:forEach items="" var="inboxMessage">
                    <div class="message">
                        <h3>제목: ${inboxMessage.subject}</h3>
                        <p>보낸 사람: ${inboxMessage.sender}</p>
                        <p>내용: ${inboxMessage.content}</p>
                        <p>
                            발신일:
                            <fmt:formatDate pattern="yyyy-MM-dd"
                                value="${inboxMessage.send_date}" />
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- 발신함 -->
        <div class="col-md-6">
            <div class="outbox">
                <h2 class="mb-3">발신함</h2>
                <c:forEach items="${di}" var="message">
                    <div class="message">
                        <h3>제목: ${message.subject}</h3>
                        <p>보낸 사람(보낸 사람쪽에 로그인 한 아이디 저장 하기 되게 하기): ${message.sender}</p>
                        <p>받는 사람: ${message.receiver}</p>
                        <p>내용: ${message.content}</p>
                        <p>
                            발신일:
                            <fmt:formatDate pattern="yyyy-MM-dd"
                                value="${message.send_date}" />
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>
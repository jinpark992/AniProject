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
                 <c:forEach items="${re}" var="inMessage">
                    <div class="message">
                        <h3>제목: ${inMessage.subject}</h3>  
                        <p>보낸 사람: ${inMessage.receiver}</p>
                        <p>받는 사람: ${inMessage.sender}</p>
                        <p>내용: ${inMessage.content}</p>
                        <p>
                            수신일:
                            <fmt:formatDate pattern="yyyy-MM-dd"
                                value="${inMessage.send_date}" />
                        </p>
                    </div>
                </c:forEach> 
            </div>
        </div>

        <!-- 발신함 -->
        <div class="col-md-6">
            <div class="outbox">
                <h2 class="mb-3">발신함</h2>
                <c:forEach items="${di}" var="outmessage">
                    <div class="message">
                        <h3>제목: ${outmessage.subject}</h3>
                        <p>보낸 사람: ${outmessage.sender}</p>
                        <p>받는 사람: ${outmessage.receiver}</p>
                        <p>내용: ${outmessage.content}</p>
                        <p>
                            발신일:
                            <fmt:formatDate pattern="yyyy-MM-dd"
                                value="${outmessage.send_date}" />
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- -------------------------------- 게시판 형태로 변환 하기 ---------------------------------------------------------->
















</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board1List}</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/free.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<style>
.container {
	position: relative;
}

.write-button {
	margin-top: 10px; /* Adjust the margin as needed */
}

.recommendation {
	font-weight: normal; /* 추천 유형에 대한 기본 스타일 */
}

.호텔 {
	color: blue; /* "호텔"에 대한 스타일 */
	font-weight: bold;
}

.상품 {
	color: green; /* "상품"에 대한 스타일 */
	font-weight: bold;
}

.여행지 {
	color: orange; /* "여행지"에 대한 스타일 */
	font-weight: bold;
}

.location {
	font-weight: normal; /* 위치에 대한 기본 스타일 */
}

.서울 {
	color: blue; /* "서울"에 대한 스타일 */
	font-weight: bold;
}

.부산 {
	color: green; /* "부산"에 대한 스타일 */
	font-weight: bold;
}

.대구 {
	color: orange; /* "대구"에 대한 스타일 */
	font-weight: bold;
}

.광주 {
	color: red; /* "광주"에 대한 스타일 */
	font-weight: bold;
}

.제주 {
	color: purple; /* "제주도"에 대한 스타일 */
	font-weight: bold;
}

a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 상위 엘리먼트의 텍스트 색상 상속 */
}
/* 클래스 clean-link에 스타일 적용 */
.clean-link a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 상위 엘리먼트의 텍스트 색상 상속 */
}
</style>

<script>
	// ajax 기능
	function likeChk(num) { /* 이 함수는 좋아요 버튼을 누를 때 호출되는 함수입니다. 함수에는 하나의 매개변수인 num이 전달되는데, 이 값은 어떤 항목에 대한 좋아요를 누르는지의 정보를 가지고 있습니다. */
		alert(num); // 이 부분은 디버깅을 위해 num 값을 경고창으로 표시하는 역할을 합니다. 실제 애플리케이션에서는 디버깅을 위해 사용되었던 부분.

		// $.get을 통해 AJAX 요청을 보냅니다.
		$.get("${pageContext.request.contextPath}/board1/board1likeChk?num="
				+ num, // jQuery의 AJAX 메서드 중 하나인 $.get을 사용하여 서버에 AJAX GET 요청을 보냅니다.
		// ${pageContext.request.contextPath}/board1/board1likeChk?num="+num는 요청할 URL을 생성
		function(data, status) { //AJAX 요청이 성공적으로 완료되면 실행되는 함수입니다. 응답 데이터와 상태 정보를 받아옵니다.    
			console.log("Data: " + data + "\nStatus: " + status);// 응답 데이터와 상태 정보를 콘솔에 출력합니다. 이 부분은 디버깅을 위해 사용.
			let likebutton = document.querySelector("#like-button" + num); // like-button ID를 가진 HTML 요소를 찾아와 likebutton 변수에 할당합니다. 
			// num을 이용하여 각 항목의 고유한 ID를 생성합니다.
			let likespan = document.querySelector("#s" + num); // s ID를 가진 HTML 요소를 찾아와 likespan 변수에 할당합니다. 이것은 조회수를 나타내는 HTML 요소.
			console.log(data);
			let retdata = data.split(","); // 서버 응답 데이터인 data를 쉼표 ,를 기준으로 분할하여 배열로 저장합니다.

			likespan.innerHTML = retdata[1]; // 분할된 데이터 중 두 번째 요소를 likespan의 내용으로 설정합니다. 이것은 좋아요 수를 업데이트하는 부분.
			if (retdata[0] == "ok") {
				likebutton.style.backgroundColor = "red"; // "ok"인 경우 버튼 배경색을 빨간색으로 변경
			} else {
				likebutton.style.backgroundColor = "grey"; // 그 외의 경우 버튼 배경색을 회색으로 변경
			}
		});
	}
</script>
</head>

<body>

	<div class="container">
		<div class="d-flex justify-content-between align-items-center"
			style="background-color: #007bff; padding: 10px;">
			<div class="d-flex justify-content-between align-items-center">
				<h3 class="board-heading" style="color: #fff;">동네 친구 찾기:)</h3>
				<span class="ml-auto">
					<button
						onclick="location.href='${pageContext.request.contextPath}/board1/board1Room'"
						class="btn btn-primary">모임장소 검색하기</button>
					
				</span>
			</div>
		</div>
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>닉네임</th>
					<th>제목</th>
					<th>이미지</th>
					<th>입력일</th>
					<th>조회수</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list}">
					<%-- 이 부분은 ${list}에 저장된 게시물 목록을 순회하면서 각 게시물 정보를 ${b}라는 변수에 할당하며 반복하는 부분입니다. --%>
					<tr>
						<td>${boardNum}</td>
						<td>${b.name}(<span class="location ${b.location}">${b.location}</span>)
							<a class="send-message-button"
							href="${pageContext.request.contextPath}/message/messageSendForm">
								<i class="far fa-envelope"></i> <!-- 쪽지보내기 -->
						</a>
						</td>
						<td class="clean-link"><a
							href="${pageContext.request.contextPath}/board1/board1Comment?num=${b.num}&boardNum=${boardNum}">
								${b.subject}[${b.totalcount }] </a></td>
						<c:set var="boardNum" value="${boardNum-1}" />
						<td><c:if test="${not empty b.file1}">
								<div style="display: flex; align-items: center;">
									<div style="margin-right: 10px;">
										<img
											src="${pageContext.request.contextPath}/view/board1/images/${b.file1}"
											width="150px" alt="Image">
									</div>
								</div>
							</c:if></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regdate}" /></td>
						<td>${b.readcnt}</td>

						<td>
							<button class="like-button" data-board-num="${b.num}"
								data-action="like" id="like-button${b.num}"
								onclick="likeChk('${b.num}')">
								<i class="fas fa-heart"></i> [<span id="s${b.num}"></span>]
								<!-- 좋아요 -->
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="search-bar">
			<form action="${pageContext.request.contextPath}/board1/board1List"
				method="get" class="d-flex">
				<input type="text" id="search-input" name="keyword" placeholder="검색"
					class="form-control mr-2"> <select name="column"
					class="form-select">
					<option value="titleContent" selected>제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="nicname">닉네임</option>
					<option value="comment">댓글</option>
				</select>
				<button id="search-button" type="submit"
					class="btn btn-primary ml-2">검색</button>
			</form>
		</div>
		<div class="pagination">
			<!-- 페이지 링크... -->
		</div>
		<a class="write-button"
			href="${pageContext.request.contextPath}/board1/board1Form">글쓰기</a>
	</div>


	<div class="pagination">
		<c:if test="${start < bottomLine }">
			<a href="#" class="active">[이전]</a>
		</c:if>
		<c:if test="${start > bottomLine }">
			<a
				href="${pageContext.request.contextPath}/board1/board1List?pageNum=${start-bottomLine}"
				class="">[이전]</a>
		</c:if>

		<c:forEach var="p" begin="${start}" end="${end}">
			<a
				href="${pageContext.request.contextPath}/board1/board1List?pageNum=${p}"
				class="<c:if test="${pageInt==p}">gold</c:if>">${p}</a>
		</c:forEach>

		<c:if test="${end >= maxPage }">
			<a href="#" class="white">다음</a>
		</c:if>
		<c:if test="${end <  maxPage }">
			<a
				href="${pageContext.request.contextPath}/board1/board1List?pageNum=${start+bottomLine}"
				class="w3-button ">[다음]</a>
		</c:if>
	</div>

</body>
</html>

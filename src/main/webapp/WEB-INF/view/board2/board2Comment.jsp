<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.subject}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/free.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0; /* 밝은 회색 배경색 */
	margin: 0;
	padding: 0;
}

.con {
	margin-top: 20px;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.board-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #fff; /* 밝은 흰색 배경색 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.board-table th, .board-table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

.board-image {
	max-width: 100%;
	height: auto;
}

.board-button {
	padding: 5px 10px;
	margin: 5px;
	background-color: #007bff; /* 파란색 버튼 배경색 */
	color: #fff; /* 버튼 텍스트 색상 */
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.board-button:hover {
	background-color: #0056b3; /* 마우스 호버 시 밝은 파란색으로 변경 */
}

.comment-input {
	width: 100%;
	resize: none;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.comment-button {
	padding: 5px 10px;
	margin: 5px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.comment-button:hover {
	background-color: #0056b3;
}

.comment-list {
	padding-top: 20px;
	border-top: 1px solid #ccc;
}

.comment-item {
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	background-color: #f8f9fa;
	border-radius: 4px;
}

.comment-right {
	text-align: right;
}

.comment {
	display: flex;
	flex-direction: row;
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	align-items: center;
	border-radius: 4px;
	background-color: #fff;
}

.comment-content {
	flex: 1;
	font-size: 14px;
}

.comment-actions {
	display: flex;
	flex-direction: row;
	margin-left: 10px;
}

.edit-button, .delete-button {
	margin-right: 10px;
	background-color: #28a745; /* 초록색 버튼 배경색 */
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.edit-button:hover, .delete-button:hover {
	background-color: #1e7e34; /* 마우스 호버 시 밝은 초록색으로 변경 */
}

.comment-date {
	font-size: 12px;
	color: #888;
}
</style>

<script>
	//JavaScript 코드 시작

	//엔터 키(키 코드 13)를 눌렀을 때 호출되는 함수
	function enterkey(num) {
		if (window.event.keyCode == 13) {
			// 엔터 키를 눌렀을 때 commentPro 함수 호출
			commentPro(num);
		}
	}

	//댓글 작성 및 전송을 처리하는 함수
	function commentPro(num) {
		// 입력한 댓글 내용 가져오기
		let comment = document.querySelector("#comment").value;
		console.log(comment);

		// 서버로 댓글을 비동기적으로 전송 (AJAX 요청)
		$.get(
				"${pageContext.request.contextPath}/board2/board2CommentPro?comment="
						+ comment + "&num=" + num, function(data, status) {
					console.log("Data: " + data + "\nStatus: " + status);

					// 서버에서 받은 데이터를 댓글 목록의 맨 위에 추가
					let commentList = document.querySelector("#commentList");
					commentList.innerHTML = data + commentList.innerHTML;
					console.log(commentList.innerHTML);
				});

		// 입력 필드 초기화
		document.querySelector("#comment").value = '';
	}

	//댓글 삭제 기능을 수행하는 함수
	function deleteComment(ser) {
		// 사용자에게 댓글 삭제 여부를 묻는 확인 대화상자 표시
		let chk = confirm("댓글을 삭제하겠습니까?");

		if (chk) {
			// 사용자가 확인하면 해당 댓글을 서버에서 삭제 (AJAX 요청)
			$
					.get(
							"${pageContext.request.contextPath}/board2/board2DeleteCommentPro?ser="
									+ ser,
							function(data, state) {
								console.log("Data: " + data + "\nStatus: "
										+ status);
								if (data == "ok") {
									// 삭제 후 페이지 새로고침
									location.href = "${pageContext.request.contextPath}/board2/board2Comment?num=${board2.num}&boardNum=${boardNum}";
								}
							});
		}
	}

	//댓글 수정 기능을 수행하는 함수
	function editComment(ser, contentText) {
		// 사용자에게 댓글 수정 여부를 묻는 확인 대화상자 표시
		let chk = confirm("댓글을 수정하시겠습니까?");

		if (chk) {
			// 사용자가 확인하면 새로운 댓글 내용을 입력받음
			let newContent = prompt("새로운 댓글 내용을 입력하세요:", contentText);

			if (newContent !== null) {
				// 사용자가 확인하면 새로운 내용을 서버에 전송 (AJAX 요청)하고 페이지 새로고침
				$
						.get(
								"${pageContext.request.contextPath}/board2/board2CommentEditPro?ser="
										+ ser + "&content=" + newContent,
								function(data, state) {
									console.log("Data: " + data + "\nStatus: "
											+ status);
									if (data == "ok") {
										location.href = "${pageContext.request.contextPath}/board2/board2Comment?num=${board2.num}&boardNum=${boardNum}";
									}
								});

				alert("댓글이 수정되었습니다: " + newContent);
			} else {
				alert("댓글 수정이 취소되었습니다.");
			}
		} else {
			alert("댓글 수정이 취소되었습니다.");
		}
	}

	//JavaScript 코드 종료
</script>








</head>


<body>
	<div class="con">
		<table class="board-table">
			<tr>
				<th>지역</th>
				<td>${board2.location}</td>
				<th>추천</th>
				<td>${board2.recommendation}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${board2.price}원</td>
				<th>배송비</th>
				<td>${board2.shipping}원</td>
			</tr>
			<tr>
				<th>글번호</th>
				<td>${boardNum}</td>
				<th>조회수</th>
				<td>${board2.readcnt}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board2.name}</td>
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board2.regdate}" /></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td colspan="3"><img
					src="${pageContext.request.contextPath}/view/board2/images/${board2.file1}"
					class="board-image" /></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">${board2.subject}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3">${board2.content}</td>
			</tr>
			<tr>
				<td colspan="4">
					<p class="d-flex justify-content-end">
						<input type="button" value="글수정"
							onclick="document.location.href='${pageContext.request.contextPath}/board2/board2UpdateForm?num=${board2.num}&boardNum=${boardNum}'"
							class="btn btn-primary board-button" /> <input type="button"
							value="글삭제"
							onclick="document.location.href='${pageContext.request.contextPath}/board2/board2DeleteForm?num=${board2.num}'"
							class="btn btn-danger board-button" /> <input type="button"
							value="목록"
							onclick="document.location.href='${pageContext.request.contextPath}/board2/board2List'"
							class="btn btn-secondary board-button" />
					</p>
				</td>
			</tr>
			<tr>
				<!-- 댓글 입력 폼 -->
				<td colspan="3"><textarea rows="1" class="comment-input"
						onkeyup="enterkey('${board2.num}')" cols="50" id="comment"></textarea>
				</td>
				<td>
					<!-- 총 댓글 수 표시 --> <span id="totalCommentCount">총
						댓글(${commentLi.size()})</span> <!-- 댓글 입력 버튼 --> <input type="button"
					value="입력(enter 입력)" onclick="commentPro('${board2.num}')"
					class="btn btn-primary comment-button" />
				</td>
			</tr>
			<tr>
				<!-- 댓글 목록 출력 -->
				<td colspan="3" class="comment-list" id="commentList"><c:forEach
						var="c" items="${commentLi}">
						<div class="comment-item" id="comment_${c.ser}">
							<p>${c.toHtml()}</p>
						</div>
					</c:forEach></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>



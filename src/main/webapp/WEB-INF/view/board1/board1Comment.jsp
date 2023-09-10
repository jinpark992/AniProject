<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board1.subject}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/free.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.con {
	margin-top: 20px;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.board-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #fff;
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
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.board-button:hover {
	background-color: #0056b3;
}

.comment-input {
	width: calc(100% - 12px);
	resize: none;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin: 6px;
}

.comment-button {
	padding: 5px 10px;
	margin: 5px;
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
	background-color: #28a745;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.edit-button:hover, .delete-button:hover {
	background-color: #1e7e34;
}

.comment-date {
	font-size: 12px;
	color: #888;
}
</style>

<script>
	// JavaScript 코드 시작

	function enterkey(num) {
		if (window.event.keyCode == 13) {
			commentPro(num);
		}
	}

	function commentPro(num) {
		let comment = document.querySelector("#comment").value;
		console.log(comment);

		$.get(
				"${pageContext.request.contextPath}/board1/board1CommentPro?comment="
						+ comment + "&num=" + num, function(data, status) {
					console.log("Data: " + data + "\nStatus: " + status);

					let commentList = document.querySelector("#commentList");
					commentList.innerHTML = data + commentList.innerHTML;
					console.log(commentList.innerHTML);
				});

		document.querySelector("#comment").value = '';
	}

	function deleteComment(ser) {
		let chk = confirm("댓글을 삭제하겠습니까?");

		if (chk) {
			$
					.get(
							"${pageContext.request.contextPath}/board1/board1DeleteCommentPro?ser="
									+ ser,
							function(data, state) {
								console.log("Data: " + data + "\nStatus: "
										+ status);
								if (data == "ok") {
									location.href = "${pageContext.request.contextPath}/board1/board1Comment?num=${board1.num}&boardNum=${boardNum}";
								}
							});
		}
	}

	function editComment(ser, contentText) {
		let chk = confirm("댓글을 수정하시겠습니까?");

		if (chk) {
			let newContent = prompt("새로운 댓글 내용을 입력하세요:", contentText);

			if (newContent !== null) {
				$
						.get(
								"${pageContext.request.contextPath}/board1/board1CommentEditPro?ser="
										+ ser + "&content=" + newContent,
								function(data, state) {
									console.log("Data: " + data + "\nStatus: "
											+ status);
									if (data == "ok") {
										location.href = "${pageContext.request.contextPath}/board1/board1Comment?num=${board1.num}&boardNum=${boardNum}";
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

	// JavaScript 코드 종료
</script>

</head>


<body>
	<div class="con">
		<table class="board-table">
			<tr>
				<th>지역</th>
				<td>${board1.location}</td>
				<th>#</th>
				<td></td>

			</tr>

			<tr>
				<th>글번호</th>
				<td>${boardNum}</td>
				<th>조회수</th>
				<td>${board1.readcnt}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board1.name}</td>
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board1.regdate}" /></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td colspan="3"><img
					src="${pageContext.request.contextPath}/view/board1/images/${board1.file1}"
					class="board-image" /></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">${board1.subject}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3">${board1.content}</td>
			</tr>
			<tr>
				<td colspan="4">
					<p class="d-flex justify-content-end">
						<input type="button" value="글수정"
							onclick="document.location.href='${pageContext.request.contextPath}/board1/board1UpdateForm?num=${board1.num}&boardNum=${boardNum}'"
							class="btn btn-primary board-button" /> <input type="button"
							value="글삭제"
							onclick="document.location.href='${pageContext.request.contextPath}/board1/board1DeleteForm?num=${board1.num}'"
							class="btn btn-danger board-button" /> <input type="button"
							value="목록"
							onclick="document.location.href='${pageContext.request.contextPath}/board1/board1List'"
							class="btn btn-secondary board-button" />
					</p>
				</td>
			</tr>
			<tr>
				<!-- 댓글 입력 폼 -->
				<td colspan="3"><textarea rows="1" class="comment-input"
						onkeyup="enterkey('${board1.num}')" cols="50" id="comment"></textarea>
				</td>
				<td>
					<!-- 총 댓글 수 표시 --> <span id="totalCommentCount">총
						댓글(${commentLi.size()})</span> <!-- 댓글 입력 버튼 --> <input type="button"
					value="입력(enter 입력)" onclick="commentPro('${board1.num}')"
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

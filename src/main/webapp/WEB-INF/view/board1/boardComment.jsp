<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free01.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function enterkey(num) {
	if(window.event.keyCode == 13) {
		commentPro(num)
	}
	
	
	
}

function commentPro(num) {
	if(!'${nicname}') {
		 location.href="${pageContext.request.contextPath}/member/alert?email=login" 
	}
	let comment = document.querySelector("#comment").value
	console.log(comment)
	//$.get(url, function() {})
	$.get("${pageContext.request.contextPath}/board1/boardCommentPro?comment="+comment+"&num="+num,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		    let commentList = document.querySelector("#commentList")
		    commentList.innerHTML=data + commentList.innerHTML
		    console.log(commentList.innerHTML)
	})
	
	document.querySelector("#comment").value=''
}

function deleteComment(ser) {
	
	
	alert("삭제하시겠습니까?")
	//$.get(url, function() {})
	
 	$.get("${pageContext.request.contextPath}/board1/deleteComment?ser="+ser,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		    if (data=="ok") {
		    	location.href="${pageContext.request.contextPath}/board1/boardComment?num=${board.num}";
		    }
	})
	 
	
}


function updateComment(ser) {
	//alert(ser)

	
  	let updateComment = prompt("수정할 댓글 내용을 입력해주세요.");
	
  /*   var currentComment = document.getElementById("comment_" + ser).innerText;  // 현재 댓글 내용을 가져옵니다. 이를 위해 각 댓글에 고유한 ID를 설정해야 합니다.
    var newComment = prompt("댓글 수정:", currentComment);  // 현재 댓글 내용을 기본 값으로 설정하여 prompt 창을 띄웁니다.
 */
 alert(updateComment)
 
    if (updateComment === null) {  // 사용자가 취소 버튼을 눌렀을 때
        return;  // 아무 작업도 수행하지 않고 종료
    }
    
   
    
    
	$.get("${pageContext.request.contextPath}/board1/updateComment?ser="+ser+"&content="+updateComment,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		 
		    location.href="${pageContext.request.contextPath}/board1/boardComment?num=${board.num}"
	})

}
</script>
</head>
<body>
	<div class="container">
		<table class="table-all">
			<tr>
				<td>글번호</td>
				<td>${boardNum}</td>
				<td>조회수</td>
				<td>${board.readcnt}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.name}</td>
				<td>작성일</td>
				<td><fmt:formatDate value="${board.regdate}"   pattern="yyyy.MM.dd"/>
				</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td colspan="3"><img
					src="${pageContext.request.contextPath}/view/board1/images/${board.file1}" />
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td colspan="3">${board.subject}</td>
			</tr>
			
			
			
			<tr   style="border-bottom: double 3px grey;">
				<td>글내용</td>
				<td colspan="3">${board.content}</td>
			</tr  >
			
			
			
			<tr   >
				<td  colspan="4">
				<p  class="right">
					<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/board1/boardUpdateForm?num=${board.num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board1/boardDeleteForm?num=${board.num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/board1/boardList'"/>
				</p>
				
				
				
				
				</td>
				
			</tr  >
			
			
			
			
			
			<tr>
				<td colspan="3" class="center"><textarea rows="1"
						class="input border" onkeyup="enterkey('${board.num}')"
						cols="50" name="content" id="comment"></textarea></td>
				<td><input type="button" value="입력(enter 입력)"
					onclick="commentPro('${board.num}')"></td>
			</tr>
           </table>
           
           
           <div class="container-fluid">
             <table>
				<tr  id="commentList"></tr>
				<c:forEach   var="c"   items="${commentLi}">
				<c:if test="${sessionScope.nicname==c.nicname}" >
				${c.toHtml1()} 
				</c:if>
				<c:if test="${sessionScope.nicname!=c.nicname}" >
				${c.toHtml2()} 
				</c:if>
				</c:forEach>
				
			</table>
		</div>

	

	</div>
</body>
</html>
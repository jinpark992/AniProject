<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free01.css"> --%>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function enterkey(num) {
	if(window.event.keyCode == 13) {
		commentPro(num)
	}
	
	
	
}

function commentPro(num) {
	
	let comment = document.querySelector("#comment").value
	alert(comment)
	//$.get(url, function() {})
	$.get("${pageContext.request.contextPath}/board3/board3CommentPro?comment="+comment+"&num="+num,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		    
		    if (data == "ok") {
		    location.href="${pageContext.request.contextPath}/board3/board3Comment?num=${board3.num}"
		    }
	})
	
	document.querySelector("#comment").value=''
}

function updateComment(ser) {
    let updatedComment = prompt("수정내용을 입력하세요");
    
    if (updatedComment !== null) {
        $.post("${pageContext.request.contextPath}/board3/updateComment", {
            ser: ser,
            updatedComment: updatedComment
        }, function(data) {
            if (data === "ok") {
                $(`#comment${ser}`).text(updatedComment);
                location.reload();
            }
        });
    }
}

function deleteComment(ser) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.post("${pageContext.request.contextPath}/board3/deleteComment", {
            ser: ser
        }, function(data) {
            if (data === "ok") {
                $(`#commentRow${ser}`).remove();
                location.reload();
            }
        });
    }
}


</script>
</head>
<body>
	<div class="container">
		<table class="table-all">
			<tr>
				<td>글번호</td>
				<td>${board3.num}</td>
				<td>조회수</td>
				<td>${board3.readcnt}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board3.name}</td>
				<td>작성일</td>
				<td>${board3.regdate2}</td>
			</tr>
			<tr>
    			<td>제  목</td>
    			<td><strong style="font-size: 1.2em;">${board3.subject}</strong></td>
				<td>지  역</td>
				<td>${board3.location}</td>			
			</tr>
			<tr>
				<td>사진</td>
            <td colspan="3">
                <c:choose>
                    <c:when test="${board3.file1 ne ' '}">
                        <img src="${pageContext.request.contextPath}/view/board3/images/${board3.file1}" width="300px" height="300px" />
                    </c:when>
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose>
            </td>

			</tr>
			<tr>
    			<td style="vertical-align: top;">내용</td>
    			<td colspan="3" style="vertical-align: top; height: 100px;">${board3.content}</td>
			</tr>


			
			<tr   >
				<td  colspan="4">
				<p  class="right">
					<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/board3/board3UpdateForm?num=${board3.num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board3/board3DeleteForm?num=${board3.num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/board3/board3List'"/>
				</p>
				
				
				
				
				</td>
				
			</tr  >
			
			<tr>
			
				<td colspan="3" class="center"><textarea rows="1"
						class="input border" onkeyup="enterkey('${board3.num}')"
						cols="50" name="content" id="comment"></textarea></td>
				<td><input type="button" value="입력(enter 입력)"
					onclick="commentPro('${board3.num}')"></td>
			</tr>
           </table>
           
           
          <div class="container-fluid">
   			 <table>
        		<tr id="commentList">
            		<c:forEach var="c" items="${commentLi}">
                <tr>
                	<td>${c.nicname}    :    ${c.content}</td>
                    <td style="font-size: 0.8em;">${c.regdate2}</td>
                    <td>
                    <c:if test="${sessionScope.nicname==c.nicname }">
    					<button style="padding: 2px 8px; font-size: 12px; border: none; border-radius: 4px; cursor: pointer; margin-right: 5px;"
            			onclick="updateComment('${c.ser}')">수정</button>
    					<button style="padding: 2px 8px; font-size: 12px; border: none; border-radius: 4px; cursor: pointer;"
            			onclick="deleteComment('${c.ser}')">삭제</button>
            			</c:if>
					</td>

                </tr>
            		</c:forEach>
        		</tr>
    		</table>
		</div>

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.subject}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/free.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .board-table th,
        .board-table td {
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
        }
        .comment-input {
            width: 100%;
            resize: none;
            padding: 5px;
            border: 1px solid #ccc;
        }
        .comment-button {
            padding: 5px 10px;
            margin: 5px;
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
    align-items: center; /* 수직 가운데 정렬 */
}

.comment-content {
    flex: 1; /* 남은 공간 모두 차지 */
    font-size: 14px;
}

.comment-actions {
    display: flex;
    flex-direction: row; /* 수정 버튼과 삭제 버튼을 가로로 나열 */
    margin-left: 10px;
}

.edit-button, .delete-button {
    margin-right: 10px; /* 버튼 사이 간격 설정 */
}

.comment-date {
    font-size: 12px;
    color: #888;
}
    </style>
    
    <script>
function enterkey(num) {
	if(window.event.keyCode == 13) {
		commentPro(num)
	}
	
	
	
}

function commentPro(num) {
	
	let comment = document.querySelector("#comment").value
	console.log(comment)
	//$.get(url, function() {})
	$.get("${pageContext.request.contextPath}/board2/board2CommentPro?comment="+comment+"&num="+num,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		    let commentList = document.querySelector("#commentList")
		    commentList.innerHTML=data + commentList.innerHTML
		    console.log(commentList.innerHTML)
	})
	
	document.querySelector("#comment").value=''
}

function deleteComment(ser) {  // 댓글 삭제
    let chk =  confirm("댓글을 삭제하겠습니까?")	
    
    if (chk) {
    	
    $.get("${pageContext.request.contextPath}/board2/board2DeleteCommentPro?ser="+ser,
			function(data, state){
		    console.log("Data: " + data + "\nStatus: " + status);
		   if (data=="ok") {
			   location.href="${pageContext.request.contextPath}/board2/board2Comment?num=${board2.num}&boardNum=${boardNum}"
		   }
	})
     }
	
}

function editComment(ser,contentText) {
    let chk = confirm("댓글을 수정하시겠습니까?");
    
    if (chk) {
    	
        let newContent = prompt("새로운 댓글 내용을 입력하세요:", contentText);    
        if (newContent !== null) {
        	   $.get("${pageContext.request.contextPath}/board2/board2CommentEditPro?ser="+ser+"&content="+newContent,
        				function(data, state){
        			    console.log("Data: " + data + "\nStatus: " + status);
        			   if (data=="ok") {
        				   location.href="${pageContext.request.contextPath}/board2/board2Comment?num=${board2.num}&boardNum=${boardNum}"
        			   }
        		})
        	
        	
            alert("댓글이 수정되었습니다: " + newContent);
        } else {
            alert("댓글 수정이 취소되었습니다.");
        }
    } else {
        alert("댓글 수정이 취소되었습니다.");
    }
}

function commentPro(num) {
    let comment = document.querySelector("#comment").value;
    console.log(comment);

    $.get("${pageContext.request.contextPath}/board2/board2CommentPro?comment=" + comment + "&num=" + num,  
    		// $.get(...): jQuery의 $.get() 함수를 사용하여 서버에 GET 요청을 보냅니다. 서버에는 댓글 내용과 게시물 번호가 포함된 URL이 전달됩니다. 
    		//서버는 이 정보를 기반으로 해당 게시물에 댓글을 추가하고, 업데이트된 댓글 목록을 반환합니다.
        function (data, status) {
    		// GET 요청의 응답을 처리하는 콜백 함수입니다. 서버로부터 받은 데이터 (data)와 요청의 상태 (status)를 처리합니다.
            console.log("Data: " + data + "\nStatus: " + status);
            let commentList = document.querySelector("#commentList");
            // data + commentList.innerHTML;: 서버로부터 받은 데이터 (data)를 댓글 목록의 HTML 내용 앞에 추가합니다. 이로써 새로 작성된 댓글이 목록의 맨 위에
            // 추가됩니다.
            commentList.innerHTML = data + commentList.innerHTML;

            // 댓글 개수 업데이트
            const totalCommentCountElement = document.querySelector("#totalCommentCount");
            const currentCount = parseInt(totalCommentCountElement.textContent.match(/\d+/)[0]);
            totalCommentCountElement.textContent = "총 댓글(" + (currentCount + 1) + ")";

            console.log(commentList.innerHTML);
        });

    document.querySelector("#comment").value = '';
}

function commentPro(num) {
    let comment = document.querySelector("#comment").value;
    console.log(comment);

    $.get("${pageContext.request.contextPath}/board2/board2CommentPro?comment=" + comment + "&num=" + num,
        function (data, status) {
            console.log("Data: " + data + "\nStatus: " + status);
            //let commentList = document.querySelector("#commentList");
           // commentList.innerHTML = data + commentList.innerHTML;

	location.href="${pageContext.request.contextPath}/board2/board2Comment?num=${board2.num}&boardNum=${boardNum}"
           

            //console.log(commentList.innerHTML);
        });

    //document.querySelector("#comment").value = '';
}






</script>





   
    
  
</head>


<body>
<div class="container">
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
            <td>${board2.regdate}</td>	
        </tr>
        <tr>
            <th>이미지</th>
            <td colspan="3">
                <img src="${pageContext.request.contextPath}/view/board2/images/${board2.file1}" class="board-image" />
            </td>
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
                    <input type="button" value="글수정" onclick="document.location.href='${pageContext.request.contextPath}/board2/board2UpdateForm?num=${board2.num}&boardNum=${boardNum}'" class="btn btn-primary board-button" />
                    <input type="button" value="글삭제" onclick="document.location.href='${pageContext.request.contextPath}/board2/board2DeleteForm?num=${board2.num}'" class="btn btn-danger board-button" />
                    <input type="button" value="목록" onclick="document.location.href='${pageContext.request.contextPath}/board2/board2List'" class="btn btn-secondary board-button" />
                </p>
            </td>
        </tr>
	       
	        <tr>	
	            <td colspan="3">
	                <textarea rows="1" class="comment-input" onkeyup="enterkey('${board2.num}')" cols="50" id="comment"></textarea>
	            </td>
	          <td>
	    <span id="totalCommentCount">총 댓글(${commentLi.size()})</span>
	    <input type="button" value="입력(enter 입력)" onclick="commentPro('${board2.num}')" class="btn btn-primary comment-button" />
			</td>
	        </tr>
	        
	        
		<!--댓글 조회수 구현, 댓글 좋아요 구현 해야함 -->	        
	    <tr>
			    <td colspan="3" class="comment-list" id="commentList">
			        <c:forEach var="c" items="${commentLi}">
			           
			            <div class="comment-item" id="comment_${c.ser}">
			                <p>${c.toHtml()}</p>
			              
			            </div>
			        </c:forEach>
			    </td>
			    
			    <td>
				<!--댓글 추가  -->    
				</td>
		</tr>
    </table>
</div>
</body>
</html>



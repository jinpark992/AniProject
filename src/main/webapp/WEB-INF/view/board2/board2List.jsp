<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board2List}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free.css">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <style>
        .container {
            position: relative;
        }
        .write-button {
            margin-top: 10px; /* Adjust the margin as needed */
        }
    </style>
    <script>
    function likeChk(num) {  // 좋아요 기능
    	alert(num)
    	
    	$.get("${pageContext.request.contextPath}/board2/board2likeChk?num="+num,  // URL 생성
    			function(data, state){
    		    console.log("Data: " + data + "\nStatus: " + status);
    		    let likebutton = document.querySelector(".like-button");
    		    if (data=="ok") {
    		  
    		    likebutton.style.backgroundColor="red"
    		    } else {
    		    	 likebutton.style.backgroundColor="grey"
    		    }	
    	}) 
    		
    	
    	
    	
    }

    
    </script>
</head>		

<body>

<div class="container">
    <h3 class="board-heading">정보 공유게시판</h3>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>추천</th>
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
                <tr>
                    <td>${boardNum}</td>
                    <td>${b.recommendation}</td>
                    <td>${b.name} (${b.location})</td>
					<td><a href="${pageContext.request.contextPath}/board2/board2Comment?num=${b.num}&boardNum=${boardNum}">${b.subject}[${b.totalcount }]</a></td>
					 <c:set var="boardNum" value="${boardNum-1}"/>
					<td>
                        <c:if test="${not empty b.file1}">
                            <div style="display: flex; align-items: center;">
                                <div style="margin-right: 10px;">
                                    <img src="${pageContext.request.contextPath}/view/board2/images/${b.file1}" width="150px" alt="Image">
                                </div>
                                <div>
                                    <div>가격: ${b.price}원</div>
                                    <div>배송비: ${b.shipping}원</div>
                                </div>
                            </div>
                        </c:if>
                    </td>
                    <td>${b.regdate}</td>
                    <td>${b.readcnt}</td>
                   
                    <td>
                        <button class="like-button" data-board-num="${b.num}" data-action="like"  onclick="likeChk('${b.num}')">좋아요</button>
                    </td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="search-bar">
    <form action="${pageContext.request.contextPath}/board2/board2List" method="get" class="d-flex">   
        <input type="text" id="search-input" name="keyword" placeholder="검색" class="form-control mr-2">
        <select name="column" class="form-select" >
            <option value="titleContent" selected>제목+내용</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="nickname">닉네임</option>
            <option value="comment">댓글</option>
        </select>
        <button id="search-button" type="submit" class="btn btn-primary ml-2">검색</button>
    </form>
</div>
    <div class="pagination">
        <!-- 페이지 링크... -->
    </div>
    <a class="write-button" href="${pageContext.request.contextPath}/board2/board2Form">글쓰기</a>
</div>


  <div class="pagination">
      <c:if test="${start < bottomLine }" >
        <a href="#" class="active">[이전]</a>
        </c:if>
        <c:if test="${start > bottomLine }" >
        <a href="${pageContext.request.contextPath}/board2/board2List?pageNum=${start-bottomLine}"
         class="">[이전]</a>
        </c:if>
       
        <c:forEach  var="p"  begin="${start}"  end="${end}">
        <a href="${pageContext.request.contextPath}/board2/board2List?pageNum=${p}"
        class="<c:if test="${pageInt==p}">gold</c:if>">${p}</a>
        </c:forEach>
        
        <c:if test="${end >= maxPage }" >
        <a href="#" class="white">다음</a>
        </c:if> 
        <c:if test="${end <  maxPage }" >
        <a href="${pageContext.request.contextPath}/board2/board2List?pageNum=${start+bottomLine}"
        class="w3-button ">[다음]</a>
        </c:if>
      </div>

</body>
</html>
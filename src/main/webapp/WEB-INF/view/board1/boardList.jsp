<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free.css">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title> 
<style>
.pagination a.gold {
background-color: gold;
}

.pagination a.white {
background-color: white;


}


</style>
</head><body>

    <div class="w3-container">
        <h3 class="w3-center">${boardName}</h3>
        <table>
          
            <tr>
              	<th>번호</th>
  			  	<th>이름</th>
  				<th>제목</th>
   				<th>파일</th>
   				<th>입력일</th>
  				<th>조회수</th>
  				<c:set var="boardNum"  value="${boardNum}"/>
  <c:forEach  var="b"  items="${list }">
  <tr>
   <td>${boardNum}</td> 
  
  <td>${b.name}</td>
  <td><a  href="${pageContext.request.contextPath}/board1/boardComment?num=${b.num}&boardNum=${boardNum}">${b.subject}</a></td>
   <c:set var="boardNum"  value="${boardNum-1}"/>
  <td>${b.file1}</td>
  <td>${b.getRegdate2()}</td>
  <td>${b.readcnt}</td>
 
   </tr>
  
  </c:forEach>
            </tr>
          
          <tbody>
           
          </tbody>
        </table>
           <div class="button-container" style="display: flex; flex-direction: column; align-items: center;">
    <div class="search-bar">
        <form action="${pageContext.request.contextPath}/board1/boardSearch" method="post">
            <input type="text" id="search-input" name="query" placeholder="검색">
            <button id="search-button">검색</button>
        </form>
    </div>
    <a class="button-wrapper" href="${pageContext.request.contextPath}/board1/boardForm"
       style="text-decoration:none; text-align:center;">
        <button type="submit" class="write-button">글쓰기</button>
    </a>
</div>
    </div>
  

	  
      <div class="pagination">
      <c:if test="${start < bottomLine }" >
        <a href="#" class="active">[이전]</a>
        </c:if>
        <c:if test="${start > bottomLine }" >
        <a href="${pageContext.request.contextPath}/board1/boardList?pageNum=${start-bottomLine}"
         class="">[이전]</a>
        </c:if>
        <c:forEach  var="p"  begin="${start}"  end="${end}">
        <a href="${pageContext.request.contextPath}/board1/boardList?pageNum=${p}"
        class="<c:if test="${pageInt==p}">gold</c:if>">${p}</a>
        </c:forEach>
        
        <c:if test="${end >= maxPage }" >
        <a href="#" class="white">다음</a>
        </c:if> 
        <c:if test="${end <  maxPage }" >
        <a href="${pageContext.request.contextPath}/board1/boardList?pageNum=${start+bottomLine}"
        class="w3-button ">[다음]</a>
        </c:if>
      </div>
</div>    
</body>
</html>
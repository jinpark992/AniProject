<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free.css">
<meta charset="UTF-8">
<title>게시판</title> 
</head>
<body>
<div class="sort-container" style="display: flex; justify-content: flex-end; margin-top: 10px;">
    <label class="form-label" style="margin-right: 10px;">정렬 방식</label>
    <select name="orderBy" style="width: 80px; height: 30px;" onchange="location.href='${pageContext.request.contextPath}/board3/board3List?orderBy=' + this.value">
        <option value="">선택</option>
        <option value="readcnt">조회수순</option>
        <option value="regdate">등록일순</option>
    </select>

    <label class="form-label" style="margin-right: 10px;">지역별</label>
    <select name="orderBy" style="width: 80px; height: 30px;" onchange="location.href='${pageContext.request.contextPath}/board3/board3List?orderBy=' + this.value">
        <option value="">선택</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
        <option value="강원">강원</option>
        <option value="제주">제주</option>
    </select>
</div>



    <div class="w3-container" style="max-width: 1700px; margin: 0 auto;">
        <h3 class="w3-center">${boardName}</h3>
        <table>
            <tr>
              	<th>번호</th>
  			  	<th>닉네임</th>
  				<th>제목</th>
  				<th>지역</th>
   				<th>파일</th>
   				<th>입력일</th>
  				<th>조회수</th>
  				<%-- <c:set var="boardNum"  value="${boardNum}"/> --%>
                <!-- 이미지 미리보기를 추가한 부분 -->
		<c:forEach  var="b"  items="${list}">
    		<tr>
        		<td>${b.num}</td>
        		<td>${b.name}</td>
        		<td><a href="${pageContext.request.contextPath}/board3/board3Comment?num=${b.num}">${b.subject}</a></td>
        		<td>${b.location}</td>
        		<td style="width: 75px; height: 75px; text-align: center; vertical-align: middle;">
    <c:choose>
        <c:when test="${b.file1 ne ' '}">
            <img src="${pageContext.request.contextPath}/view/board3/images/${b.file1}" alt="" width="75px" height="75px">
        </c:when>
        <c:otherwise>
            No Image
        </c:otherwise>
    </c:choose>
</td>

        		<td>${b.regdate2}</td>
        		<td>${b.readcnt}</td>
    		</tr>
</c:forEach>

            </tr>
            <tbody>
            </tbody>
        </table>
   <div class="button-container" style="display: flex; flex-direction: column; align-items: center;">
    <div class="search-bar">
        <form action="${pageContext.request.contextPath}/board3/board3Search" method="post">
            <input type="text" id="search-input" name="query" placeholder="검색">
            <button id="search-button">검색</button>
        </form>
    </div>
    <a class="button-wrapper" href="${pageContext.request.contextPath}/board3/board3Form"
       style="text-decoration:none; text-align:center;">
        <button type="submit" class="write-button">글쓰기</button>
    </a>
</div>


        <div class="pagination">
            <c:if test="${start < bottomLine }" >
                <a href="#" class="active">[이전]</a>
            </c:if>
            <c:if test="${start > bottomLine }" >
                <a href="${pageContext.request.contextPath}/board3/board3List?pageNum=${start-bottomLine}" class="w3-button">[이전]</a>
            </c:if>
            <c:forEach  var="p"  begin="${start}"  end="${end}">
                <a href="${pageContext.request.contextPath}/board3/board3List?pageNum=${p}" class="w3-button <c:if test="${pageInt==p}">w3-red </c:if> ">${p}</a>
            </c:forEach>
            <c:if test="${end >= maxPage }" >
                <a href="#" class="w3-button w3-disabled">다음</a>
            </c:if>
            <c:if test="${end <  maxPage }" >
                <a href="${pageContext.request.contextPath}/board3/board3List?pageNum=${start+bottomLine}" class="w3-button ">[다음]</a>
            </c:if>
        </div>
        <%-- <a href="${pageContext.request.contextPath}/board3/board3Search?query=${searchQuery}">검색 결과 보기</a> --%>
    </div>
</body>
</html>
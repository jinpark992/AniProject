<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div class="w3-container">
<table class="w3-table-all " style="color:#000">
<tbody><tr class="w3-grey">
  <th>이름</th>  
  <th>주소</th>
  <th>서비스</th>  
  <th>영업시간</th> 
   <th>마감시간</th> 
  <th>전화번호</th>
</tr>
</tbody><tbody>
<c:forEach  var="m"  items="${li}">
<tr>
<td>${m.name}></td>
<td>${m.location3}</td>
<td>${m.details}</td>
<td>${m.open_time}</td>
<td>${m.close_time}</td>
<td>${m.tel}</td>

</tr>
</c:forEach>
</tbody></table></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>
    <h3>검색 결과</h3>
    <ul>
        <c:forEach var="result" items="${searchResults}">
            <li>${result.name} - ${result.subject}</li>
        </c:forEach>
    </ul>
</body>
</html>

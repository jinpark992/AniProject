<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8"><title>Insert title here</title></head><body>
<div class="container mt-3">
<form class="w3-container"  method="post"  action="${pageContext.request.contextPath}/board1/boardUpdatePro" 
  enctype="multipart/form-data" >
  <input type="hidden"   name="num"  value="${board.num}">
  <input type="hidden"   name="file1"  value="${board.file1}">
<h3   class="w3-center">${boardName} 수정</h3>
<br><p>      
<label class="form-label">작성자</label>
<input type="text" class="form-control" placeholder="Enter name" name="name"  value="${board.name }">
</p><p>      
<label class="form-label">비밀번호</label>
<input class="form-control" type="password"  name="pass">
</p><p>      
<label class="form-label">제목</label>
<input class="form-control" type="text"  name="subject" value="${board.subject}">
</p><p>      
<label class="form-label">내용</label>
<textarea class="form-control" style="resize:none"  name="content">${board.content}</textarea>
</p><p>      
<label class="form-label">파일${board.file1} </label>
<input class="form-control" type="file" name="f" >
</p>


  <p  class="col d-flex justify-content-center">
  <button type="submit" class="btn btn-primary"
  style="width:120px">수정</button></p>
</form>
</div>
</body>
</html>
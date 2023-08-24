<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form class="w3-container"   name="f"  
         action="${pageContext.request.contextPath}/member/custom_signupPro" method="post">

<div class="container mt-3">
  <h2>회원 가입</h2>
  <form>
    <div class="mb-3 mt-3">
      <label for="email">이메일(Email):</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" name="email">
    </div>
    <div class="mb-3">
      <label for="pwd">비밀번호(Password):</label>
      <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력하세요" name="pass">
    </div>
    <div class="mb-3">
      <label for="pwd">닉네임:</label>
      <input type="text" class="form-control" id="nicname" placeholder="닉네임을 입력하세요" name="nicname">
    </div>
    <div class="mb-3">
      <label for="pwd">생년월일(19000101):</label>
      <input type="text" class="form-control" id="brithday" placeholder="생년월일 8자리를 입력하세요" name="birthday">
    </div>
    
   
    <button type="submit" class="btn btn-primary" style="background-color: #19110B; border: #19110B; color: white; margin-bottom: 10px;">회원 가입</button>
  </form>
</div>
</form>
</body>
</html>
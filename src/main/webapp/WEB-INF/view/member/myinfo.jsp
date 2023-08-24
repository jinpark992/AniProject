<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html><html>
<head><meta charset="UTF-8">

<title>Insert title here</title>
<script>
function selectBox() {
		
	      const xhttp = new XMLHttpRequest();
	      const parms = "?group1=" + document.querySelector("#sel01").value;
	      alert(parms)
	      xhttp.open("GET", "${pageContext.request.contextPath}/animal/myAnimal" + parms, true)
	      xhttp.send();
	      xhttp.onreadystatechange = callBack;  }
	   function callBack() {
	      if(this.readyState == 4 && this.status == 200) {
	         let str = this.responseText.split(':')
	         alert(str)
	         document.querySelector("#sel02").innerHTML = str    }}
function deleteAni(ser) {
	location.href="${pageContext.request.contextPath}/member/deleteAni?ser="+ser;}
	
document.addEventListener("DOMContentLoaded", function() {
    const animalSelect = document.getElementById("sel01");
    const breedSelect = document.getElementById("sel02");

    animalSelect.addEventListener("change", function() {
        const selectedAnimal = animalSelect.value;
        if (selectedAnimal == "고양이") {
            breedSelect.innerHTML = `
                <option>선택하세요</option>
                <option value="노르웨이숲 고양이">노르웨이숲 고양이</option>
                <option value="랙돌">랙돌</option>
                <option value="러시안블루">러시안블루</option>
                <option value="먼치킨">먼치킨</option>
                <option value="뱅갈">뱅갈</option>
                <option value="브리티시쇼트헤어">브리티시쇼트헤어</option>
                <option value="샴">샴</option>
                <option value="스코티시폴드">스코티시폴드</option>
                <option value="스핑크스">스핑크스</option>
                <option value="아메리칸쇼트헤어">아메리칸쇼트헤어</option>
                <option value="아비시니안">아비시니안</option>
                <option value="코리안쇼트헤어">코리안쇼트헤어</option>
                <option value="터키시앙고라">터키시앙고라</option>
                <option value="페르시안">페르시안</option>`;
        } else {
            breedSelect.innerHTML = `
            	<option>선택하세요</option>
        		<option value="리트리버">리트리버</option>
        		<option value="말라뮤트">말라뮤트</option>
        		<option value="말티즈">말티즈</option>
        		<option value="보더콜리">보더콜리</option>
        		<option value="불독">불독</option>
        		<option value="비숑">비숑</option>
        		<option value="시바">시바</option>
        		<option value="셰퍼드">셰퍼드</option>
        		<option value="웰시코기">웰시코기</option>
        		<option value="저먼셰퍼드">저먼셰퍼드</option>
        		<option value="진돗개">진돗개</option>
        		<option value="차우차우">차우차우</option>
        		<option value="치와와">치와와</option>
        		<option value="포메라니안">포메라니안</option>
        		<option value="푸들">푸들</option>
        		<option value="허스키">허스키</option>`;
        }
    });
});	
</script>
</head>
<body>

<br>
<div class="row">
	<div class="container col">
		<br>
		<div class="text-center">
			<h2>나의 정보•ﻌ•</h2>
		</div>
		<table class="table table-bordered">
			<tr>
				<td class="text-center">이메일</td>
				<td>${m.email}</td>
			</tr>
			<tr>
				<td class="text-center">닉네임</td>
				<td>${m.nicname}</td>
			</tr>
			<tr>
				<td class="text-center">생년월일</td>
				<td>${m.birthday.split(' ')[0]}</td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td colspan="2" class="col">
					<a class="btn btn-success" style="background-color: #19110B; border: #19110B; color:white;"
						href="${pageContext.request.contextPath}/member/memberUpdateForm">회원정보 수정</a>
					<a class="btn btn-success" style="background-color: #19110B; border: #19110B; color:white;" 
						href="${pageContext.request.contextPath}/member/memberDeleteForm">회원 탈퇴</a>
					<a class="btn btn-success" style="background-color: #19110B; border: #19110B; color:white;"
						href="${pageContext.request.contextPath}/member/memberPassForm">비밀번호 수정</a>
				</td>
			</tr>
		</table>
		<br>
		<div class="text-center">
			<h2>나의 반려동물•ﻌ•</h2>
		</div>
		<table class="table table-bordered" id="animalTable">
  			<tr>
    			<td class="text-center">종</td>
    			<td class="text-center">교배여부</td>
    			<td class="text-center">이름</td>
    			<td class="text-center">나이</td>
    			<td class="text-center">성별</td>
    			<td class="text-center">사진</td>
    			<td></td>
  			</tr>
			<c:forEach var="ani" items="${aniList}">
    		<tr>
    			<td class="text-center">${ani.groupid}</td>
      			<td class="text-center">${ani.neuter}</td>
      			<td class="text-center">${ani.name}</td>
      			<td class="text-center">${ani.age}살</td>
      			<td class="text-center">${ani.gender}</td>
      			<td class="text-center">
      				<img src="${pageContext.request.contextPath}/view/member/picture/${ani.picture}" 
      				alt="" width="45px" height="45px">
      			</td>
      			<td class="text-center py-3">
      				<button class="btn btn-primary mt-0" style="background-color: #19110B; border: #19110B; color: white;" 
      				onclick="deleteAni('${ani.ser}')">삭제</button>
      			</td>
    		</tr>
  		</c:forEach>
		</table>
	</div>


<div class="container col">
<br>
<div class="text-center">
	<h2>나의 반려동물 설정하기•ﻌ•</h2>
</div>
	<form name="f" action="${pageContext.request.contextPath}/member/myinfoPro" method="post"  enctype="multipart/form-data">
		<div class="row">
   		<div class="col">
    	<label for="sel01" class="form-label">동물</label>
    	<select class="form-select" id="sel01" name="groupid1"  >
      		<option  value="?" >선택하세요</option>
      		<option  value="강아지" >강아지</option>
      		<option  value="고양이" >고양이</option>
    	</select></div></div>
		<div class="row"> 
	    <div class="col">
     	<label for="sel02" class="form-label">종</label>
    	<select class="form-select" id="sel02" name="groupid2">
    		<option>선택하세요</option>
    	</select></div>
    	
     	<div class="col">
     	<label for="sel03" class="form-label">교배여부</label>
    	<select class="form-select" id="sel03" name="neuter">
      <option  value="O">O</option>
      <option  value="X">X</option>
    </select>
    </div>
   </div>
    <div class="row">
    <div class="col">
     <label for="sel04" class="form-label">이름</label>
    <input type="text" class="form-control"  id="sel04"   name="name">
    </div></div>
    
     <div class="row">
  
    <div class="col">
     <label for="sel05" class="form-label">나이</label>
    <select class="form-select" id="sel05" name="age">
      <option>선택하세요</option>
      <option  value="1">1살</option>
      <option  value="2">2살</option>
      <option  value="3">3살</option>
      <option  value="4">4살</option>
      <option  value="5">5살</option>
      <option  value="6">6살</option>
      <option  value="7">7살</option>
      <option  value="8">8살</option>
      <option  value="9">9살</option>
      <option  value="10">10살</option>
      <option  value="11">11살</option>
      <option  value="12">12살</option>
      <option  value="13">13살</option>
      <option  value="14">14살</option>
      <option  value="15">15살</option>
    </select>
    </div>
     <div class="col">
     <label for="sel06" class="form-label">성별</label>
    <select class="form-select" id="sel06" name="gender">
    	<option>선택하세요</option>
		<option  value="수컷">수컷</option>
      	<option  value="암컷">암컷</option>
    </select>
    </div>
   </div>
   <div class="row">
   <div class="col">
   <label for="sel07" class="form-label">사진</label>
   <input type="file"  class="form-control" name="f"  id="sel07">
   
   </div></div>
   <div align="center">
    <button type="submit" class="btn btn-primary mt-0" style="background-color: #19110B; border: #19110B; color: white;">저장하기</button>
    </div>
  </form>
</div>
</div>
</body></html>
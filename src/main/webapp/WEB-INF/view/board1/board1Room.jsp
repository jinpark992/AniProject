<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.form-container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>방 만들기</h2>
		<form>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" required>
			</div>
			<div class="form-group">
				<label for="maxParticipants">최대 인원 모집 설정</label> <input
					type="number" id="maxParticipants" name="maxParticipants" required>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="content" rows="5" required></textarea>
			</div>
			<div class="form-group">
				<label for="location">지도에 위치 찍기</label> <input type="text"
					id="location" name="location" required>
			</div>
			<button type="submit">방 만들기</button>
		</form>
	</div>
</body>
</html>





<!--
 로그인한 회원이 방만들기를 함.

제목 -> 최대인원모집설정 ->내용입력 

지도에 마커 찍으면 -> 위치가 지정되면서 -> 5명 모집일경우 <0/5> 라는 마커가 뜸 
-> 참여하고싶은 인원이  마커에 커서를 대면 제목,내용을 확인을 할수 있음 
-> 마커를 클릭하면 <1/5>라는 참여 의사를 전달할수 있음. 

* 제약사항 
1. 참여 인원이 모두 차면 지도에 있는 마커가 주황색으로 변하게 하기 

생각좀..
 -->
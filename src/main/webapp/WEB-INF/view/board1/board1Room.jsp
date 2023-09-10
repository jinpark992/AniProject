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
		<h2>�� �����</h2>
		<form>
			<div class="form-group">
				<label for="title">����</label> <input type="text" id="title"
					name="title" required>
			</div>
			<div class="form-group">
				<label for="maxParticipants">�ִ� �ο� ���� ����</label> <input
					type="number" id="maxParticipants" name="maxParticipants" required>
			</div>

			<div class="form-group">
				<label for="content">����</label>
				<textarea id="content" name="content" rows="5" required></textarea>
			</div>
			<div class="form-group">
				<label for="location">������ ��ġ ���</label> <input type="text"
					id="location" name="location" required>
			</div>
			<button type="submit">�� �����</button>
		</form>
	</div>
</body>
</html>





<!--
 �α����� ȸ���� �游��⸦ ��.

���� -> �ִ��ο��������� ->�����Է� 

������ ��Ŀ ������ -> ��ġ�� �����Ǹ鼭 -> 5�� �����ϰ�� <0/5> ��� ��Ŀ�� �� 
-> �����ϰ���� �ο���  ��Ŀ�� Ŀ���� ��� ����,������ Ȯ���� �Ҽ� ���� 
-> ��Ŀ�� Ŭ���ϸ� <1/5>��� ���� �ǻ縦 �����Ҽ� ����. 

* ������� 
1. ���� �ο��� ��� ���� ������ �ִ� ��Ŀ�� ��Ȳ������ ���ϰ� �ϱ� 

������..
 -->
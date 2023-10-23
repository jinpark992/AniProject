
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>박진수의 블로그</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	line-height: 1.6;
	display: flex;
}

.container {
	display: flex;
	width: 100%;
}

.sidebar {
	background-color: #333;
	color: #fff;
	width: 200px;
	min-height: 100vh;
	padding: 20px 0;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar li {
	margin-bottom: 10px;
}

.sidebar a {
	text-decoration: none;
	color: #fff;
	font-size: 16px;
}

.content {
	flex-grow: 1;
	padding: 20px;
}

header {
	text-align: center;
	margin-bottom: 30px;
	border-bottom: 2px solid #333; /* 밑줄 스타일과 색상 설정 */
	padding-bottom: 10px; /* 밑줄과 텍스트 간격 조정 */
}

header h1 {
	font-size: 36px;
	color: #333; /* 텍스트 색상 설정 */
	font-family: 'Arial', sans-serif; /* 폰트 설정 */
	font-weight: bold;
	text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1); /* 텍스트 그림자 효과 */
}

/* 원하는 폰트로 변경하려면 font-family 속성을 수정하세요. */
.section {
	display: none;
}

.section.active {
	display: block;
}

.section h2 {
	margin-bottom: 30px;
	font-size: 36px;
}

.post {
	text-align: left;
	margin-bottom: 40px;
}

.post h3 {
	font-size: 24px;
	margin-bottom: 10px;
}

.post p {
	font-size: 16px;
}

a {
	color: black; /* 링크 텍스트 색상을 검은색으로 지정 */
	text-decoration: none; /* 밑줄 제거 */
}

a:hover {
	text-decoration: underline; /* 호버 시에만 밑줄 표시 */
}
.post img {
    margin-bottom: 50px;
}
</style>
<script src="script.js" defer></script>
</head>
<body>
	<div class="container">
		<nav class="sidebar">
			<ul>
				<li><a href="javascript:void(0);"
					onclick="showSection('about')"><i class="fas fa-user"></i> 자기
						소개</a></li>
				<li><a href="javascript:void(0);"
					onclick="showSection('project')"><i class="fas fa-cogs"></i>
						프로젝트</a></li>
				<li><a href="javascript:void(0);"
					onclick="showSection('stack')"><i class="fas fa-laptop-code"></i>
						기술 스택</a></li>
				<li><a href="javascript:void(0);"
					onclick="showSection('experience')"><i class="fas fa-briefcase"></i>
						이력</a></li>
				<li><a href="javascript:void(0);"
					onclick="showSection('contact')"><i class="fas fa-envelope"></i>
						연락하기</a></li>
			</ul>

		</nav>
		<main class="content">
			<header>
				<h1>도전적이고 진취적인 개발자 박진수를 소개합니다.</h1>
			</header>

			<section id="about" class="section active">
				<h2>자기소개</h2>
				<p>
					안녕하세요! 항상 새로운 기술을 탐구하며 개발을 즐기는 개발자 박진수입니다.<br> 저는 기술 스택을 중요하게
					생각하며, 동시에 커뮤니케이션 능력의 중요성을 인지하고 있습니다.<br> 풍부한 기술과 좋은 커뮤니케이션으로
					함께 문제를 해결하는 것을 즐기며, 항상 개선하고자 노력합니다.<br> 아직 부족한 점이 많겠지만, 꾸준한
					학습과 열정을 통해 회사와 팀의 성장에 기여할 것을 약속드립니다!
				</p>
				<img
					src="https://lh3.google.com/u/0/d/1_E1yNE4qPuXUS7UuHJky8XshrNmhnXwL=w1365-h878-iv1"
					alt="" width="1000">



				<h2>나를 소개하는 사이트를 소개합니다.</h2>
				<p>
					<a href="https://github.com/jinpark992/AniProject"><i
						class="fab fa-github"></i> 깃허브</a> <span>: 프로젝트 소스코드 소개</span>
				</p>
				<p>
					<a href="https://jinparkworld.tistory.com/  "><i
						class="fab fa-tumblr"></i> 티스토리</a> <span>: 스터디 기록 소개(일부 비공개)</span>
				</p>
				<p>
					<a href="https://instagram.com/jinpark1992?igshid=NzZlODBkYWE4Ng=="><i
						class="fab fa-instagram"></i> 인스타그램</a>
				</p>

			</section>

			<section id="project" class="section">
				<h2>KicDog Website 프로젝트 소개</h2>
				<div class="post">
					<p>1.Project 진행 과정</p>
					<img
						src="https://lh3.google.com/u/0/d/1_DodET0wqR8r5vmhw_GjvhU0wUqt1GMf=w1920-h878-iv1"
						alt="프토젝트 진행 과정을 소개합니다." width="1000">

				</div>

				<div class="post">
					<p>2.주제선정 배경</p>
					<img
						src="https://lh3.google.com/u/0/d/1_K9XdHKfzA81vA0lcDarx59EXm7Di5f8=w1920-h878-iv1"
						alt="프토젝트 주제선정 배경." width="1000">

				</div>

				<div class="post">
					<p>3.프로젝트 개요</p>
					<img
						src="https://lh3.google.com/u/0/d/1_KotkMQIFvNI005pLlFZl9HyyIioX75c=w1920-h878-iv1"
						alt="프토젝트 개요." width="1000">
				</div>
				
				<div class="post">
					<p>4.spring 구성 소개</p>
					<img
						src="https://lh3.google.com/u/0/d/1_Np5e7IMIi7zi-3WxZstru6ePTZEzVDi=w1365-h878-iv1"
						alt="spring 구성 소개." width="1000">
				</div>
				
				<div class="post">
					<p>5. 기능 구조</p>
					<img
						src="https://lh3.google.com/u/0/d/1_XZSOcHiP8K3oXzkS180noBHvTpy4bDO=w1920-h878-iv1"
						alt="기능 구조1." width="1000">
					<div>
					<img
						src="https://lh3.google.com/u/0/d/1_ZjvIDEhRb3g80NjBPrqufOa9JbXi_G1=w1365-h878-iv1"
						alt="기능 구조2." width="1000">
						</div>
				</div>
				

				<!-- 다른 포스트들도 추가할 수 있습니다 -->
			</section>

			<footer id="contact" class="section">
				<h2>연락하기</h2>
				<p>Email: example@email.com</p>
				<p>LinkedIn: [LinkedIn 프로필 링크]</p>
			</footer>
		</main>
	</div>

	<script>
		function showSection(sectionId) {
			// 모든 섹션 숨기기
			var sections = document.querySelectorAll('.section');
			sections.forEach(function(section) {
				section.classList.remove('active');
			});

			// 선택한 섹션만 보이기
			var selectedSection = document.getElementById(sectionId);
			selectedSection.classList.add('active');
		}
	</script>
</body>
</html>

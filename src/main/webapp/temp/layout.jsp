<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀 : <sitemesh: write property='title' /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Lovely Dog</title>

<link rel="icon" href="/images/강아지로고3.png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet" type="text/css" />
<sitemesh:write property='head' />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/mainpg/main"> <img
						src="https://img.freepik.com/premium-vector/cute-shiba-…al-pet-shop-pet-logo-product_123553-258.jpg?w=740"
						alt="" width="30" height="24"
						class="d-inline-block align-text-top"> Lovely Dog <!-- 버튼으로 구현하기 -->
					</a>
				</div>
			</nav>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/mainpg/main"
						onmouseover="changeWord(this, ['홈', 'Home'])">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/health/health_analysis"
						onmouseover="changeWord(this, ['건강', 'Healthy'])">Healthy</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Community </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/free?boardid=1">자유게시판</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/free?boardid=2">제품
									추천</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/free?boardid=3">친구
									찾기</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/free?boardid=4">호텔&여행
									정보</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/shop/uuss"
						onmouseover="changeWord(this, ['쇼핑', 'Shopping'])">Shopping</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/api/maps"
						class="nav-link"
						onmouseover="changeWord(this, ['병원 호텔 뷰티', 'Hospital&Hotel&Beauty'])">Hospital&Hotel&Beauty</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/api/Travel"
						onmouseover="changeWord(this, ['여행&음식', 'Travel & Restaurant'])">Travel
							& Restaurant</a></li>



				</ul>
			</div>

			<script>
				function changeWord(element, words) {
					var currentWord = element.innerHTML;
					var index = words.indexOf(currentWord);

					if (index === -1) {
						index = 0; // 기본적으로 첫 번째 단어로 시작
					} else {
						index = (index + 1) % words.length; // 다음 단어로 변경
					}

					element.innerHTML = words[index];
				}
			</script>

			<div class="navbar-nav">
				<c:if test="${email!=null}">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/member/myinfo">내 정보</a>
				</c:if>
				<c:if test="${email==null}">
					<a class="nav-link"
						href="${pageContext.request.contextPath}/member/login">로그인</a>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/member/custom_signup">회원가입</a>
				</c:if>
			</div>
		</div>
		</div>
	</nav>

	<div class="mainBody">
		<sitemesh:write property='body' />
	</div>

	<div>
		<footer>
			<div class="container">
				<div class="first-line pb-5 pt-5">Lovelydog</div>
				<div class="row pb-5 pt-5 second-line ">
					<div class="flag col">
						<img src="" width=16 height=12 /> Republic korea
					</div>
					<div class="col">
						<a href="#"> Email Sign-Up</a>
					</div>
					<div class="col">
						<a href="#">Contact Us</a>
					</div>
					<div class="col">
						<a href="#">Apps</a>
					</div>
					<div class="col">
						<a href="#">Follow Us</a>
					</div>
					<div class="col">
						<a href="#">California Transparency</a>
					</div>
					<div class="col">
						<a href="#"> Legal Notice</a>
					</div>
					<div class="col">
						<a href="#">Careers</a>
					</div>
					<div class="col">
						<a href="#">Sitemap</a>
					</div>
				</div>
				<div class=" mobile-footer">
					Shipt to : <img src="https://us.louisvuitton.com/flags/us.svg"
						width=16 height=12 class="flag-img" /> Unitied States
				</div>
			</div>
		</footer>








		

	</div>
</body>
</html>
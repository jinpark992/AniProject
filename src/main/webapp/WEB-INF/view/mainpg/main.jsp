<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>


	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="  https://p4.wallpaperbetter.com/wallpaper/803/322/368/poodle-puppy-flowers-wallpaper-preview.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>
						<b>Happy</b>
					</h5>
					<p>저희 KIC Dog은 반려동물에게 행복을 전달해줍니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="   https://p4.wallpaperbetter.com/wallpaper/783/920/40/puppy-dog-bokeh-bubble-wallpaper-preview.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>
						<b>Play</b>
					</h5>
					<p>반려동물의 최적화된 환경을 제공함으로써 즐거움을 전달해줍니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://p4.wallpaperbetter.com/wallpaper/8/987/707/golden-retriever-puppy-lying-collar-wallpaper-preview.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>
						<b>Comfortable</b>
					</h5>
					<p>반려동물의 최적화된 환경을 제공함으로써 편안함을 제공해줍니다.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="text-center mt-5 mb-5">
		<h2>동물을 사랑으로 감싸주세요.</h2>
		<p>행복한 라이프를 위해 함께합시다.</p>
		<button type="button" class="btn btn-warning"
			onclick="window.location.href='https://www.animals.or.kr/support/intro'">동물
			복지 캠페인에 동참해주세요.</button>

		<div class="mt-5 mb-5">
			<h4>KIC dog의 가족들의 반려동물을 소개할게요!</h4>
		</div>


		<div class="container mt-5 mb-5">
			<div class="row">
				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/coco3.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">상큼한 코코</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/coco3.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">깜찍한 코코</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/coco3.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">상큼코코</p>
						</div>
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/star.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">위풍당당 별이</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/jaerong.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">늠름한 재롱이</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-12">
					<div class="card mb-3">
						<img src="${pageContext.request.contextPath}/images/coco2.jpg"
							class="card-img-top" alt="..." width="50">
						<div class="card-body">
							<h5 class="card-title text-center">진수 운영진님의 반려동물 코코</h5>
							<p class="card-text">예민코코</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	
</body>






</html>
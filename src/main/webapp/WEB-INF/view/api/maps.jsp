<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2349b15c0bcd1245a81f906f1d107fe1&libraries=services"></script>
<style>
#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	padding: 5px;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
	overflow-y: auto;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

/* Adjust font size for table cells (td) */
table.w3-table-all td {
	font-size: 14px; /* Default font size */
	max-width: 150px; /* Adjust this value based on your requirements */
	white-space: nowrap; /* Prevent text from wrapping */
	overflow: hidden; /* Hide any overflowing text */
	text-overflow: ellipsis; /* Show ellipsis (...) for long texts */
}

/* Adjust font size for table header cells (th) */
table.w3-table-all th.title {
	font-size: 16px; /* Default font size for the title column */
	max-width: 150px; /* Adjust this value based on your requirements */
	white-space: nowrap; /* Prevent text from wrapping */
	overflow: hidden; /* Hide any overflowing text */
	text-overflow: ellipsis; /* Show ellipsis (...) for long texts */
}

/* ======================================================================= */
body {
	background-color: #F5F6F7;
	font-size: 14px;
	color: #222;
	line-height: 1.5em;
	margin: 0;
}

.member {
	/* border: 1px solid #000; */
	width: 900px;
	margin: auto;
	padding: 0 20px;
}

.member .logo {
	display: block;
	margin: 50px auto;
}

.member .field.time {
	/* border: 1px solid red; */
	margin-bottom: 5px;
}

.member input:not(input[type="radio"]), .member select {
	padding: 15px;
	width: 100%;
	box-sizing: border-box;
	border: 1px solid #dadada;
	margin-bottom: 5px;
}

.field.choice div {
	border: 1px solid #dadada;
	padding: 15px;
	background-color: #fff;
	margin-bottom: 5px;
}

input[type=radio] {
	accent-color: #318234;
}

.field.date article {
	display: flex;
	gap: 10px;
}

.field.date button {
	flex: 1;
	background-color: #ffffff;
	border: 1px solid #dadada;
	margin-bottom: 5px;
	padding: 15px;
	cursor: pointer;
}

.field.search article {
	display: flex;
	gap: 10px;
}

.field.search button, .field.search input, .field.search select {
	flex: 1;
	background-color: #ffffff;
	border: 1px solid #dadada;
	margin-bottom: 5px;
	padding: 15px;
	cursor: pointer;
}

.field.search button:hover, .field.date button:hover {
	background-color: #318234;
	color: white;
}

.result button {
	flex: 1;
	background-color: #318234;
	border: 1px solid #dadada;
	color: white;
	margin-bottom: 5px;
	padding: 15px;
	cursor: pointer;
}

.result button:hover {
	background-color: rgb(191, 109, 61);
	color: white;
}

.placehold-text {
	/* border: 1px solid #000; */
	position: relative;
	display: block;
}

.datepicker {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	background-color: #fff;
	border: 1px solid #ddd;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 9999;
}

.page-transition {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: white;
	z-index: 9999;
	transition: transform 1s ease-in-out;
}

.page-transition.incoming {
	transform: translateY(100%);
}

.page-transition.outgoing {
	transform: translateY(-100%);
}
</style>
	<style>
table.w3-table-all td {
	font-size: 14px;
}

table.w3-table-all th.title {
	font-size: 16px;
}
</style>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.496486063, 127.028361548), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨 
}; 

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 



</script>


<script>
    function submitForm() {
        let con = "";
        const shopCategories = document.querySelectorAll("input[name='shopCategory']");

        for (let i = 0; i < shopCategories.length; i++) {
            if (shopCategories[i].checked) {
                con = shopCategories[i].value;
            }
        }

        const si = document.getElementById("si").value;
        const gu = document.getElementById("gu").value;
        const queryString = 'con=' + con + '&si=' + si + '&gu=' + gu;

        if (!con) {
            alert("항목을 선택해주세요");
            return;
        }

        location.href = '${pageContext.request.contextPath}/api/maps?' + queryString;
    
    }
   		function geolocationForm() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;

                var locPosition = new kakao.maps.LatLng(lat, lon);
                displayMarker(locPosition);
            });
        } else {
            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
            displayMarker(locPosition);
        }

        function displayMarker(locPosition) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: locPosition
            });

            map.setCenter(locPosition);
        }

        var positions2 = [
            <c:forEach var="c" items="${li}">
                {
                    title: '${c.name}',
                    latlng: new kakao.maps.LatLng('${c.latitude}', '${c.longitude}')
                },
            </c:forEach>
        ];

        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (var c = 0; c < positions2.length; c++) {
            var imageSize = new kakao.maps.Size(24, 35);
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            var marker = new kakao.maps.Marker({
                map: map,
                position: positions2[c].latlng,
                title: positions2[c].title,
                image: markerImage
            });
        }
   		}
</script>

</head>

<body>
	<div class="member">
		<!-- 2. 항목 선택하기 -->
		<div class="field choice">
			<b>선택</b>
			<div>
				<label><input type="radio" name="shopCategory" value='1'>Hotel</label>
				<label><input type="radio" name="shopCategory" value='2'>Beauty</label>

				
			</div>
			
		</div>

		<!-- 3. 위치 검색 -->
		<div class="field search">
			<b>위치검색</b>
			<article>
				<select id="si">
					<option value="서울">서울</option>	
				</select> <select id='gu'>
					<option value="강남구">강남구</option>
					<option value="관악구">관악구</option>
					<option value="송파구">송파구</option>
				</select>
				<button onclick="submitForm()" id="resultButton">
					<span> 결과 확인하기 </span>
				</button>
				<button id="geo" onclick="geolocationForm()">
					<span>현재 위치</span>
				</button>
			</article>
		</div>
	</div>



	<div style="display: flex; justify-content: center;">
		<div id="map"
			style="width: 860px; height: 300px; position: relative; overflow: hidden;"></div>
	</div>
	<div class="map_wrap" style="display: flex; justify-content: center;">
		<div id="menu_wrap" class="bg_white"
			style="height: 200px; position: relative; width: 860px;">
			<div class="option"></div>

			<div id="placesList">
				<table class="w3-table-all" style="color: #000; width: 100%;">
					<tbody>
						<tr class="w3-grey">
							<th class="title" style="max-width: 150px;">이름</th>
							<th style="max-width: 150px;">주소</th>
							<th style="max-width: 150px;">서비스</th>
							<th style="max-width: 150px;">영업시간</th>
							<th style="max-width: 150px;">마감시간</th>
							<th style="max-width: 150px;">전화번호</th>
						</tr>
					</tbody>
					<tbody>
						<c:forEach var="m" items="${li}">
							<tr>
								<td style="max-width: 150px;">${m.name}</td>
								<td style="max-width: 150px;">${m.location3}</td>
								<td style="max-width: 150px;">${m.details}</td>
								<td style="max-width: 150px;">${m.open_time}</td>
								<td style="max-width: 150px;">${m.close_time}</td>
								<td style="max-width: 150px;">${m.TEL_NO}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.496486063, 127.028361548), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨 
}; 

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 



</script>
</body>
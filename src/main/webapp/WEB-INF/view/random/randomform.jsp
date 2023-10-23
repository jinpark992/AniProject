<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Random Pet Selector</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

.con {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px;
	text-align: center;
}

.roulette {
	overflow: hidden;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.items1 {
	width: 260px;
	height: 360px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	animation: spin 4s linear infinite;
	animation-delay: -1s;
	overflow: hidden;
}

.item1 {
	width: 100px;
	height: 100px;
	background-color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
}

.item1:hover {
	background-color: #f2f2f2;
}

.spin-buttons {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.spin-button {
	padding: 10px 20px;
	font-size: 14px;
	background-color: #007bff;
	border: none;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
}

@
keyframes spin { 0% {
	transform: translateY(-100%);
}
100


%
{
transform


:


translateY
(


0


)
;


}
}
</style>
</head>

<body>
	<div class="con">
		<!-- 콘텐츠 영역 시작 -->
		<h1>우리 강아지 랜덤 선택 리스트!</h1>
		<!-- 페이지 제목 -->
		<div class="roulette">
			<!-- 룰렛을 담는 컨테이너 -->
			<div class="items1">
				<!-- 룰렛 아이템들을 담는 컨테이너 -->
				<c:forEach var="str" items="${li}">
					<!-- JSTL forEach를 통해 리스트 아이템들을 반복 -->
					<div class="item1">${str}</div>
					<!-- 룰렛 아이템 (강아지 종류 등) -->
				</c:forEach>
			</div>
		</div>
		<!-- 룰렛과 아이템들을 감싸는 컨테이너 -->

		<div class="spin-buttons">
			<!-- 스핀 버튼들을 담는 컨테이너 -->
			<button class="spin-button" onclick="toggleRoulette()">시작하기</button>
			<!-- 룰렛 동작 시작 버튼 -->
			<button class="spin-button" onclick="stopRoulette()">멈추기</button>
			<!-- 룰렛 동작 멈추기 버튼 -->
		</div>
		<!-- 스핀 버튼들을 담는 컨테이너 끝 -->
	</div>
	<!-- 콘텐츠 영역 끝 -->

	<script>
    // JavaScript 코드 시작

    let spinning = false;
    let selectedItemIndex = -1;
    // 변수 초기화

    const items = document.querySelectorAll('.item1');
    const itembox = document.querySelector('.items1');
    const spinButtonText = document.querySelector('.spin-button');
    // HTML 엘리먼트들을 변수로 저장

    function toggleRoulette() {
        // 룰렛 동작 상태 전환 함수
        if (spinning) {
            spinning = false;
            spinButtonText.textContent = '다시 동작하기';
            itembox.style.animation = 'none';
            selectRandomItem();
            // 동작 중이면 멈춤
        } else {
            spinning = true;
            spinButtonText.textContent = '동작 중지';
            itembox.style.animation = 'spin 4s linear infinite';
            // 멈춰있으면 동작 시작
        }
    }

    function selectRandomItem() {
        // 랜덤으로 아이템 선택 함수
        if (selectedItemIndex !== -1) {
            items[selectedItemIndex].style.backgroundColor = '#fff';
        }
        // 이전 선택된 아이템 색상 초기화

        selectedItemIndex = Math.floor(Math.random() * items.length);
        items[selectedItemIndex].style.backgroundColor = 'yellow';
        // 새로운 아이템 선택 및 표시
    }

    function stopRoulette() {
        // 룰렛 멈추기 함수
        if (spinning) {
            toggleRoulette();
        }
        // 동작 중이면 멈춤
    }

    for (let i = 0; i < items.length; i++) {
        items[i].addEventListener('click', () => {
            items[i].style.backgroundColor = 'white';
            itembox.style.animationPlayState = 'paused';
        });
    }
    // 아이템을 클릭했을 때 이벤트 처리
    // JavaScript 코드 종료
</script>
</body>
</html>

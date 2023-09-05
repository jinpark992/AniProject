<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        }

        .con {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .roulette {
            overflow: hidden;
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

        .spin-buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
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

        @keyframes spin {
            0% { transform: translateY(-100%); }
            100% { transform: translateY(0); }
        }
    </style>
</head>

<body>
 <div class="con">
    <div class="roulette">
        <div class="items1">
        
        <c:forEach var="str" items="${li}">        
        <div class="item1">${str}</div>
        </c:forEach>
            
           <!--  <div class="item1">터그놀기 100번</div>
            <div class="item1">산책갔다 맛있는거 먹기</div>
            <div class="item1">간식사주기</div>
            <div class="item1">옷사주기</div>
            <div class="item1">반려견놀이터가기</div> -->
        </div>
    </div> 
    
    
    <div class="spin-buttons">
        <button class="spin-button" onclick="toggleRoulette()">시작하기</button>
        <button class="spin-button" onclick="stopRoulette()">멈추기</button>
    </div>
</div>


<script>
    let spinning = false;
    let selectedItemIndex = -1;
    const items = document.querySelectorAll('.item1');
    const itembox = document.querySelector('.items1');
    const spinButtonText = document.querySelector('.spin-button');

    function toggleRoulette() {
        if (spinning) {
            spinning = false;
            spinButtonText.textContent = '다시 동작하기';
            itembox.style.animation = 'none';
            selectRandomItem();
        } else {
            spinning = true;
            spinButtonText.textContent = '동작 중지';
            itembox.style.animation = 'spin 4s linear infinite';
        }
    }

    function selectRandomItem() {
        if (selectedItemIndex !== -1) {
            items[selectedItemIndex].style.backgroundColor = '#fff';
        }
        selectedItemIndex = Math.floor(Math.random() * items.length);
        items[selectedItemIndex].style.backgroundColor = 'yellow';
    }

    function stopRoulette() {
        if (spinning) {
            toggleRoulette();
        }
    }

    for (let i = 0; i < items.length; i++) {
        items[i].addEventListener('click', () => {
            items[i].style.backgroundColor = 'white';
            itembox.style.animationPlayState = 'paused';
        });
    }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Random Pet Selector</title>
   <style>

.items1 {
 /* // position: absolute; */
  width: 300px;
  height: 400px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  animation: spin 4s linear infinite;
  animation-delay: -1s; /* Add a negative delay to make items start off-screen */
}

.item1 {
  width: 100px;
  height: 100px;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 10px;
  font-size: 16px;
  cursor: pointer;
}

.spin-button {
  padding: 10px 20px;
  font-size: 16px;
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
 
 <div class="container">
    <div class="roulette">
      <div class="items1">
        <!-- Add your pet items here with their names -->
        <div class="item1">노즈워크 화려하게</div>
        <div class="item1">터그놀기 100번</div>
        <div class="item1">산책갔다 맛있는거 먹기</div>
            <div class="item1">간식사주기 </div>
             <div class="item1">옷사주기</div>
            <div class="item1">반려견놀이터가기</div>        
        <!-- Add more items as needed -->
      </div>
    </div>
    <button class="spin-button" onclick="spinRoulette()"><h1>동작하기</h1></button>
  </div>
 
 
 
 
 <script>  
    let spinning = false;
    let selectedItemIndex = -1;
    const items = document.querySelectorAll('.item1');
    const itembox = document.querySelector('.items1');
   
    
    function spinRoulette() {
     
       
        itembox.style.animation = 'spin 4s linear infinite';
        
        for (let i = 0; i < items.length; i++) {
         
         items[i].style.backgroundColor="white"
         
      }
       
      }
  
    
    
    
    for (let i = 0; i < items.length; i++) {
      
      items[i].addEventListener('click', () => {
         
         items[i].style.backgroundColor="red"
         itembox.style.animationPlayState = 'paused';
      })
      
    }
    
    
   
    
  
 
    
    
    
    
    </script>

</body>
</html>
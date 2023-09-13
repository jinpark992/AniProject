<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>${board1Name} 수정</title>
   <style>
       body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        .form-container {
            max-width: 400px;
            margin: 0 auto;
        }

        .form-label {
            font-weight: bold;
        }

        .form-select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .input-group {
            width: 100%;
        }

        .img-thumbnail {
            max-width: 100%;
            height: auto;
        }

        .form-button {
            width: 100%;
            padding: 8px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <form class="w3-container" method="post" action="${pageContext.request.contextPath}/board1/board1UpdatePro" enctype="multipart/form-data">
            <input type="hidden" name="num" value="${board1.num}">
            <input type="hidden" name="boardNum" value="${boardNum}">
            <input type="hidden" name="file1" value="${board1.file1}">
            
            <h3 class="text-center mb-4">게시판 수정</h3>

            <div class="mb-3">
                <label class="form-label">지역</label>
                <select class="form-select" name="location" value="${board1.location}">
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="광주">광주</option>
                    <option value="제주">제주</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">추천</label>
                <select class="form-select" name="recommendation">
                    <option value="호텔">호텔</option>
                    <option value="상품">상품</option>
                    <option value="여행지">여행지</option>
                </select>
            </div>
       
            <div class="mb-3">
                <label class="form-label">작성자</label>
                <input class="form-control" type="text" name="name" value="${nicname}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label class="form-label">비밀번호</label>
                <input class="form-control" type="password" name="pass">
            </div>
            <div class="mb-3">
                <label class="form-label">제목</label>
                <input class="form-control" type="text" name="subject" value="${board1.subject}">
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" style="resize:none" name="content">${board1.content}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">파일</label>
                <input class="form-control" type="file" id="image-file" name="f">
                <img id="image-preview" src="#" alt="Image Preview" class="mt-2 img-thumbnail" style="display: none; max-width: 100%; height: auto;">
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary form-button">수정</button>
            </div>
        </form>
    </div>
</div>

<script>
    function readImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                var imagePreview = document.getElementById('image-preview');
                imagePreview.style.display = 'block';
                imagePreview.src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    document.getElementById('image-file').addEventListener('change', function() {
        readImage(this);
    });
</script>
</body>
</html>

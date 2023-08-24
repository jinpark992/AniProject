<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <div class="mb-3 mt-3">   
        <form method="post" action="${pageContext.request.contextPath}/board3/board3Pro" enctype="multipart/form-data">
            <h3 class="w3-center">게시판 입력</h3>
            <br>

            <p>   
                <label class="form-label">작성자</label>
                <input class="form-control" type="text" name="name" value="${sessionScope.nicname}" readonly>
            </p>
            <p>      
                <label class="form-label">글 비밀번호</label>
                <input class="form-control" type="password" name="pass">
            </p>
            <p>      
                <label class="form-label">제목</label>
                <input class="form-control" type="text" name="subject">
            </p>
            <p>
    			<label class="form-label">지역</label>
    			<select class="form-select" name="location">
        			<option value="서울">서울</option>
        			<option value="경기">경기</option>
        			<option value="인천">인천</option>
        			<option value="강원">강원</option>
        			<option value="충북">충북</option>
        			<option value="충남">충남</option>
        			<option value="전북">전북</option>
        			<option value="전남">전남</option>
        			<option value="경북">경북</option>
        			<option value="경남">경남</option>
        			<option value="제주">제주</option>
    			</select>
			</p>


            <p>      
                <label class="form-label">내용</label>
                <textarea class="form-control" style="resize:none" name="content"></textarea>
            </p>
            <p>      
                <label class="form-label">파일</label>
                <input class="form-control" type="file" name="f" id="image-file">
            </p>

            <!-- 이미지 미리보기를 표시할 영역 -->
            <p>
                <img id="image-preview" style="display: none;" alt="Image Preview" width="100">
            </p>

            <p class="w3-center col d-flex justify-content-center">
                <button type="submit" class="w3-btn w3-padding w3-teal btn btn-primary" style="width:120px">저장</button>
            </p>
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

            reader.readAsDataURL(input.files[0]); // 이미지를 Data URL로 읽음
        }
    }

    // 파일 입력 변경 시 이미지 미리 보기 함수 호출
    document.getElementById('image-file').addEventListener('change', function() {
        readImage(this);
    });
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보공유 게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-lg-6">
            <form method="post" action="${pageContext.request.contextPath}/board2/board2Pro" enctype="multipart/form-data" class="border p-4 rounded shadow">
                <h3 class="text-center mb-4">정보공유 게시판</h3>
                <div class="mb-3">
                    <label class="form-label">지역</label>
                    <select class="form-select" name="location">
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
                    <label class="form-label">가격</label>
                    <div class="input-group">
                        <input class="form-control" type="text" name="price" placeholder="원">
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">배송비</label>
                    <div class="input-group">
                        <input class="form-control" type="text" name="Shipping" placeholder="원">
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">작성자</label>
                    <input class="form-control" type="text" name="name"  value="${nicname}"  readonly="readonly"> <!-- nicname이 아니면 readonly를 통하여 입력 불가하게 만듬 -->
                </div>
                <div class="mb-3">
                    <label class="form-label">비밀번호</label>
                    <input class="form-control" type="password" name="pass">
                </div>
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input class="form-control" type="text" name="subject">
                </div>
                <div class="mb-3">
                    <label class="form-label">내용</label>
                    <textarea class="form-control" style="resize:none" name="content"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">파일</label>
                    <input class="form-control" type="file" id="image-file" name="f">
                    <!-- 이미지 미리 보기를 표시할 엘리먼트 -->	
                    <img id="image-preview" src="#" alt="Image Preview" class="mt-2 img-thumbnail" style="display: none; max-width: 100%; height: auto;">
                </div>
                 
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
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
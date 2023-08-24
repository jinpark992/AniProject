<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>${board2Name} 수정</title>
   <style>
        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .board-table th,
        .board-table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .board-image {
            max-width: 100%;
            height: auto;
        }
        .board-button {
            padding: 5px 10px;
            margin: 5px;
        }
        .comment-input {
            width: 100%;
            resize: none;
            padding: 5px;
            border: 1px solid #ccc;
        }
        .comment-button {
            padding: 5px 10px;
            margin: 5px;
        }
        .comment-list {
            padding-top: 20px;
            border-top: 1px solid #ccc;
        }
        .comment-item {	
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f8f9fa;
        }
        .comment-right {
        text-align: right;
        }
	        
.comment {
    display: flex;
    flex-direction: row;
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
    align-items: center; /* 수직 가운데 정렬 */
}

.comment-content {
    flex: 1; /* 남은 공간 모두 차지 */
    font-size: 14px;
}

.comment-actions {
    display: flex;
    flex-direction: row; /* 수정 버튼과 삭제 버튼을 가로로 나열 */
    margin-left: 10px;
}

.edit-button, .delete-button {
    margin-right: 10px; /* 버튼 사이 간격 설정 */
}

.comment-date {
    font-size: 12px;
    color: #888;
}
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <form class="w3-container" method="post" action="${pageContext.request.contextPath}/board2/board2UpdatePro" enctype="multipart/form-data">
            <input type="hidden" name="num" value="${board2.num}">
            <input type="hidden" name="boardNum" value="${boardNum}">
            
           
            <input type="hidden" name="file1" value="${board2.file1}">	
                <h3 class="text-center mb-4">정보공유 게시판 수정</h3>
           
            <div class="mb-3">	
                <label class="form-label">지역</label>
                    <select class="form-select" name="location" value="${board2.location}">
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
                        <input class="form-control" type="text" name="shipping" placeholder="원">
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
                <input class="form-control" type="text" name="subject" value="${board2.subject}">
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" style="resize:none" name="content">${board2.content}</textarea>
            </div>
               <div class="mb-3">
                    <label class="form-label">파일</label>
                    <input class="form-control" type="file" id="image-file" name="f">
                    <!-- 이미지 미리 보기를 표시할 엘리먼트 -->	
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
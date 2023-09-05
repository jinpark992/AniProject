<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        .w3-table-all {
            border-collapse: collapse;
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }

        .w3-table-all caption {
            text-align: left;
            font-weight: bold;
        }

        .w3-table-all tr td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .w3-center {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            color: #fff;
        }
    </style>
</head>
<body>	
<div class="container">
    <form action="${pageContext.request.contextPath}/board2/board2DeletePro" name="f" method="post">
        <input type="hidden" name="num" value="${num}">
        <table class="w3-table-all">
				<tr>
                <td class="form-group">
                    <label for="pass">게시글 비밀번호</label>
                    <input type="password" id="pass" name="pass" class="form-control">
                </td>
            </tr>
            <tr>
                <td class="w3-center">
                    <input type="submit" value="게시글 삭제" class="btn btn-primary">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
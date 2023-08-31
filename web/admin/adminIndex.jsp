<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <script src="./js/jquery-1.10.0.js"></script>
    <link rel="stylesheet" href="./vdo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: darkgreen; color:#fff; }
        .title { text-align: center; padding-top: 50px; padding-bottom: 100px; background-color: darkgreen; color: white; border-radius: 25px; margin-top: 10px; margin-bottom: 60px; }
        .book-section section {
            display: inline-flex;
            flex-direction: column;
        }
        .book-section span {
            font-size:26px; text-align: center;  color: #000000; font-weight: 900;
        }
        .book-section span:nth-child(3) {
            font-size:26px; text-align: center;  color: #0B7B20; font-weight: 900;
        }
        .book-section p {
            font-size:26px; text-align: center;  color: #000000; font-weight: 900;
        }
        .book-section p:first-child {
            font-size:26px; text-align: center;  color: #0B7B20; font-weight: 900;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Admin</a></li>
                    <li class="breadcrumb-item active" aria-current="page">AdminPageList</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">관리자 페이지 메뉴</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-success" id="tb1">
                    <tbody>
                    <tr>
                        <th>상품목록</th>
                        <td><a href="" class="btn btn-success">상품목록</td>
                    </tr>
                    <tr>
                        <th>상품등록</th>
                        <td><a href="" class="btn btn-warning">상품등록</td>
                    </tr>
                    <tr>
                        <th>상품입고</th>
                        <td><a href="" class="btn btn-danger">상품입고</td>
                    </tr>
                    <tr>
                        <th>배송목록</th>
                        <td><a href="" class="btn btn-primary">배송목록</a></td>
                    </tr>
                    <tr>
                        <th>회원목록</th>
                        <td><a href="" class="btn btn-success">회원목록</a></td>
                    </tr>
                    <tr>
                        <th>공지사항목록</th>
                        <td><a href="" class="btn btn-warning">공지사항목록</td>
                    </tr>
                    <tr>
                        <th>이벤트목록</th>
                        <td><a href="" class="btn btn-danger">이벤트목록</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }" class="btn btn-outline-success" style="float: right">메인으로</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
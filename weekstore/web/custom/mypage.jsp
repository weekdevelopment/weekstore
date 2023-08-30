<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: darkgreen; color:#fff; }
        .title { text-align: center; padding-top: 50px; padding-bottom: 100px; background-color: darkgreen; color: white; border-radius: 25px; margin-top: 10px; margin-bottom: 60px; }
        .item1 { width:10%; }
        .item2 { width:70%; }
        .item3 { width:10%; }
        .item4 { width:10%; }
        #page-nation1 { width: 960px; margin:20px auto; }
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
                    <li class="breadcrumb-item"><a href="#">Custom</a></li>
                    <li class="breadcrumb-item active" aria-current="page">My Page</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">내 정보보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-success" id="tb1">
                    <tbody>
                    <tr>
                        <th>아이디</th>
                        <td>${cus.id }</td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            ${cus.pw }
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${cus.name }</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>${cus.birth }</td>
                    </tr>
                    <tr>
                        <th>가입일시</th>
                        <td>${cus.regdate }</td>
                    </tr>
                    <tr>
                        <th>가입구분</th>
                        <td>
                            <c:if test="${cus.job == 0}">
                                학생
                            </c:if>
                            <c:if test="${cus.job == 1}">
                                부모님
                            </c:if>
                            <c:if test="${cus.job == 2}">
                                선생님
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${cus.email }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${cus.addr }</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>${cus.tel }</td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td>${cus.point }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/MyInfoUpdate.do?id=${cus.id }" class="btn btn-outline-success">회원정보수정</a>
                    <a href="${path }" class="btn btn-outline-success">메인으로</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
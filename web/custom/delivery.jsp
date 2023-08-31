<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #0B7B20; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:20%; }
        .item3 { width:55%; }
        .item4 { width:15%; }
        #tb1 td {
            background-color: #d1e7dd;
        }
        .btn-primary {
            background-color: #0B7B20;
            border-color: #0B7B20;
            margin: 10px 170px 30px 169px;
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
                    <li class="breadcrumb-item"><a href="${path }/Mypage.do">마이페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="page">배송조회</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">배송 조회</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th>배송 번호</th>
                        <td>${del.dno }
                        </td>
                    </tr>
                    <tr>
                        <th>주문자</th>
                        <td> ${del.cid } / ${del.custel }</td>
                    </tr>
                    <tr>
                        <th>주문일시</th>
                        <td>${del.sdate }</td>
                    </tr>
                    <tr>
                        <th>배송 상태</th>
                        <td>
                            <c:if test="${del.pstate == 0}">
                                <p>배송 전</p>
                            </c:if>
                            <c:if test="${del.pstate == 1}">
                                <p>배송중</p>
                            </c:if>
                            <c:if test="${del.pstate == 2}">
                                <p>배송완료</p>
                            </c:if>
                            <c:if test="${del.pstate == 3}">
                                <p>구매완료</p>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>배송사</th>
                        <td>
                            ${del.pcom }
                        </td>
                    </tr>
                    <tr>
                        <th>배송처 연락처</th>
                        <td>
                            ${del.ptel }
                        </td>
                    </tr>
                    <tr>
                        <th>배송 시작일</th>
                        <td>
                            ${del.sdate }
                        </td>
                    </tr>
                    <tr>
                        <th>배송 완료일</th>
                        <td>
                            ${del.rdate }
                        </td>
                    </tr>
                    <tr>
                        <th>송장 번호</th>
                        <td>
                            ${del.bcode }
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/PaymentList.do" class="btn btn-primary">결제 목록</a>
                </div>

            </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
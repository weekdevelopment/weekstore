<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeekStore</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
</head>
<body>
    <div class="container">

        <header class="hd" id="hd">
            <%@include file="/header.jsp" %>
        </header>

        <div class="contents" id="contents">
            <h2>사용자 : ${user }</h2>
            <h2>메인 절대 주소 : ${realPath }</h2>
            <h2>메인 상대 주소 : ${path }</h2>
        </div>

        <footer class="ft" id="ft">

        </footer>

    </div>
</body>
</html>
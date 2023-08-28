<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<header class="header container-fluid" id="hd">
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="${path1 }">WeekStore</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown link
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav justify-content-end">
                        <c:if test="${sid eq 'admin' }">
                            <li class="nav-item">
                                <a class="nav-link" href="${path1 }/Admin.do">Admin</a>
                            </li>
                        </c:if>
                        <c:if test="${!empty sid }">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${path1 }">Mypage</a>
                            </li>
                        </c:if>
                        <c:if test="${empty sid }">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${path1 }">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${path1 }/Join.do">Join</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${path1 }">Contact Us</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
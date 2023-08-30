<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
</head>
<style>
    .divider:after,
    .divider:before {
        content: "";
        flex: 1;
        height: 1px;
        background: #eee;
    }
    .h-custom {
        height: calc(100% - 73px);
    }
    @media (max-width: 450px) {
        .h-custom {
            height: 100%;
        }
    }

    .btn {
        color: white;
        background-color: #1D7151;
        border-color: #1D7151;
    }

    .small {
        font-size: 16px;
    }

    .img-fluid {
        border-radius: 100px;
        overflow: hidden;
    }

</style>
<body>
<section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
                <img src="/images/login2.png"
                     class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                <form action="${path }/LoginPro.do">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="/images/loginlogo.png"
                             class="img" alt="loginlogo">
                    </div>

                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0"></p>
                    </div>

                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="id" name="id" class="form-control form-control-lg"
                               placeholder="아이디를 입력해주세요." />
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input type="password" id="pw" name="pw" class="form-control form-control-lg"
                               placeholder="비밀번호를 입력해주세요." />
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                            <label class="form-check-label" for="form2Example3">
                                자동로그인
                            </label>
                        </div>
                        <a href="#!" class="text-body">비밀번호를 잊으셨나요?</a>
                    </div>

                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">로그인하기</button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">계정이 없으신가요? <a href="#!"
                                                                                          class="link-danger">회원가입</a></p>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <jsp:include page="../common.jsp" />
    <style>
    .btn-group { float: right }
    h2 { text-align: center; padding-top: 50px; padding-bottom: 100px; background-color: darkgreen; color: white; border-radius: 25px; margin-top: 10px; margin-bottom: 60px; }
    th { text-align: center }
    </style>
</head>
<body>
<div class="container" id="container">
    <jsp:include page="../header.jsp" />

    <h2>회원가입</h2>
    <form name="frm1" id="frm1" action="${path }/joinPro.do" method="post" onsubmit="return joincheck(this)" >
        <table class="table">
            <tr>
                <th>아이디</th>
                <td>
                    <div class="form-row">
                        <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" class="form-control" pattern="^[a-z0-9]{8,16}" maxlength="16" autofocus required>
                        <input type="button" class="btn btn-success" value="아이디 중복 확인" onclick="idCheck()">
                        <input type="hidden" name="idck" id="idck" value="no">
                    </div>
                    <div>
                        <c:if test="${empty qid }">
                            <p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
                        </c:if>
                        <c:if test="${not empty qid }">
                            <p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
                        </c:if>
                    </div>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                    <p>비밀번호는 최소 8자리에서 최대 16자리까지 숫자, 영문, 특수문자 각 1개 이상 포함되어야 합니다. </p>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" name="pw2" id="pw2" class="form-control" placeholder="비밀번호 확인을 입력하세요" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>

                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요" required>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>
                    <input type="tel" name="tel" id="tel" class="form-control" placeholder="전화번호를 숫자만 입력하세요" required>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요" required>
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>
                    <input type="date" name="birth" id="birth" class="form-control" placeholder="생년월일을 입력하세요" required>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <button type="button" id="post_btn" onclick="findAddr()" class="btn btn-success">주소 검색</button>
                    <input type="text" name="address1" id="address1" placeholder="주소 검색을 눌러주세요." class="form-control" required /><br>
                    <input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
                    <input type="text" name="postcode" id="postcode" placeholder="우편번호" class="form-control" readonly />
                </td>
            </tr>
        </table>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <input type="submit" name="submit-btn" class="btn btn-outline-success" value="회원가입">
            <input type="reset" name="reset-btn" class="btn btn-outline-success" value="취소">
            <a href="${path }/Login.do" class="btn btn-outline-success">로그인</a>
        </div>
    </form>
    <script>
        $(document).ready(function(){
           $("#id").keyup(function(){
               $("#idck").val("no");
               if($(this).val()!=""){
                   $("#msg").html("<strong>아이디 입력중입니다.</strong>");
                   $("#id").focus();
               } else {
                   $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
               }
           });
        });
    function idCheck(){
        if($("#id").val()==""){
            alert("아이디를 입력하지 않았습니다.");
            $("#id").focus();
            return;
        }
        var params = { id:$("#id").val() }
        $.ajax({
            url:"${path }/IdCheck.do",
            type:"post",
            dataType:"json",
            data:params,
            success:function(data){ // console.log(data);
                var idPass = data.result;
                if(idPass==false){
                    $("#idck").val("no");
                    $("#msg").html("<strong style='color:red'>사용되고 있는 아이디입니다. 다시 입력하시기 바랍니다.</strong>");
                    $("#id").focus();
                } else if(idPass==true){
                    $("#idck").val("yes");
                    $("#msg").html("<strong style='color:blue'>사용 가능한 아이디입니다.</strong>");
                } else if(idPass==""){
                    $("#msg").text("<strong style='color:red'>아이디가 확인되지 않았습니다. 다시 시도하시기 바랍니다.</strong>");
                }
            }
        });
    }
    </script>
    <script>
        function joincheck(f){
            if(f.pw.value!=f.pw2.value){
                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.")
                f.pw.focus();
                return false;
            }
            if(f.idck.value!="yes"){
                alert("아이디 중복 체크를 하지 않으셨습니다.");
                return false;
            }
        }
        function findAddr(){
            new daum.Postcode({
                oncomplete:function(data){
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.fibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("address1").value = roadAddr;
                    } else if (jibunAddr !== ''){
                        document.getElementById("address1").value = jibunAddr;
                    }
                    document.getElementById("address2").focus();
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</body>
</html>
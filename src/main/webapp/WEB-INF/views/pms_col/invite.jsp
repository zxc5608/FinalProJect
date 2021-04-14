<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .wrap { width:100%; position:relative; background:#7f7f7f; }
    .align_center { width:500px; height:430px; position:absolute; 
    background:lavender; top:50%; left:50%; margin:-100px 0 0 -210px; 
    margin-top:200px;
    text-align:center; }
    
    .i_1{
    margin-top: 70px;
    font-size: 20px;}
    
    .i_2{
      height: 100px;
      text-align: center
    
    }
    .i_3{
    height:100px; 
    width: 80px; "
    }
    
    .i_4{
    width: 120px;
    height: 60px;
    margin-top: 20px;
    background: floralwhite;
    border: 1px solid gray;
    }
</style>





</head>



<body>
   <div class="wrap">
 
    <div class="align_center">
    <form action>
        <p class="i_2"> <a href="">
        <img class="i_3" src="../img/PMS-logo-white.png" id="" alt="#" />
        </a></p>
          <c:forEach items="${invitelist }" var="invite">
        <span style="text-align: center;">${invite.prjctnm } </span><hr>
	        <span>프로젝트번호:${param.prjctno}</span>
	        <div class="i_1">
	        <br class="i_2"><strong>&nbsp;${param.usernm }님이 프로젝트에 초대합니다.</strong>
	        <br>(&nbsp;${invite.membercnt }명 프로젝트에 참여중입니다.)
    	
	     </c:forEach>
    	</div>
    	<input class="i_4" type="button" value="바로 시작하기" onclick="location.href='/user/loginviewtwo'">
    </form>
    	
    </div>
    
    

</div>



</body>
</html>
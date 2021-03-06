<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세</title>

	<link rel="apple-touch-icon" href="touch-icon-iphone.png" /> 
	<link rel="apple-touch-icon" sizes="76x76" href="touch-icon-ipad.png" /> 
	<link rel="apple-touch-icon" sizes="120x120" href="touch-icon-iphone-retina.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad-retina.png" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

	<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="../css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" href="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.css"/>
	<link href="../css/helper.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />


<style>
.notice_content{
	
	height : 200px;
}
#date{
	float: right;
}
</style>


</head>
<body>



		<section class="content">
			
	<p style="font-size: 20px; font-style : border; margin-left:88px; ">공지사항</p>


		<!--
	 		////////////////////////
			Dynamic content STARTS here
			////////////////////////
		-->



		


	<div class="row" style="width: 100%; margin-left: 50px;">
		<form id="frm" role="form" >
			<div class="col-md-12">
				<article class="widget" style="width: 1110px;">
					<header class="widget__header1">
						<strong  >제목:${notice.noticesj }</strong><br><hr>
						<p>날짜:${notice.writngde }</p><hr>
						
					</header>

					<div class="notice_content">
					내용:
					
						${notice.noticecn }
					
					</div>
					<c:choose>
						<c:when test="${author eq 1 }">
							<button type="button"  style="display: block;
								 background: #333; color: white; margin-top: 20px; height: 30px;" id="modifyBtn">수정하기</button>
							<button type="button"  style="display: block;
    						background: #333; color: white; margin-top: 20px; height: 30px;" id="deleteBtn" >삭제</button>
							<input type="hidden" value="${notice.sntncno}" name="sntncno">
							<input type="hidden" value="${notice.noticesj }" name="noticesj">
							<input type="hidden" value="${notice.writngde }" name="writngde">
							<input type="hidden" value="${notice.noticecn }" name="noticecn">
						</c:when>
						
						<c:otherwise>
							<input type="button" value="수정하기" style="display: block;
   							 background: #333; color: white; margin-top: 20px; height: 30px;">
						</c:otherwise>
					
					</c:choose>
					
				</article>
			</div>
			</form>
		</div>
			



		<!--
	 		////////////////////////
			Dynamic content ENDS here 
			//////////////////////// 	
		-->

	</section> <!-- /content -->
	
	<!-- <footer class="main-footer">
		<a class="back-top" href="#"><i class="pe-7s-angle-up-circle"></i></a>
		<p>2013 Â© Levo by Pixeden.</p>
	</footer> -->






<!-- Scripts -->
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/chart.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-us-aea-en.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>



</body>

<script>
$(function(){
	$("#modifyBtn").on("click", function(){
		$("#frm").attr("method", "get");
		$("#frm").attr("action", "/notice/noticeModify");
		$("#frm").submit();
	});
	
	$("#deleteBtn").on("click", function(){
		$("#frm").attr("method", "post");
		$("#frm").attr("action", "/notice/noticeDelete");
		$("#frm").submit();
	});
	
	
})



</script>
</html>
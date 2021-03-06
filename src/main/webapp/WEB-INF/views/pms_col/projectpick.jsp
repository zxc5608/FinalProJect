<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>27AGE</title>

	<link rel="apple-touch-icon" href="/img/touch-icon-iphone.png" /> 
	<link rel="apple-touch-icon" sizes="76x76" href="/img/touch-icon-ipad.png" /> 
	<link rel="apple-touch-icon" sizes="120x120" href="/img/touch-icon-iphone-retina.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="/img/touch-icon-ipad-retina.png" />
	<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" href="/jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.css"/>
	<link href="/css/helper.css" rel="stylesheet" />
	<link href="/css/style.css" rel="stylesheet" />

</head>
<style>
</style>
<script>
 $(function(){
	 $(".prj").on("click",'#deleterecycle',function(){
			$("#frm").attr("method","post");
			$("#frm").attr("action","${cp}/project/deleterecycle");
			$("#frm").submit();
			alert("프로젝트를 삭제합니다.")
	 });

	 
	 $('.prj').on("click", '#fa1',function(){
		 //ajax를 써서 값이 바뀌면 cheked
		 console.log($(this).attr('class'))
		 if($(this).attr('class') == 'fa fa-star'){
			 
			 $(this).attr('class', 'fa fa-star-o');
			 
			 var prjctno =  $(this).parents().children("#prjctno").val();
			 console.log(prjctno)
			 location.href="${cp}/project/favorite2?prjctno="+prjctno;
// 			 alert("즐겨찾기 해제")
			 
		 }else{
			 $(this).attr('class', 'fa fa-star');
			 
			 var prjctno = $(this).parents().children('#prjctno').val();
			 
			 location.href="${cp}/project/favoritepro2?prjctno="+prjctno;
// 			 alert("즐겨찾기 추가")
		 }
	 });
 })
</script>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrapper">
	<%@ include file="/WEB-INF/views/common/left.jsp" %>
		
	<section class="content">
		<header class="main-header clearfix">
			<h1 class="main-header__title" style="margin-top: 15px;"><i class="icon pe-7s-home" style=""></i>&nbsp;프로젝트 선택</h1>
			
			<a href="/project/recyclebin" class="btn btn-light" >휴지통&nbsp;&nbsp;&nbsp;&nbsp;<i class="pe-7s-trash" style="font-size: 30px;"></i></a>
		</header>

		<c:forEach items="${prolist}" var="pro">
			<div class="col-md-3 col-sm-6 prj">
				<form action="/project/completepro" id="frm">
					<input type="hidden" id="prjctno" name="prjctno" value="${pro.prjctno }"/>
					<article class="widget"<c:choose>
											<c:when test="${pro.prjctty==1 }">style="background: moccasin;border-radius: 15px;"</c:when>
											<c:when test="${pro.prjctty==2 }">style="background: darkseagreen;border-radius: 15px;"</c:when>
											<c:otherwise>style="background:lightsteelblue;border-radius: 15px;"</c:otherwise>
										</c:choose>>				
						<header class="widget__header">
							<h3 class="widget__title" style="display: none;">${pro.prjctty}</h3>
							<c:set var="name" value="" />

							<c:if test="${pro.prjctty=='1'}">
							 <h2> 팀 프로젝트</h2>
							</c:if>
							<c:if test="${pro.prjctty=='2'}">
							    <h2>회사 프로젝트</h2>
							</c:if>
							<c:if test="${pro.prjctty=='3'}">
							   <h2>개인 프로젝트</h2> 
							</c:if>

							<div class="widget__config">
								<input type="submit" value="완료" id ="updatebtn"class="btn btn-violet" style="border-radius: 100px;" data-langcode="CLP1003"/>
							</div>
						</header>
						<div class="thumbnail">
							<div class="titlebox">
								<span id="TITLE">${pro.prjctnm }</span><br>
								<span id="officialProject" class="official-project">${pro.prjctcn }</span>
								
							</div>
							<section class="condibox_1">
								<div id="sendience-summary-info" class="parti"><span>${pro.membercnt}</span><span data-langcode="CC1785">명 참여중</span></div>
							</section>
						</div>
					
						<a href="/project/projectMain?prjctno=${pro.prjctno}"><button type="button" class="btn btn-violet">선택</button></a>
						<button type="button" class="btn btn-violet" id="deleterecycle">삭제</button>
						<c:if test="${pro.bkmkat=='1'}">						 
							<span class="fa fa-star" id="fa1" data-star="0" style="font-size: 40px; color : yellow; float:right;"></span>
						</c:if>
				
						<c:if test="${pro.bkmkat=='0'}">						 
							<span class="fa fa-star-o" id="fa1" data-star="0" style="font-size: 40px; color : yellow; float:right;"></span>
						</c:if>
		
					</article>
				</form>
			</div>
		</c:forEach>

		<div class="row"></div>
	</section> <!-- /content -->

	<footer class="main-footer">
		<a class="back-top" href="#"><i class="pe-7s-angle-up-circle"></i></a>
		<p>2021 © hansome is yonghyun.</p>
	</footer>

</div> <!-- /wrapper -->

	<!-- Scripts -->
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/chart.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-us-aea-en.js"></script>
</body>
</html>
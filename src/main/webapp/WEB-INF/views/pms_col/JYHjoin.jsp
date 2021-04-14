<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>27Age</title>

	<link rel="apple-touch-icon" href="touch-icon-iphone.png" /> 
	<link rel="apple-touch-icon" sizes="76x76" href="touch-icon-ipad.png" /> 
	<link rel="apple-touch-icon" sizes="120x120" href="touch-icon-iphone-retina.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad-retina.png" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

	<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="../css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link href="../css/helper.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 	datepicker -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/thems/base/jquery-ui.css" type="text/css"/>
		  
	
<!-- Scripts -->
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 	유효성 검사 -->
	<script type="text/javascript" src="../js/join_check.js"></script>
	<script type="text/javascript" src="../js/JYH_jquery.serializejson.min.js"></script>
<!-- 	datepicker -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
		
	<script>
	 $(function() {
		
			$("#id").keyup(function(){
				if(reg_check()){
					return false;
				}
			}); 
			
			$("#password").keyup(function(){
				if(reg_check()){
					return false;
				}
			});
			
			$("#password_ck").keyup(function(){
				if(reg_check()){
					return false;
				}
			});
			
			$('#emplyrnm').keyup(function(){
				if(reg_check()){
					return false;
				}
			});
			
// 			$('#overcheck').on('click',function(){
// 				idvalue = $('#id').val().trim();
				
// 				$.ajax({
// 					url : "/juser/idcheck";
// 					type:"post",
// 					data : {
// 						"id" : idvalue
// 					},
// 					success : function(res){
// 						$('#checkspan').html(res.sw).css('color','green');
// 					},
// 					error : function(xhr){
// 						alert("상태 : " + xhr.status);
// 					},
// 					dataType : "json"
// 				})
// 			});
			
					 
	   $('#datepicker').datepicker();
	  
	   // Getter
	   var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
	    
	   // Setter
	   $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		
// 	   var today = new Date();
// 	   var endDay = new Date(today.getFulYear()-13, today.getMonth(), today.getDate());
   	   
	   $.datepicker.setDefaults({
        dateFormat: 'yyyy-MM-dd',
        yearRange: "1900:2008",
        changeMonth : true,
        changeYear : true,
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
   	
});
   
	</script>
	
<style type="text/css">

	.valid, .invalid {
	font-size: 11px;
	font-weight: bold;
	}
	
	.valid{color : green;}
	
	.invalid {color : red;}
	
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div class="wrapper">

	<div class="widget__content">
						<table class="table">
							<thead>
								<tr>
									<th>27Age에 계정을 만들어보세요</th>
								
								</tr>
							</thead>
							</table>
							</div>
	
		 <form role="form" action="${pagecontext.request.contextpath }/juser/jjoin" method="post">
<!-- 		회원가입 -->
		<div class="row" style="position: absolute; left: 33%; bottom:3%; min-width: 1200px">
					<h1 style="position: absolute; left:30%; font-size: 30px;">27Age</h1>
					<br><br>
			<div class="col-md-8">
				<article class="widget" style="width: 100%">
					
					<div class="widget__content">
						
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">이메일</h3>						
						</header>
						<input type="text" name="email" class="chk" style="border: none;" placeholder="27Age@gmail.com" />
					    <hr>
					    <span id="emailspan"></span>
					  
				 	    <header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">아이디</h3>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="overcheck" class="btn btn-skyblue" value="중복 확인">
						<span id="checkspan"></span>					
						</header>						
						<input type="text" name="usid" id="id" class="chk" style="border: none;" placeholder="대소문자 최소 6 ~ 12자리" />						
						<hr>
						<span id="idspan"></span>
						
												
						<br><br>
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">비밀번호</h3>						
						</header>
						<input type="password" id="password" name="password" class="chk" style="border: none;" placeholder="최소 6 ~ 12자 이내" />
						<hr>
						
						
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">비밀번호 확인</h3>
						</header>
						<input type="password" id="password_ck" name="password_ck" class="chk" style="border: none;" placeholder="최소 6 ~ 12자 이내" />
						<hr>
						<span id="passwordspan"></span>
						
						
						<br><br>
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">이름</h3>
						</header>
						<input type="text" name="usernm" id="emplyrnm" style="border: none;"						
						class="chk" placeholder="이름" />
						<hr>
						<span id="namespan"></span>
						
						<br><br>
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;">생년월일</h3>						
						</header>
						<input type="text" name="brthday" id="datepicker" style="border: none;" placeholder="생년월일">
						<hr>
						
						
						<header class="widget__header">
						<h3 class="widget__title" style="font-weight: bold ;" style="border: none;">전화번호</h3>
						</header>
						
							<select name="p_no1" class="chk" style="border: none;">
								<option value="010">010</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>							
					
	-				
<input type="text" maxlength='4' name="p_no2" style="width: 60px; border: none;"
    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />-
<input type="text" maxlength='4' name="p_no3" style="width: 60px; border: none;" 
    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
    <br><hr><br>
    		<div style="text-align: center;">
				<input type="submit" id="" name="" class="btn btn-skyblue" value="회원가입"
					style="width: 300px; height:50px; font-size: 1.1em"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
				<a href="/juser/jlogin">취소</a>
					 </div>			
						
					</div>
					<br><br><br>
				</article>
			</div>
		</div>			
		</form>	


</div> <!-- /wrapper -->


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>27AGE</title>

	<link rel="apple-touch-icon" href="touch-icon-iphone.png" /> 
	<link rel="apple-touch-icon" sizes="76x76" href="touch-icon-ipad.png" /> 
	<link rel="apple-touch-icon" sizes="120x120" href="touch-icon-iphone-retina.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad-retina.png" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

	<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="../css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" href="jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.css"/>
	<link href="../css/helper.css" rel="stylesheet" />
	<link href="../css/style.css" rel="stylesheet" />

	<!-- Scripts -->
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../amcharts/amcharts.js"></script>
	<script type="text/javascript" src="../amcharts/serial.js"></script>
	<script type="text/javascript" src="../amcharts/pie.js"></script>
	<script type="text/javascript" src="../js/chart.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-us-aea-en.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>
	
</head>

<body>


	<div class="wrapper login-page">

		<div class="row mtop-100">
			<div class="col-md-4 col-md-offset-4 clearfix bg--dark">
				
				<div class="main-logo">27AGE <br><span></span>
					<p>Project Management System</p>
				</div>
				
<!-- 				로그인 정보 전송 폼 -->
			<form action="/juser/jlogining" method="POST">
				<div class="input-group">
					<span class="input-group-addon"><i class="pe-7f-user pe-fw"></i></span>
					<input type="text" id="id" name="id" class="input-text form-control" placeholder="이메일 또는 아이디" />
				</div>
				<div class="input-group mtop-25">
					<span class="input-group-addon"><i class="pe-7f-lock pe-fw"></i></span>
					<input type="password"  id="password" name="password" class="input-text form-control" placeholder="비밀번호" />
				</div>
				<br>
				<div>
				<input type="checkbox"/> <span style="color: #E6E6E6">로그인 상태 유지</span>
				</div>
				<hr>
				
				
				
				<input type="submit" id="sublogin" style="background-color:#642EFE; color: white;" class="input-text form-control" value="로그인"/>
				
			</form>
				<input type="button" onclick="location.href='/juser/jjoinView'" style="background-color:#9F81F7; color: white;" class="input-text form-control" value="회원가입"/>
				
				
			</div>
		</div>

	</div> <!-- /wrapper -->


	

</body>
</html>
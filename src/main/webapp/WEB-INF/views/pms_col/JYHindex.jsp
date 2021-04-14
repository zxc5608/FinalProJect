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
	<link rel="stylesheet" href="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.css"/>
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
	
	<%@ include file="/WEB-INF/views/common/Mypageheader.jsp" %>

	<div class="wrapper">

	<%@ include file="/WEB-INF/views/common/Mypageleft.jsp" %>
	
		
		<section class="content">				
			
			<div class="row">
				
				<div class="col-md-9">
					<article class="widget widget--tabbed">
						<div class="tabs">
							
							<input type="radio" name="t" id="tab1" checked>
							<label for="tab1" class="tabs__tab">계정 정보</label>
					
							<div class="tabs__content">
								<div class="tabs__content--1">
									
<!-- 	session userid -->
								
								<form action="/juser/jmypage" method="post"></form>
									<div class="media social_msg">
										<figure class="pull-left rounded-image social_msg__img">
											<img class="media-object" src="images/thumb1.jpg" alt="user">
										</figure>
										<div class="media-body">
											<h4 class="media-heading social_msg__heading">Victoria Campel <span>from</span> <span>twitter</span></h4>
											<p class="social_msg__msg">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.</p>
											<small class="social_msg__meta">6 hours ago</small>
										</div>
									</div> <!-- /social-msg -->
									<div class="media social_msg">
										<figure class="pull-left rounded-image social_msg__img">
											<img class="media-object" src="images/thumb2.jpg" alt="user">
										</figure>
										<div class="media-body">
											<h4 class="media-heading social_msg__heading">Joseph Lewis <span>from</span> <span>facebook</span> <i class="pe-7s-link"></i></h4>
											<p class="social_msg__msg">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
											<hr>
											<p class="social_msg__meta--alt">Attachment</p>
											<div class="media attachment_msg">
												<figure class="pull-left">
													<img class="media-object" src="images/thu.png" alt="user">
												</figure>
												<div class="media-body msg_attach">
													<p class="social_msg__msg attach_name">Image-sample.jpg</p>
													<p class="attach_kb">560 KB</p>
													<a href="#" class="attach_links">View</a><a href="#" class="attach_links">Download</a>
												</div>
											</div> <!-- /Attachment -->
											<small class="social_msg__meta">26 Dec, 2013</small>
										</div>
									</div> <!-- /social-msg -->
									<div class="social_msg__reply">
										<input type="text" placeholder="Click here to Reply...">
									</div>

								</div> <!-- /tabs__content 1 -->

								<div class="tabs__content--2">
									<div class="media social_msg">
										<figure class="pull-left rounded-image social_msg__img">
											<img class="media-object" src="images/thumb2.jpg" alt="user">
										</figure>
										<div class="media-body">
											<h4 class="media-heading social_msg__heading">Joseph Lewis <span>from</span> <span>facebook</span></h4>
											<p class="social_msg__msg">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
											<hr>
											<p class="social_msg__meta--alt">Attachment</p>
											<div class="media">
												<figure class="pull-left">
													<img class="media-object" src="images/thu.png" alt="user">
												</figure>
												<div class="media-body msg_attach">
													<p class="social_msg__msg attach_name">Image-sample.jpg</p>
													<p class="attach_kb">560 KB</p>
													<a href="#" class="attach_links">View</a><a href="#" class="attach_links">Download</a>
												</div>
											</div> <!-- /Attachment -->
											<small class="social_msg__meta">26 Dec, 2013</small>
										</div>
									</div> <!-- /social-msg -->
									<div class="social_msg__reply">
										<input type="text" placeholder="Click here to Reply...">
									</div>
								</div> <!-- /tabs__content 2 -->
								
								<div class="tabs__content--3">
									<div class="media social_msg">
										<figure class="pull-left rounded-image social_msg__img">
											<img class="media-object" src="images/thumb1.jpg" alt="user">
										</figure>
										<div class="media-body">
											<h4 class="media-heading social_msg__heading">Victoria Campel <span>from</span> <span>twitter</span></h4>
											<p class="social_msg__msg">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.</p>
											<small class="social_msg__meta">6 hours ago</small>
										</div>
									</div> <!-- /social-msg -->
									<div class="social_msg__reply">
										<input type="text" placeholder="Click here to Reply...">
									</div>
								</div> <!-- /tabs__content 3 -->
								
							</div> <!-- /tabs__content CONTAINER -->

						</div> <!-- /widget__tabs -->

					</article>
				</div>
			</div> <!-- /row -->
		</section>
	  </div> <!-- /row -->
				
	</body>
	</html>
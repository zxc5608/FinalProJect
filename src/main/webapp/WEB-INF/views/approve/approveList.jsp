<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재함</title>
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
#aclick:link {
		color: black;
	}
#aclick:hover {
		color: black;
		text-decoration: none;
	}
#aclick:visited {
		color: black;
		text-decoration: none;
	}
	
.pagination{
	margin-left : 42%;
	}
#insertbt{
	float: right;
}
</style>
</head>
<body>
<section class="content">
	<div class="row" style="width: 100%; margin-left: 15px;" >

		<div class="col-md-12">
			<article class="widget" style="width: 1200px;">
				<header class="widget__header">
					<h3 class="widget__title">결재목록</h3>
					<div class="widget__config">
						
					</div>
				</header>

					<div class="widget__content">
						<table class="table">
							<thead>
								<tr>
									<th>문서제목</th>
									<th>담당자</th>
									<th>작성일</th>
									<th>업무종료일</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="approvalList" items="${approvalList}">
								<tr class="noticeClick" data-sntncno="${approvalList.jobno }" >
									<td>${approvalList.docsj }</td>
									<td>${approvalList.wrter } </td>
									<td>${approvalList.wrtede }</td>
									<td>${approvalList.taskclsde }</td>
									<td>${approvalList.sanctnsttus }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</article>
			</div>
		</div>
</section>

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

</body>
</html>
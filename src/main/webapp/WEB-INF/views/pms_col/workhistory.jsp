<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Levo Admin Theme</title>

	<link rel="apple-touch-icon" href="touch-icon-iphone.png" /> 
	<link rel="apple-touch-icon" sizes="76x76" href="touch-icon-ipad.png" /> 
	<link rel="apple-touch-icon" sizes="120x120" href="touch-icon-iphone-retina.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad-retina.png" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/css/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" href="/jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.css"/>
	<link href="/css/helper.css" rel="stylesheet" />
	<link href="/css/style3.css" rel="stylesheet" />
	

</head>
<style>
.item.color1 {
    background-color: #4aaefb;
}
.item {
    display: inline-block;
    vertical-align: top;
    padding: 0 7px;
    margin-top: 4px;
    margin-right: 5px;
    height: 25px;
    line-height: 25px;
    font-size: 20px;
    color: #fff;
    font-weight: 700;
    border-radius: 4px;
}
th, td{
	text-align: center;
}

</style>

<script type="text/javascript">
$(function(){
	
	$('#exceldown').on('click',function(){
		
		var charr = new Array(); 
		var charr2 = new Array(); 
	 	var workradio =  $('input:radio[name=workradio]:checked').val();
	 	var workradio1 = $('input:radio[name=workradio1]:checked').val();
	 	var workradio2 = $('input:radio[name=workradio2]:checked').val();
		
	    $('input:checkbox[name=sttus1]:checked').each(function() { 
	    	charr.push(this.value);
	    });
	    $('input:checkbox[name=workcheck1]:checked').each(function() { 
	    	charr2.push(this.value);
	    });
	    location.href="/task/excelDownload?charr="+charr+
	    									"&charr2="+charr2+
	    									"&workradio="+workradio+
	    									"&workradio1="+workradio1+
	    									"&workradio2="+workradio2;
	    
	});
});
</script>

<script>

function openPop(){
	var jobno = $('#jobnno').val();
	var popup = window.open('/task/TaskWorkDetail?jobno='+jobno+'','taskdetail','width=700px,height=800px,scrollbars=yes')
}
	
$(document).ready(function(){

	$(".main-nav").on("click",function(){
		
		var charr = new Array(); 
		var charr2 = new Array(); 

		$('input:checkbox[name=sttus1]:checked').each(function() { 
	    	charr.push(this.value);
	    });
	    $('input:checkbox[name=workcheck1]:checked').each(function() { 
	    	charr2.push(this.value);
	    });
	    
		$.ajax({
			url:"/task/TaskAllViewAccess",
			type:"get",
			dataType:"json",
			data : {"workradio":$('input:radio[name=workradio]:checked').val(),
    			"charr":charr,
    			"charr2":charr2	, 
				"workradio1":$('input:radio[name=workradio1]:checked').val(),
    			"workradio2":$('input:radio[name=workradio2]:checked').val()
	    			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			success: function(data){
				
				var charr = new Array(); 
				var charr2 = new Array(); 
			 	var workradio =  $('input:radio[name=workradio]:checked').val();
			 	var workradio1 = $('input:radio[name=workradio1]:checked').val();
			 	var workradio2 = $('input:radio[name=workradio2]:checked').val();
				
			    $('input:checkbox[name=sttus1]:checked').each(function() { 
			    	charr.push(this.value);
			    });
			    $('input:checkbox[name=workcheck1]:checked').each(function() { 
			    	charr2.push(this.value);
			    });
				
			  $('#pageall').empty();
			  code = '';
			  code ='<table class="table" style="font-size: 18px;">';
			  code+='<thead>';
			  code+='<tr id="table">';
			 
			  code+='<th class ="state">상태</th>';
			  code+='<th class ="rank">우선순위</th>';
			  code+='<th class= "name">제목</th>';
			  code+='<th class ="jin">진척도</th>';
			  code+='<th class="dang">담당자</th>';
			  code+='<th class="writer">작성자</th>';
					
			  code+='<th class="startd">시작일</th>';
			  code+='<th class="endd">마감일</th>';
			
					
			  code+='</tr>';
			  code+='</thead>';
		      $.each(data.tasklist,function(i, v){
				code+='<tr>';
				
				code+='		<td class ="state">';
				code+='			<span id="taskStts" class="item color1" style="display: inline-block;">'+v.jobsttus+'</span>';
				code+='		</td>';
				code+='		<td class ="rank">'+v.jobpriort+'</td>';
				code+='		<td class= "name" id="jobname"> <a style="color:black" data-jobno="'+v.jobno+'" onclick="openPop()">'+v.jobnm+'<input type="hidden" value="'+v.jobno+'" name="jobno" id="jobnno"></a> </td>';
				code+='		<td class ="jin"> '+v.prgsdo+'% </td>';
				code+='		<td class="dang">'+v.manager+' 외  '+v.mcount+'명 </td>';
				
				code+='		<td class="writer">'+v.jobwrter+' </td>';
				code+='		<td class="startd">'+v.jobbgnde+' </td>';
				if(v.jobclosde == null){
					code += '<td class=endd style="text-align: center;"> - </td>';
				}else{
					code += '<td class="endd"> '+v.jobclosde+' </td>';
				}
				
				
				code+='	</tr>';
			    });
				code+='	</table>';
				
				$('#pageall').append(code);

				code =	'<ul class="pagination">';
				code += '	<li class="prev"><a href="/task/TaskAllViewAccess?page=1&pageSize='+data.pageVo.pageSize+'}">«</a></li>'; 
				code += '	<li class="prev"><a href="/task/TaskAllViewAccess?page='+ (data.pageVo.page - 1) +'&pageSize='+ data.pageVo.pageSize+'">＜</a></li>'; 
						
				for(i = 1; i <= data.pagination; i++){
					if(data.pageVo.page == i){
						code += '<li class=active><span>'+i+'</span></li>';
					}else{
						code += '<li><a href="/task/TaskAllViewAccess?page='+i+'&pageSize='+ data.pageVo.pageSize+'&workradio='+workradio+'&workradio1='+workradio1+'&workradio2='+workradio2+'&charr='+charr+'&charr2='+charr2+'">'+i+'</a></li>';
					}
				}
				
				code += '	<li class="next"><a href="/task/TaskAllViewAccess?page='+ (data.pageVo.page + 1) +'&pageSize='+ data.pageVo.pageSize+'">＞</a></li>';
				code += '	<li class="next"><a href="/task/TaskAllViewAccess?page='+data.pagination+'&pageSize='+ data.pageVo.pageSize+'">»</a></li>';
				code += '</ul>';
				
				$('#paging').html(code);
				
							
			}
		
		});
	});
	
	///////////////////////////////////
	$('.table').on('click','#jobname',function(){
		$('#taskDetail').show();
	})
	$('#closeDet').on('click', function(){
		$('#taskDetail').hide();
	})
  		
	$('.modal-body').on('click','input:checkbox[name="num"]',function(){
		if($(this).prop('checked')){
			$(".num").show();
		}else{
			$(".num").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$('input:checkbox[name="state"]').on('click',function(){
		if($(this).prop('checked')){
			$(".state").show();
		}else{
			$(".state").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$('input:checkbox[name="rank1"]').on('click',function(){
		if($(this).prop('checked')){
			$(".rank").show();
		}else{
			$(".rank").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$("#s4").on("click",function(){
		alert("제목은 필수 입력입니다.");
	})
    	      
	$('input:checkbox[name="jin1"]').on('click',function(){
		if($(this).prop('checked')){
			$(".jin").show();
		}else{
			$(".jin").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$('input:checkbox[name="dang"]').on('click',function(){
		if($(this).prop('checked')){
			$(".dang").show();
		}else{
			$(".dang").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$('input:checkbox[name="writer"]').on('click',function(){
		if($(this).prop('checked')){
			$(".writer").show();
		}else{
			$(".writer").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
    	      
	$('input:checkbox[name="startd"]').on('click',function(){
		if($(this).prop('checked')){
			$(".startd").show();
		}else{
			$(".startd").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
	
	$('input:checkbox[name="endd"]').on('click',function(){
		if($(this).prop('checked')){
			$(".endd").show();
		}else{
			$(".endd").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
	
	$('input:checkbox[name="insert"]').on('click',function(){
		if($(this).prop('checked')){
			$(".insert").show();
		}else{
			$(".insert").hide();
			//alert($('input:checkbox[id="s2"]').val());
		}
	});
	
});
</script>
<style>
a img {
    border: none;
    height: 70px;
    margin-left: 100px;
    margin-top: 9px;
}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/common/taskleft.jsp" %>

		
		<section class="content" >
			<header class="main-header clearfix">
				<h1 class="main-header__title" style="margin-top: 15px;">
					<i class="icon pe-7s-home" style=""></i>
					업무내역게시판
				</h1>
			</header>
	

			<div style="margin-top: 30px;">
				<h3 class="widget__title" style="font-size: 25px;">프로젝트 : ${prjctnm} </h3>
								
				<button type="button" id="exceldown" style="position: absolute; right:33%; top:123px;">엑셀 내려받기</button>
				<button type="button" class="btn btn-light" style="position: absolute; right:25% " onclick="window.open('/gantt/view', '간트차트', 'width=1000, height=400')"><i class="pe-7f-share"></i>&nbsp;간트차트로 보기</button>
				<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" style="position: absolute; right:20% "><i class="pe-7f-note"></i>&nbsp;보기설정</button>
<!-- 				<button type="button" class="btn btn-dark btn-lg" style="position: absolute; right:16.5% ">닫기</button> -->
			</div>
			<div class="row"></div> <!-- /row -->
			<!-- <hr style="border:2px solid black;"> -->
			
			<article class="widget" style="width: 100%;">
				<header class="widget__header">
					<div class="widget__config"></div>
				</header>

				<div class="widget__content">
					<!-- 상세보기 페이지 예시 지워서 다른거 써야됨  -->
					<div id="taskDetail" style="position: absolute; display:none;background: lightgray; height: auto; width:28%; left:55%;" >
					</div>

					</div>
					<!--여기까지  -->
					<div id="pageall">
					<table class="table" style="font-size: 18px;">
						<thead>
							<tr id="table">
								
								<th class ="state">상태</th>
								<th class ="rank">우선순위</th>
								<th class= "name">제목</th>
								<th class ="jin">진척도</th>
								
								<th class="dang">담당자</th>
								<th class="writer">작성자</th>
								<th class="startd">시작일</th>
								<th class="endd">마감일</th>
								
							</tr>
						</thead>
						<tbody class="tabtab1">
							<c:forEach items="${tasklist}" var="task">
								 <tr>
<%-- 									<td class="num"><c:set var="jobno" value="${task.jobno }"/>${fn:substring(jobno,6,9)} </td> --%>
									<td class ="state">
										<span id="taskStts" class="item color1" style="display: inline-block;">${task.jobsttus }</span>
									</td>
									<td class ="rank"> ${task.jobpriort} </td>
									<td class= "name" id="jobname"> <a style="color:black" data-jobno="${task.jobno }" onclick="openPop()">${task.jobnm}
									<input type="hidden" value="${task.jobno }" name="jobno" id="jobnno">
									</a> </td>
									<td class ="jin"> ${task.prgsdo}% </td>
									<td class="dang"> ${task.manager } 외 ${task.mcount} 명 </td>
									<td class="writer"> ${task.jobwrter } </td>
									<td class="startd">  ${task.jobbgnde} </td>
									<td class="endd">  ${task.jobclosde} </td>
															
								</tr> 
							</c:forEach>
						
						</tbody>
						
					</table>
					</div>
					<div style="text-align: center;" id="paging">
							
							<ul class="pagination" >
									 <li class="prev"><a href="/task/task?page=1&pageSize=${pageVo.getPageSize()}">«</a>
									</li> 
									 <li class="prev"><a href="/task/task?page=${pageVo.getPage() - 1 }&pageSize=${pageVo.getPageSize()}">＜</a>
									</li> 
	
									<c:forEach begin="1" end="${pagination }" var="i">
	
										<c:choose>
											<c:when test="${pageVo.getPage() == i}">
												<li class="active"><span>${i }</span></li>
											</c:when>
	
											<c:otherwise>
												<li><a href="/task/task?page=${i }&pageSize=${pageVo.getPageSize()}">${i }</a></li>
											</c:otherwise>
	
										</c:choose>
									</c:forEach>
	
									<li class="next"><a href="/task/task?page=${pageVo.getPage() + 1 }&pageSize=${pageVo.getPageSize()}">＞</a>
									</li> 
									<li class="next"><a href="/task/task?page=${pagination}&pageSize=${pageVo.getPageSize()}">»</a>
									</li> 
								</ul>
						</div>
					
					
				</div>
		
		
		<footer class="main-footer"></footer>


		<!-- Scripts -->
		<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="../js/jquery-ui.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<!-- <script type="text/javascript" src="../amcharts/amcharts.js"></script>
		<script type="text/javascript" src="../amcharts/serial.js"></script>
		<script type="text/javascript" src="../amcharts/pie.js"></script> -->
		<script type="text/javascript" src="../js/chart.js"></script>
		<script type="text/javascript" src="../js/map.js"></script>
		<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="../jquery-jvectormap-1.2.2/jquery-jvectormap-us-aea-en.js"></script>
		
		<!-- <script type="text/javascript" src="../js/main.js"></script>  -->
		
		
</body>
</html>
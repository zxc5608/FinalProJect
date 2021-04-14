<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(function(){
	
	$("#chatBt").on('click', function(){
		window.open("<%=request.getContextPath()%>/socket/view", "chat", "width=640, height=400")
	})

// 	$('#modal').on('click', function(){
// 		$.ajax({
// 			url : '/user/allViewBtn',
// 			type : 'post',
// 			dataType : 'json',
// 			success : function(res){
// 				<div id="myModal" class="modal fade" role="dialog">
// 					<div class="modal-dialog">
// 						<!-- Modal content-->
// 						<div class="modal-content">
// 							<div class="modal-header">
// 								<button type="button" class="close" data-dismiss="modal">&times;</button>
// 								<h4 class="modal-title"> 프로젝트 참여자 </h4>
// 							</div>
// 							<div class="modal-body">
// 								<br>
// 								<div id="rightmodal"></div>
// 							</div>
// 							<div class="modal-footer">
// 								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
// 							</div>
// 						</div>
// 					</div>
// 				</div>
// 			},
// 			error : function(xhr){
// 				alert("상태 : " + xhr.status);
// 			}
// 		})
// 	})
	
	$.ajax({
		url : '/user/rightmember',
		type : 'post',
		dataType : 'json',
		success : function(res){
			console.log(res)
			code = '';
			$.each(res.users, function(i,v){
				code += '<img id=imguser src="/user/profile?usid='+v.usid+'"';
				code += '<a href="#" style="cursor:pointer" class="amodal" >'+v.usernm+'</a><br><br><br>';
			})
	        
	        $('#rightmodal').append(code);
	        
	        code = '<div class="manage">';
	        code += '<strong>㉧관리자</strong><br><hr>';
			$.each(res.member, function(i,v){
				if( v.author == 1){
					code += '<a href="#" style="color:black; text-align:center;">'+v.usernm+'</a><br><br>';
				}
			})
			code += '</div><hr>';
			code += '<div class="manage">';
			code += '<strong>㉧담당자</strong><br><hr>';

			$.each(res.member, function(i,v){
				if( v.author == 2){
					code += '<a href="#" style="color:black;text-align:center;"><i style="color:red;">*</i>'+v.usernm+'</a>';
				}
			})
			code += '</div><hr>';
			code += '<div class="manage">';
			code += '<strong>㉧참여자</strong><br><hr>';
			
			$.each(res.member, function(i,v){
				if(v.author == 3){
					code += '<a href="#" style="color:black;text-align:center;">'+v.usernm+'</a><br><br>';
				}
			})
			code += '</div>';
	        $('#rightmember').html(code);
	        
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	});
	
})
</script>

<style>
.widget__header{
text-align: center;
}
.ucc{
	margin-left: 15px;s
}
</style>
</head>
<body>
		
      <aside class="sidebar_r">
			<ul class="main-nav">
			
			<li class="ulstyle">
					<a class="ucc" href="/drive/fileList">
						파일함 <span class="badge main-nav__badge"></span>
					</a>
					<a class="ucc" href="/task/task">
						업무 <span class="badge main-nav__badge"></span>
					</a>
					<a class="ucc" href="/calendar/view">
						일정 <span class="badge main-nav__badge"></span>
					</a>
					
				</li>
			</ul>
			
			<button class="btn btn-grey btn-block" style="height:60px; background: cadetblue;" data-toggle="modal" data-target="#inviteMail" id="invite"><img src="/icon/plus.png" >&nbsp;&nbsp;초대하기</button>
			
						
				<article class="widget1" style="height: auto;">
					<header class="widget__header">
						<h3 class="widget__title" style="margin-top: 10px; font-size: 17px;">전체 참여자 ${memberCnt}명</h3>
						
						
						<!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title"> 프로젝트 참여자 </h4>
									</div>
									<div class="modal-body">
										<br>
										<div id="rightmodal"></div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
							
						<hr>
						<div id="rightmember">
<!-- 							<div class="manage" style="float: left;"> -->
<!-- 								<p>관리자</p><br> -->
<%-- 								<c:forEach var="member" items="${member}"> --%>
<%-- 								 <c:if test="${member.author eq 1}"> --%>
<%-- 								<a href="#">${member.usernm}</a> --%>
<!-- 								<a href="#" class="messagei"><img src="../img/images.png" class="messagei"></a> -->
<%-- 								</c:if> --%>
<%-- 									</c:forEach> --%>
<!-- 							</div><hr> -->
						</div>
						<hr>
						<button type="button" class="btn btn-green btn-lg" id="chatBt"><img src="/icon/chat.png">&nbsp;채팅하기</button>
					</header>

					
				</article>
			
		</aside>
		
<div id="inviteMail" class="modal fade" role="dialog">
	<div class="modal-dialog">
	<!-- Modal content-->
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">x</button>
			<h4 class="modal-title">프로젝트 초대하기</h4>
			<br>
			<form action="/mailSending.do" method="post">
				<div>
					<input type="text" name="tomail" size="120" value="immense3@gmail.com" style="width: 100%" placeholder="상대의 이메일" class="form-control">
				</div>
				
				<div align="center">
					<!-- 제목 -->
					<input type="text" name="title" size="120" value="초대" style="width: 100%" placeholder="제목을 입력해주세요" class="form-control">
				</div>
				<p>
				
				<div align="center">
					<!-- 내용 -->
					<textarea name="urlb" value="${param.urlb }" cols="120" rows="12" style="width: 100%; resize: none" class="form-control"></textarea>
				</div>
				<p>
				
				<div class="modal-footer">
					<input type="submit" value="메일 보내기" class="btn btn-warning">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			</form>
		</div>
	</div>
</div>
		
</body>
</html>
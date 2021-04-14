<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script> -->

<script>
var socket;
function initSocket(url) {
	socket = new SockJS(url);
	
	socket.onmessage = function(evt) {
		var userId = "${user.usernm}";
		
		var $mydata =$("<div id='mychat'>" + evt.data + "<br/></div>")
		var $youdata =$("<div id='youchat'>" + evt.data + "<br/></div>")
		
		if("${user.usernm}" == userId){
		$("#data").append($mydata);
	//	$("#data").append(evt.data + "<br/>");
			
		}else{
		$("#data").append($youdata);	
		}
		$("#data").scrollTop($('#data')[0].scrollHeight+20);
	};
	
	$("#sendBtn").on("click", function() {
		var msg = $("#message").val();
		socket.send(msg);
		var userId = "${user.usid}";
		$.ajax({
			url : '/socket/insertMessage',
			type : 'post',
			data : {"chttcn" : msg, "usid" : userId},
			dataType : 'json'
		})
	});
	
	socket.onclose = function(evt) {
		$("#data").append("연결 종료");
	}
}
$(document).ready(function() {
	var userId = "${user.usernm}";	//사용자 아이디를 파라미터로 받는다
	
	$("#userId").text(userId);
	
	initSocket("/ws/chat?userId=" + userId);
});

	
</script>
<style>
	#mychat{
	 text-align: left;
	}
	#youchat{
	 text-align: right;
	}
	#data{
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 190px;
		max-height: 600px;
		overflow: scroll;
		overflow-x:hidden;
		background: white;	
		
	}
</style>

</head>
<body style="display: inline-block; margin-left: 60px; background: cadetblue;">
	
	<h1 id="userId"></h1>



		<div id="data" >
	
	    </div>
		
	    
	
		
	
	

	


	
	<input type="text" id="message" name="message" style= "background:white;margin-top: 30px; margin-left: 10px; height: 30px; width: 350px;"/> <br>
	<button id="sendBtn" style="margin-top:20px; background: lightyellow;
                width:60px; height:26px; border: 1px solid black;">전송</button><br>
	
</body>
</html>
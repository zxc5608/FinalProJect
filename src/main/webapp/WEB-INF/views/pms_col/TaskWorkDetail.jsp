<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>업무상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$('#taskApproval').on('click', function(){
		var jobno = $('.apprjaobno').val();
		location.href="/approval/insertnote?jobno="+jobno;
	})
})
</script>
</head>
<body>
	<div class="col-md-12">
		<article class="widget">

			<div class="post_write_tab">
				<input type="button" id="taskApproval" value="업무완료 결재하기" style="float: right;" value="${jobno }"
				class="apprjaobno"
				>
				<br><br>
				
				<hr>

				<div id="inserttask" style="display: show;">
				
					<form action="/project/등록">
						<input type="hidden" id="progress" value=""> <input
							type="hidden" id="worktype" value="">

						<div class="titleBx">
							<!-- <input type="text"
								style="display: block; border: 0; width: 95%; font-size: 18px; line-height: 18px; font-family: inherit; background: none; font-weight: bolder;"
								placeholder="업무명을 입력하세요"> -->
								<label>${taskVo.jobnm }</label>
								
						</div>
						
						<hr>

						<div class="photo"
							style="cursor: pointer; margin-top: 15px; float: left; position: relative; width: 40px; height: 40px; overflow: hidden; border-radius: 40px;">
							<img id="user-prfl"
								style="width: 30px; object-fit: cover; background-image: url(&amp;quot;https://flow.team/flowImg/FLOW_202102271570543_bff097c5-5feb-411a-b610-e93c6cf1a42d.jpg&amp;quot;); background-size: cover; background-repeat: no-repeat;"
								onerror="" alt=""
								src="https://flow.team/flowImg/FLOW_202102271570543_bff097c5-5feb-411a-b610-e93c6cf1a42d.jpg">

						</div>

						<div class="user" style="margin-left: 30px;">
							<strong id="user-name" class="name"
								style="cursor: pointer; margin-right: 6px; vertical-align: middle;"><span
								class="user_val">${taskVo.jobwrter }</span></strong><strong id="vertical-line"
								style="border-left: 2px solid #e9eaed; vertical-align: middle; font-size: 12px; display: none;">&nbsp;</strong><span
								id="company-name"
								style="color: #969696; padding-left: 3px; vertical-align: middle;"></span>
							<span class="date"> <span id="post-rgsn-dttm">${taskVo.jobrgsde }</span>
							</span>

						</div>

						<div class="workTab">
							<label>${taskVo.jobsttus } </label>
							<!-- <div onclick="worktype(this.id)" id="요청" class="tab1">
								<label>요청</label>
							</div>
							<div onclick="worktype(this.id)" id="진행" class="tab2" style="margin-left: -5px;">
								<label>진행</label>
							</div>
							<div onclick="worktype(this.id)" id="완료" class="tab3" style="margin-left: -5px;">
								<label>완료</label>
							</div>
							<div onclick="worktype(this.id)" id="보류" class="tab4 on" style="margin-left: -5px;">
								<label>보류</label>
							</div> -->
						</div>

						<br>
						<hr>

						<div class="container-fluid" style="min-height: 100px;">
							<div class="collapse" id="collapseExample">
								<div class="well">
									<div class="workTab">

										<label><img src="../img/audience.png"
											style="height: 20px; width: 20px; margin-right: 5px; margin-top: 5px;">
											${taskVo.manager }
										</label> 
										  <!-- <input type="text" id="person" placeholder="담당자 추가"> -->
										<div id="userlist"
											style="position: absolute; display: none; z-index: 1; left: 164.625px; background: white;">
											<div id="member" style="width: 100%;">test</div>
										</div>
									</div>
									<br>
									<hr>
									<div class="workTab">
										<label><img src="../img/calendar.png"
											style="height: 20px; width: 20px; margin-right: 5px; margin-top: 5px;">
											${taskVo.jobbgnde }
										</label> <!-- <input type="text" class="datepicker" id="stdate"
											placeholder="시작일시 추가"> -->
									</div>
									<br>
									<hr>
									<div class="workTab">
										<label><img src="../img/calendar2.png"
											style="height: 20px; width: 20px; margin-right: 5px; margin-top: 5px;">
											${taskVo.jobclosde }
										</label> <!-- <input type="text" class="datepicker" id="eddate"
											placeholder="마감일시 추가"> -->


									</div>
									<br>
									<hr>


									<div class="workTab">
										<label><img src="../img/choice.png"
											style="height: 20px; width: 20px; margin-right: 5px; margin-top: 5px;">
											${taskVo.jobpriort }
										</label> <!-- <input type="text" id="importance" placeholder="우선순위 선택"> -->

										<div id="imp"
											style="position: absolute; display: none; z-index: 1; left: 164.625px; background: white;">
										
										</div>


									</div>

									<br>
									<hr>
									<div class="worktab">
										<label><img src="../img/percentage.png"
											style="height: 20px; width: 20px; margin-right: 5px; margin-top: 5px;">
										</label>
										<div onclick="progress(this.id)" id="0" class="bar1"
											style="width: 20px; margin-top: 5px;"></div>
										<div onclick="progress(this.id)" id="20" class="bar2"
											style="margin-left: -8px; margin-top: 5px;"></div>
										<div onclick="progress(this.id)" id="40" class="bar3"
											style="margin-left: -8px; margin-top: 5px;"></div>
										<div onclick="progress(this.id)" id="60" class="bar4"
											style="margin-left: -8px; margin-top: 5px;"></div>
										<div onclick="progress(this.id)" id="80" class="bar5"
											style="margin-left: -8px; margin-top: 5px;"></div>
										<div onclick="progress(this.id)" id="100" class="bar6"
											style="margin-left: -8px; margin-top: 5px;"></div>
										<span id="percent">${taskVo.prgsdo }%</span>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div class="subtask-header">
							<span class="subtask-title"> "상위업무" <em></em></span>
						</div>
					</form>
				</div>
			</div>
		</article>
		<!-- /widget -->
	</div>
</body>

</html>
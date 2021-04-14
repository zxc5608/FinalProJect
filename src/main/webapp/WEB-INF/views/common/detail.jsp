<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
  
  <!-- 업무명 -->
			<div class="titleBx">
				<input name="TASK_NM" style="display: none;" type="text" maxlength="50" placeholder="업무명을 입력하세요"
					   autocomplete="off" data-langcode="CD802">
				<span class="titleReadOnly" id="TASK_NM_READ_ONLY" style="padding-left: 0px; display: inline-block;">
					<!-- [D] 20190121 display: inline -> display: inline-block 으로 사용 부탁드립니다. --></span>
				<span class="num" id="TASK_SRNO" style="display: none;">
					<!-- [D] 20190121 display: inline -> display: inline-block 으로 사용 부탁드립니다. --></span>
			</div>
  
  
  
  <!-- 업무내용 -->
			<div class="workwriteCont line-fold">
				<!-- line1 -->
				<div class="line" id="STATUS_LINE">
					<label class="icon1">
						<span class="blind" data-langcode="CD804">상태</span>
					</label>
					<div class="workTab">
						<button class="tab1 on" stts-value="0" data-langcode="CD721">요청</button>
						<button class="tab2" style="margin-left: -5px;" stts-value="1" data-langcode="CD722">진행</button>
						<button class="tab5" style="margin-left: -5px;" stts-value="4" data-langcode="CD723">피드백</button>
						<button class="tab3" style="margin-left: -5px;" stts-value="2" data-langcode="CD724">완료</button>
						<button class="tab4" style="margin-left: -5px;" stts-value="3" data-langcode="CD725">보류</button>
					</div>
				</div>
  </div>
  
  <!-- line2 -->
				<div class="line" id="WORKER_LINE">
					<label class="icon2">
						<span class="blind" data-langcode="FL566">담당자</span>
					</label>
					<div id="workerTagLayer" class="nameBx">
						<span id="workerTagSelected"></span>
						<!-- tag li obj -->
						<div style="display:none;">
							<div id="worker-tag-li-obj" class="nameTag">
								<img src="" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'">
								<strong></strong>
								<button id="worker-tag-remove-btn" style="cursor:pointer;">
									<span class="blind" data-langcode="H381">삭제</span>
								</button>
							</div>
						</div>
  
  					</div>
  					</div>
  					
  					<!-- tag li obj -->
						<button id="edit-worker" class="namePlus" style="height:28px;display:none;" data-langcode="CD807">담당자
							변경</button>
						<div id="add-worker" class="txt_add_nm">
							<span class="txt_add_nm_in">
								<input name="WORKER" type="text" placeholder="담당자 추가" data-langcode="CD808">
							</span>
							<!-- user layer -->
							<div id="worker-select-layer" class="mentions-input worker_select_layer"
								 style="top:28px;left:-1px;max-height: 300px;min-width:200px;z-index:1000;border:1px solid #e5e6e9;padding-top:0px;display:none; overflow: hidden;">
								<ul id="worker-select-list" tabindex="0" class="user_list sizeSamll" style="display: none;"></ul>
							</div>
							<!-- worker select li obj -->
							<ul style="display:none;">
								<li id="worker-select-li-obj" class="">
									<a class="ui-corner-all" id="ui-id-45">
										<div class="photo_wrap">
											<div class="photo_po">
												<img id="user-prfl" width="40" height="40" src=""
													 onerror="this.src='/design3/img_rn/img_photo_null32.png'">
											</div>
										</div>
										<p>
											<strong id="user-name" style="vertical-align:center;line-height:30px;"></strong>
										</p>
									</a>
								</li>
							</ul>
							<!-- worker select li obj -->
							<!-- //user layer -->
						</div>
		
			<!-- line3 -->
				<div class="line" id="START_DT_LINE">
					<label class="icon3">
						<span class="blind" data-langcode="CC667">시작일</span>
					</label>
					<div class="workdate" style="display: block;">
						<input class="START_DT" START_DT="" type="text" placeholder="시작일시 추가" autocomplete="off"
							   data-langcode="CD1832" readonly>
						<span class="virtual-date" style="display:none"></span>
						<button id="START_DT_DEL" style="display:none;" class="workdateDel">
							<span class="blind" data-langcode="H381">삭제</span>
						</button>
						<span id="START_DT_CNTN" class="c_red" style="display:none;" data-langcode="CD810">시작일이 마감일보다 이후 날짜로 되어
							있습니다.</span>
					</div>
				</div>
				<!-- line4 -->
				<div class="line" id="END_DT_LINE">
					<label class="icon4">
						<span class="blind" data-langcode="CD811">마감일</span>
					</label>
						<div class="workdate" style="display: block;">
					<input class="END_DT" END_DT="" type="text" placeholder="마감일시 추가" autocomplete="off"
						   data-langcode="CD812" readonly>
					<span class="virtual-date" style="display:none"></span>
					<button id="END_DT_DEL" style="display:none;" class="workdateDel">
						<span class="blind" data-langcode="H381">삭제</span>
					</button>
					<span id="END_DT_CNTN" class="c_red" style="display:none;" data-langcode="CD813">마감일이 시작일 이전 날짜로 되어
							있습니다.</span>
					<span id="END_DT_OVERDUE" class="c_red" style="display:none;" data-langcode="CD814">마감기한이 지났습니다.</span>
				</div>
				</div>
				<!-- line5 -->
				<!-- start -->
				<div id="end-time-pick-item" class="time-pick-info end-time-pick" style="display: none;">
					<i class="ico-clock"></i>
					<a role="button" class="time-add">시작시간 추가</a>
					<div class="time-pick">
						<span class="time">00:00</span>
						<span class="time-from-to" data-langcode="DCS409">부터</span>
						<a role="button" class="time-set-cancle"></a>
						<ul class="time-pick-list"></ul>
					</div>
					<a role="button" class="time-pick-apply">적용</a>
				</div>
				
				
				<button class="workmore" data-langcode="CD823">항목 추가 입력</button>
				<div id="task-cntn" class="editable pst_txt" contenteditable="true" spellcheck="false"
					 style="margin-top: 30px;min-height: 80px;white-space: pre-wrap;color:#000;"></div>
				<div id="task-cntn-attached"></div>
				<div class="subtask-space"></div>
			
		<div class='red_ttip_ly' id='postTtipTask' style='display:none;'>
			<div class='po'><span class='tail'></span>
				<p class='txt_r' data-langcode="CD802">업무명을 입력하세요.</p>
			</div>
		</div>

		
				
				
				
  
  	<div id="mid-layer" class="post_cont">
								<div id="modeTimeLayer" style="display:none;">
									post_srno : <span id="mid-post-srno"></span>
									<br><br>
								</div>
								<div id="post-cont-view">
									<!-- 여기에 해당 포스트별로 각자 다른 내용이 들어감 -->
								</div>


								<div id="remark-and-read-check" class="readnum">
									<div id="emtView" style="width:200px;cursor:pointer;"></div>
									<span class="right"><span data-langcode="CLP1042">댓글</span>
										<strong id="remark-count" style="padding-left:3px;" class="pst_remark_cnt">0</strong>
										<span data-langcode="CCM1293">개</span>&nbsp;&nbsp;<span id="read-count-check"
											style="cursor:pointer;">
											<span data-langcode="CD763">읽음</span>
											<strong style="padding-left:3px;" id="post-read-count">0</strong>
											<span data-langcode="CD782">명</span></span></span>
								</div>
							</div>
							<!-- //cont -->
							<!-- edit buttons -->
							<div id="bottom-layer" class="btm_edt_btns">
								<div id="emotion-popup-layer" class="emoti_pop_wrap" style="display:none;">
									<div class="emoti_pop">
										<span class="tail"></span>
										<ul>
											<li class="add-reaction" data="1">
												<img src="/design2/img_rn/emo/emoti_01.gif?1">
												<br><span data-langcode="CD764">좋아요</span></li>
											<li class="add-reaction" data="2">
												<img src="/design2/img_rn/emo/emoti_02.gif?1">
												<br><span data-langcode="CD765">부탁해요</span></li>
											<li class="add-reaction" data="3">
												<img src="/design2/img_rn/emo/emoti_03.gif?1">
												<br><span data-langcode="CD766">힘들어요</span></li>
											<li class="add-reaction" data="4">
												<img src="/design2/img_rn/emo/emoti_04.gif?1">
												<br><span data-langcode="CD767">훌륭해요</span></li>
											<li class="add-reaction" data="5">
												<img src="/design2/img_rn/emo/emoti_05.gif?1">
												<br><span data-langcode="CD768">감사해요</span></li>
										</ul>
									</div>
								</div>
								<ul id="bottom-btns">
									<li>
										<img id="emoti-img" src="/design2/img_rn/emo/emoti_s_01.png?1" style="display:none;">
										<a id="likeIcon" class="ico4" data-langcode="CD764">좋아요</a>
									</li>
									<li>
										<a id="focusRemarkInputBtn" class="ico1" data-langcode="H145">댓글작성</a>
									</li>
									<li>
										<a id="bringIcon" class="ico3" data-langcode="action.bookmark">담아두기</a>
									</li>
								</ul>
							</div>
</body>
</html>
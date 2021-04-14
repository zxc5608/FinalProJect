<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=0.5, user-scalable=yes">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<title>기안서 왜 이래</title>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 400px;
	height: 100px;
}

td {
	width: 70px;
	text-align: center;
}

th {
	width: 30px;
	background: lightgray
}
</style>
<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정         
		});

		$("#saveBtn").on("click", function() {
			/* var data = $(".note-editable").children().text(); */
			var tag = $(".note-editable").children().html(); // 첫번째 테이블
			var tag2 = $("#table2").html();	// 두번째 테이블
			var jobno = $("#jobno").val();
			var wrter = $("#wrter").val();
			var docsj = $("#docsj").val();
			var taskclsde = $('#taskclsde').val();
			
			$('#tag0').val(tag);
			$('#tag20').val(tag2);
			$('#jobno0').val(jobno);
			$('#wrter0').val(wrter);
			$('#docsj0').val(docsj);
			$('#taskclsde0').val(taskclsde);
			
			console.log($("#tag0").val());
			console.log($("#tag20").val());
			console.log($("#jobno0").val());
			console.log($("#wrter0").val());
			console.log($("#docsj0").val());
			console.log($("#taskclsde0").val());
			
			$('#frmall').submit();
		});
	});
</script>
</head>
<body>
<table style="border: 0px solid rgb(0, 0, 0); width: 100%; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
	<colgroup>
		<col width="310">
		<col width="490">
	</colgroup>
	<tbody>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 0px !important; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold;" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				업&nbsp;&nbsp;무&nbsp;&nbsp;완&nbsp;&nbsp;료&nbsp;&nbsp;보&nbsp;&nbsp;고&nbsp;&nbsp;서
			</td>
		</tr>
		
		<table style="float: right; margin-right: 20px;">
			<tr>
				<th rowspan="2" style="text-align: center;">결재</th>
				<td style="background: lightgray;">작성자</td>
				<td style="background: lightgray;">관리자</td>
			</tr>
			<tr>
				<td style="height: 70px;">${usernm }</td> <!-- 담당자 -->
				<td style="height: 70px;"></td>
			</tr>
		</table>
	
		<tr>
			<td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
				<table style="border: 1px solid rgb(0, 0, 0); font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 1px; border-collapse: collapse; width: 318px; margin-left: 400px; margin-top: 200px;">
					<!-- User -->
					<colgroup>
						<col width="90">
						<col width="120">
					</colgroup>
					<tbody>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								업무번호
							</td>
							
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
									<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										${taskVo.jobno }
									<input type="hidden" value="${taskVo.jobno }" name="jobno" id="jobno">
									</span>
									<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span> 
								</span><br>
							</td>
						</tr>
						<tr style="height: 32px;">
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								업&nbsp;무&nbsp;명
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
									<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										${taskVo.jobnm }
									</span>
										<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span><br>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								업&nbsp;무&nbsp;시&nbsp;작&nbsp;일
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
									<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										${taskVo.jobbgnde }
									</span>
									<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span><br>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								담 당 자
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
									<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										${usernm }
										<!-- 담당자 정보 -->
										<input type="hidden" name="wrter" value="${usernm }" id="wrter">
									</span>
										<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span><br>
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
								종료일자
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
	
									<input class="ipt_editor ipt_editor_date" type="date" name="taskclsde" id="taskclsde">
									<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
										<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
									</span>
									<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
										<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
									</span>
								</span><br>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>

<table style="border: 2px solid; width: 800px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px; margin-left: 400px; margin-top: 10px;">
	<colgroup>
		<col width="140">
		<col width="660">
	</colgroup>

					
	<tbody>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				첨부파일
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<form id="frmall" class="form-horizontal" action="/approval/insertnotes" method="post" enctype="multipart/form-data">
					<input type="file" name="atchmnfl" id="atchmnfl">
					<input type="hidden" name="tag" id="tag0" value="">
					<input type="hidden" name="tag2" id="tag20" value="">
					<input type="hidden" name="jobno" id="jobno0" value="">
					<input type="hidden" name="wrter" id="wrter0" value="">
					<input type="hidden" name="docsj" id="docsj0" value="">
					<input type="hidden" name="taskclsde" id="taskclsde0" value="">
				</form>
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{label:docReference}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"data-value="" data-autotype="">
				<span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
				<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
				</span>
				<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
				</span>
				</span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				문서제목
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"data-value="" data-autotype="">
						
							<input class="ipt_editor" type="text" name="docsj" id="docsj">
							
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					</span>
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a>
					</span>
				</span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="2">
				상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용
			</td>
		</tr>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2">
						
				<textarea id="summernote" name="editordata">
					<table class="table table-bordered" >
						<tbody>
							<tr>
								<td>작업 내역<br></td>
								<td id="td1" name="td1"><br></td>
							</tr>
							<tr>
								<td>작업 소요시간<br></td>
								<td id="td2" name="td2"><br></td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered" id="table2">
						<tbody>
							<tr>
								<td>작업명</td>
								<td>작업시간</td>
								<td>세부 작업 내역</td>
								<td>작업시 애로사항</td>
							</tr>
							<tr>
								<td><br></td>
								<td><br></td>
								<td><br></td>
								<td><br></td>
							</tr>
							<tr>
								<td><br></td>
								<td><br></td>
								<td><br></td>
								<td><br></td>
							</tr>
							<tr>
								<td><br></td>
								<td><br></td>
								<td><br></td>
								<td><br></td>
							</tr>
							<tr>
								<td><br></td>
								<td><br></td>
								<td><br></td>
								<td><br></td>
							</tr>
						</tbody>
					</table>
				</textarea>
				<button type="button" id="saveBtn">저장하기</button>
			</td>
		</tr>
	</tbody>
</table>
<p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="../js/jquery.min.js"></script>

<script>
  $(function(){
 setPop();
});


// 팝업 세팅
function setPop() {
 var popOpenBtn = $('.popOpenBtnCmmn');
 
 //팝업 열기
 popOpenBtn.on('click',function(){
   var clickNum = $(this).attr('data-num');
   
   $('#popUp_'+clickNum).fadeIn(200);
 })
 
 //팝업 닫기
 $('.popBg, .popCloseBtnCmmn').on('click',function(){
   var clickNum = $(this).attr('data-num');
   
   $('#popUp_'+clickNum).fadeOut(200);
 })
}


  </script>
 


<style>
/* reset */
button {
  padding:0;
  background:none;
  border:0;
  cursor:pointer;
}

/* 버튼 영역 */
.btnBox {
  text-align:center;
}

.popOpenBtnCmmn {
  width:200px;
  height:60px;
  background:#000;
  color:#fff;
  font-size:16px;
  opacity:0.7;
  transition:all 0.3s;
}

.popOpenBtnCmmn:hover {
  opacity:1;
}

/* 팝업 영역 */
.popCmmn {
  display:none;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
}

.popBg {
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0,0,0,0.7);
}

.popInnerBox {
  display:flex;
  justify-content:space-between;
  flex-direction:column;
  position:absolute;
  top:50%;
  left:50%;
  width:400px;
  height:250px;
  margin:-125px 0 0 -200px;
  text-align:center;
  background:#fff;
  border-radius:5px;
}

.popHead {
  padding:15px;
  background:#000;
  color:#fff;
  font-size:18px;
}

.popBody {
  padding:10px;
  box-sizing:border-box;
  font-size:14px;
}

.popCloseBtnCmmn {
  width:30%;
  margin:10px;
  padding:10px;
  font-size:16px;
  background:#999;
  color:#fff;
  transition:all 0.3s;
}

.popCloseBtnCmmn:hover {
  background:#666;
}



</style>

</head>
<body>
<div class="contentsWrap">
  <div class="btnBox">
    <button class="popOpenBtnCmmn" type="button" data-num="1">팝업1</button>
    <button class="popOpenBtnCmmn" type="button" data-num="2">팝업2</button>
    <button class="popOpenBtnCmmn" type="button" data-num="3">팝업3</button>
  </div>
</div>

  <div id="popUp_1" class="popCmmn">
    <div class="popBg" data-num="1"></div>
    <div class="popInnerBox">
      <div class="popHead">팝업1의 제목입니다.</div>
      <div class="popBody">팝업1의 내용입니다.</div>
      <div class="popFoot">
        <button class="popCloseBtnCmmn" type="button" data-num="1">확인</button>
      </div>
    </div>
  </div>
 

  <div id="popUp_2" class="popCmmn">
    <div class="popBg" data-num="2"></div>
    <div class="popInnerBox">
      <div class="popHead">팝업2의 제목입니다.</div>
      <div class="popBody">팝업2의 내용입니다.</div>
      <div class="popFoot">
        <button class="popCloseBtnCmmn" type="button" data-num="2">확인</button>
      </div>
    </div>
  </div>
 

  <div id="popUp_3" class="popCmmn">
    <div class="popBg" data-num="3"></div>
    <div class="popInnerBox">
      <div class="popHead">팝업3의 제목입니다.</div>
      <div class="popBody">팝업3의 내용입니다.</div>
      <div class="popFoot">
        <button class="popCloseBtnCmmn" type="button" data-num="3">확인</button>
      </div>
    </div>
  </div>
 
 
 
</body>
</html>

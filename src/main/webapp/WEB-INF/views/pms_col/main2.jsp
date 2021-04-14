<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="../js/jquery.min.js"></script>
<!-- script -->

<script>
console.clear();
$('.visual').slick({
    autoplay: true,
    autoplaySpeed: 10000,
    dots:true,
});


/* 슬릭 - setting에서 추가기능을 찾아서 넣을 수 있습니다. */
$('.play').click(function(){
    $('.visual').slick('slickPlay');
});

$('.stop').click(function(){
    $('.visual').slick('slickPause');
});
</script>


<!-- style -->
<style>
.visual .item-1 .text-box .text3 {
    opacity:0;
    transform:translateY(-50px);
    transition:all .5s .5s;
}

/* full 버전 */
.visual > .slick-list > .slick-track > .slick-active > div > .item-1 > .text-box > .text3 {
    opacity:1;
    transform:translateY(0);
}




/* 애니메이션 v2 키프레임으로 애니메이션 적용 */
/* 트렌지션으로 주면 약간의 딜레이가 생겨서 */

.visual .item-2 .text-box .text1 {
    opacity:0;
}

.visual .slick-active .item-2 .text-box .text1 {
    animation:ani 1 .5s .5s both;
}

.visual .item-2 .text-box .text2 {
    opacity:0;
    font-size:15px;
}

.visual .slick-active .item-2 .text-box .text2 {
    animation-name:ani;
    animation-delay: .7s;
    animation-duration: .5s;
    /* 몇번 실행할 것인지 */
    animation-iteration-count:1;
    /* 실행하고 마지막 100%를 유지하기 */
    animation-fill-mode: both;
}

.visual .item-2 .text-box .text3 {
    opacity:0;
    font-size:12px;
    /*word-break:keep-all;*/
    
}
/* full 버전 */
.visual > .slick-list > .slick-track > .slick-active > div > .item-2 > .text-box > .text3 {
    animation-name:ani;
    animation-delay: .9s;
    animation-duration: .5s;
    /* 몇번 실행할 것인지 */
    animation-iteration-count:1;
    /* 실행하고 마지막 100%를 유지하기 */
    animation-fill-mode: both;
}

@keyframes ani {
    0% {
        opacity:0;
    }
    100% {
        opacity:1;
    }
}


</style>



</head>
<body>
 
 <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption One</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
 
 

</body>
</html>
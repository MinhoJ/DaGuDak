<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>
   
<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING RESULT</span>
            <h2 class="mb-4">경기 결과</h2>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">

   <div class="container">
      <div class="row d-flex">
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="/DaGuDak/horsesInfo" class="block-20"
                  style="background-image: url('resources/images/horse1.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        Sept. 06, 2020</a>
                        <a href="#" class="meta-chat">/ 1번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"> <span style="color: gold;" ><b>1등</b></span><br><b>서에번쩍 </b>
                     <br><span class="fa fa-comment mr-2"></span>베팅누적금액: 100만원
                     </a>
                  </h3>
                  <p align="center">
                     <a href="/DaGuDak/horsesInfo" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>

         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="/DaGuDak/horsesInfo" class="block-20"
                  style="background-image: url('resources/images/horse2.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        Sept. 06, 2020</a>
                        <a href="#" class="meta-chat">/ 1번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"><span style="color: silver;" ><b>2등</b></span><br>황금마차
                     <br><span class="fa fa-comment mr-2"></span>베팅누적금액: 30만원
                     </a>
                  </h3>
                  <p align="center">
                     <a href="/DaGuDak/horsesInfo" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>
         <div class="col-lg-4 ftco-animate">
            <div class="blog-entry">
               <a href="/DaGuDak/horsesInfo" class="block-20"
                  style="background-image: url('resources/images/horse3.jpg');">
               </a>
               <div class="text d-block">
                  <div class="meta">
                     <p>
                        <a href="#">
                        <span class="fa fa-calendar mr-2"></span>
                        Sept. 06, 2020</a>
                        <a href="#" class="meta-chat">/ 1번째 경기</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"><span style="color: brown;" ><b>3등</b></span><br>심장의고동<br>
                     <span class="fa fa-comment mr-2"></span>베팅누적금액: 10만원
                     </a>
                  </h3>
                  <p align="center">
                     <a href="/DaGuDak/horsesInfo" class="btn btn-secondary py-2 px-3">상세 정보</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>


<div>오늘의 경기</div>
<div>ㅡ오늘의 경기 리스트, 지난 경기 리스트도 볼 수 있음</div>
<div>ㅡㅡ출주마 정보(horseInfo.jsp)</div>
<div>ㅡㅡ베팅(betting.jsp)</div>
<div>ㅡ곧 시작할 경기 or 진행중인 경기에 강조 표시, 클릭 시 경기 페이지</div>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
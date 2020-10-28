<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file = "/WEB-INF/views/common/head.jsp" %>

   
<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">BETTING</span>
            <h2 class="mb-4">베팅</h2>
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
                        <a href="#"><span class="fa fa-calendar mr-2"></span>Sept.
                           06, 2020</a> <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
                        <a href="#" class="meta-chat"><span
                           class="fa fa-comment mr-2"></span> 3</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#"> <b>1번 말</b> <br><b>서에번쩍 </b> <br> 2암(180210)흑색 영국
                     </a>
                  </h3>
                  <p align="center">
                     <a href="#" class="btn btn-secondary py-2 px-3" data-toggle="modal" data-target="#bettingModalCenter">베팅하기</a>
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
                        <a href="#"><span class="fa fa-calendar mr-2"></span>Sept.
                           06, 2020</a> <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
                        <a href="#" class="meta-chat"><span
                           class="fa fa-comment mr-2"></span> 3</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#">2번 말 <br> 황금마차 <br> 3수(170311)골드 미국
                     </a>
                  </h3>
                  <p align="center">
                     <a href="#" class="btn btn-secondary py-2 px-3" data-toggle="modal" data-target="#bettingModalCenter">베팅하기</a>
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
                        <a href="#"><span class="fa fa-calendar mr-2"></span>Sept.
                           06, 2020</a> <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
                        <a href="#"><span class="fa fa-comment mr-2"></span> 3</a>
                     </p>
                  </div>
                  <h3 class="heading" align="center">
                     <a href="#">3번 말 <br> 심장의고동 <br> 2암(18054) 갈색 한국
                     </a>
                  </h3>
                  <p align="center">
                     <a href="#" class="btn btn-secondary py-2 px-3" data-toggle="modal" data-target="#bettingModalCenter">베팅하기</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<div class="modal fade" id="bettingModalCenter" tabindex="-1" role="dialog" aria-labelledby="bettingModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
         <!-- 베팅 모달창 -->
            <div class="modal-content">
               <div class="modal-header">
                  <!-- 닫기 버튼 -->
                  <button type="button" class="close d-flex align-items-center justify-content-center" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true" class="fa fa-close"></span>
                  </button>
               </div>
               
               <div class="modal-body p-4 p-md-5">
               <!-- 베팅 form -->
                  <form action="#" class="appointment-form ftco-animate">
                     <h3><span style="align-content: center;">베팅</span></h3>
                     <div class="">
                        <div class="form-group">
                           <input type="text" class="form-control" placeholder="베팅할 포인트">
                        </div>
                        <div class="form-group">
                           <input type="submit" value="베팅" class="btn btn-primary py-3 px-4">
                        </div>
                     </div>
                  </form>
                  
                  <div style="margin: auto; width: 70%;" class="ftco-animate">
                  <!-- 1000은 DB에서 가져와야 함 -->
                  <span>베팅 가능한 포인트: 1000 Point</span>
                  </div>
                  
               </div>
            </div>
         </div>
      </div>
      
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
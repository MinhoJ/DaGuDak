<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

 
<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">Let's Run!! </span>
            <h2 class="mb-4">경주마 소개</h2>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">
   <div class="container">
            <div class="row d-flex">
            
            <c:forEach var="horse" items="${horsesList }">
               <div class="col-lg-4 ftco-animate">
                  <div class="blog-entry">
                     <a href="/DaGuDak/horse/horseInfo" class="block-20"
                        style="background-image: url('resources/images/horse1.jpg');">
                     </a>
                     <div class="text d-block">
                        <div class="meta">
                          <!--  <p>
                              <a href="#"><span class="fa fa-calendar mr-2"></span>Sept.
                                 06, 2020</a> <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
                              <a href="#" class="meta-chat"><span
                                 class="fa fa-comment mr-2"></span> 3</a>
                           </p> -->
                        </div>
                        <h3 class="heading" align="center">
                           <a href="#"> <b>${horse.horse_name } </b> <br> ${horse.age } ${horse.gender }(180210)흑색 영국
                           </a>
                        </h3>
                        <p align="center">
                           <a href="/DaGuDak/horseInfo"
                              class="btn btn-secondary py-2 px-3">Read more</a>
                        </p>
                     </div>
                  </div>
               </div>
               </c:forEach>
            </div>
         </div>
    </section>
 
 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
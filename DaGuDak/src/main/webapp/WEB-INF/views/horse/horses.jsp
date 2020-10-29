<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
<script>
function horseCreat() {
   location.href="/DaGuDak/horse/createForm";   
}
</script>
 
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


<section class="bg-light ftco-animate">
   <div class="container">
            <c:if test="${sessionScope.userId == 'admin' }">
            <div align="center">
         <button type="button" onclick="javascript:horseCreat()" class="btn btn-primary mt-5 px-4 py-3">말 생성하기</button>
         </div>
         </c:if>
            <div class="row d-flex pt-5">
            <c:forEach var="horse" items="${horseList }">
               <div class="col-lg-4">
                  <div class="blog-entry">
                     <a href="/DaGuDak/horse/horseInfo" class="block-20"
                        style="background-image: url('/DaGuDak/resources/images/horse1.jpg');">
                     </a>
                     <div class="text d-block">
                        <h3 class="heading" align="center">
                           <a href="/DaGuDak/horse/horseInfo"> <b>${horse.horse_name } </b> <br> 승률: ${horse.win_count / horse.total_games }
                           </a>
                        </h3>
                        <p align="center">
                           <a href="/DaGuDak/horse/horseInfo"
                              class="btn btn-secondary py-2 px-3">상세 정보</a>
                        </p>
                     </div>
                  </div>
               </div>
               </c:forEach>
            </div>
         </div>
    </section>
 
 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
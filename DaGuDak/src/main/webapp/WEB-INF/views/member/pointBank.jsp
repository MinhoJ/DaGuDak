<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <c:if test = "${chargePoint  eq '실패' }">
  <script>
   alert("비밀번호가 맞지 않습니다.");
   </script>
</c:if>

   <section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">POINT BANK</span>
               <h2 class="mb-4">포인트 충전</h2>
               <p>포인트 잔액 : ${vo.point } Point</p>
            </div>
         </div>

         <div class="row block-9" style="margin:auto; margin-bottom: 50px; width: 60%;">
            <div>
               <form action="${pageContext.request.contextPath}/member/pointBank" method="post" class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                  
                     <div class="col-md-12">
                        <div class="form-group">
                           <input type="text" id ="point" name="point" class="form-control" placeholder="충전할 포인트 입력" required>
                        </div>
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group">
                           <input type="password" id = "password" name="password" class="form-control" placeholder="비밀번호" required>
                        </div>
                     </div>
                     
                     <div style="margin-left: auto;  margin-right: auto; margin-top: 20px;">
                        <div class="form-group">
                           <input type="submit" value="카카오 페이로 충전하기" class="btn btn-primary py-3 px-5">
                        </div>
                     </div>
                  </div>
               </form>     
            </div>

         </div>
      </div>
   </section>
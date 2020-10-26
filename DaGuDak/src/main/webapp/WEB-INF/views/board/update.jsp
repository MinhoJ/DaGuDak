<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">NOTICE</span>
            <h2 class="mb-4">공 지 사 항</h2>
            <p>글수정</p>
         </div>
      </div>
   </div>
</section>

<section class="contact-section" id="contact-section">
   <div class="container">
      <div class="row block-9"
         style="margin: auto; margin-bottom: 50px; width: 80%;">
         <!-- form -->
         <form name="form1" method="post" enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/board/update"
            class="p-4 p-md-5 contact-form">

            <div class="col-md-12">
               <div class="form-group">
                  <input type="text" name="title" class="form-control"
                  maxlength="66" value="${dto.title }"
                     placeholder="제목을 입력하세요" required>
               </div>
            </div>

            <div class="col-md-12">
               <div class="form-group">
                  <textarea name="content" id="" cols="30" rows="20" class="form-control"
                     placeholder="내용을 입력하세요" required>${dto.content }</textarea>
               </div>
            </div>

            <div class="col-md-12">
               <div class="form-group">
                  <input type="file" name="file" class="form-control">
               </div>
            </div>
            <input type="hidden" name="writer" value="관리자">
            <input type="hidden" name="bno" value="${dto.bno }">
            <div align="center">
               <div class="form-group">
                  <input type="submit" id="btnSave" value="확인"
                     class="btn btn-primary py-3 px-5">
                  <button type="reset" class="btn btn-primary py-3 px-5">취소</button>
               </div>
            </div>

         </form>
      </div>
   </div>
</section>
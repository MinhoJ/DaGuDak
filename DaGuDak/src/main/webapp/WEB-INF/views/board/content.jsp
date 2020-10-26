<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">NOTICE</span>
            <h2 class="mb-4">공 지 사 항</h2>
         </div>
      </div>
   </div>
</section>

<section style="background-color: #f8f9fa;">
   <div class="comment-form-wrap pt-5"
      style="margin-left: 25%; margin-right: 25%">
      <div>
         <!-- 제목<br> -->
         <h3 class="font-weight-bold" align="center">${dto.title }</h3>
         <p align="right">
            <fmt:formatDate value="${dto.regdate }" type="both" />
         </p>
      </div>

      <div class="pt-5">
         <!-- 내용<br> -->
         <div style="margin: auto;">
            <p style="color: black;">${dto.content }</p>
         </div>

      </div>
      <div align="center">
         <button type="button" onclick="javascript:updateFormBtn(${dto.bid },${dto.bno })" class="btn btn-primary py-3 px-5">수정</button>
         <button class="btn btn-primary py-3 px-5 mb-5 mt-5"
            onclick="javascript:deleteBtn(${dto.bid },${dto.bno })">삭제</button>
        <button type="button" onclick="javascript:listBtn('${dto.bid}','${curPage }','${searchOption }','${keyword }')" class="btn btn-primary py-3 px-5">목록</button>
      </div>
   </div>

</section>
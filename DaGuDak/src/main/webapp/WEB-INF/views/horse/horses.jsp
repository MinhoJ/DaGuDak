<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>
<script>
function horseCreat() {
	location.href="/DaGuDak/horse/createForm";	
}

function select(){
	
	var frm = document.selectHorses;
	var arr_checked = document.getElementsByName("chkHorse");
	var checkedCount = 0;
	
	for(var i=0; i<arr_checked.length; i++){
        if(arr_checked[i].checked == true) {
        	checkedCount++;
        }
    }
	
	if(checkedCount<5){
		alert("말을 5마리 선택해 주세요.");
		return;
	}else{
		frm.submit();
	}

	

}

$(document).ready(function(){
	$("input[type='checkbox']").on("click",function(){
		var count = $("input:checked[type='checkbox']").length;
	
		if(count>5){
			$(this).attr("checked",false);
			alert("5개 까지만 선택 할 수 있습니다.");
		}
	});
	
});


</script>
<c:if test="${deleteResult == 'true'}">
<script>
alert("삭제되었습니다.");
</script>
</c:if>
 
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
<form name="selectHorses" method="post" action = "/DaGuDak/race/createRace">
   			<c:if test="${sessionScope.userId == 'admin' }">
   			<div align="center">
			<button type="button" onclick="javascript:horseCreat()" class="btn btn-primary mt-5 px-4 py-3">말 생성하기</button>
			</div>
<div align="center">
         <button type="button" onclick = "javascript:select()" class="btn btn-primary mt-5 px-4 py-3">참가말 선택</button>
         </div>
<label>일자 선택</label>
					<input type="datetime-local" id="race_date" name="race_date"
						min="2020-10-30" max="2020-12-31"
						contenteditable="false">
						
         
			</c:if>
            <div class="row d-flex pt-5">
            <c:forEach var="horse" items="${horseList }">
               <div class="col-lg-4">
                  <div class="blog-entry">
                     <a href="/DaGuDak/horse/horseInfo?horse_no=${horse.horse_no }" class="block-20"
                        style="background-image: url('/DaGuDak/resources/images/horse1.jpg');">
                     </a>
                     <div class="text d-block">
                        <h3 class="heading" align="center">
                           <a href="/DaGuDak/horse/horseInfo?horse_no=${horse.horse_no }">${horse.horse_no } 번 <br> <b>${horse.horse_name } </b> 
                           <br> 
                           
                           <c:if test = "${horse.total_games == 0}">
                        승률 : 0%
                           </c:if> 
                           <c:if test = "${horse.total_games != 0}">
                           승률: <fmt:formatNumber value="${horse.win_count / horse.total_games}" type="percent" />
                           </c:if> 
                           </a>
                        </h3>
                        <p align="center">
                           <a href="/DaGuDak/horse/horseInfo?horse_no=${horse.horse_no }"
                              class="btn btn-secondary py-2 px-3">상세 정보</a>
<c:if test="${sessionScope.userId == 'admin' }">
               <input type = "checkbox" name = "chkHorse" value = "${horse.horse_no }">
               </c:if>
                        </p>
                     </div>
                  </div>
               </div>
               </c:forEach>
            </div>
</form>
         </div>
    </section>
 
 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
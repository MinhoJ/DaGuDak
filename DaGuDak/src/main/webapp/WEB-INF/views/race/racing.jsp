<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/head.jsp" %>

<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div class="row justify-content-center pb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">RACING</span>
            <h2 class="mb-4">다 그 닥 경 마</h2>
         </div>
      </div>
   </div>
</section>

<style>
   #track{
      width: 1102px;
      height: 650px;
      border: 3px black solid;
      align-content: center;
   }
   
   #gameBackground{
      /* width:  1110px; */
      width: 100%;
      height: 650px;
      margin-left: 10px;
      left: 20%;
      display: flex;
   }
   
   .horse1{
      width: 120px;
      height: 100px;
      /* display: none; */
   }
   .horse2{
      width: 140px;
      height: 140px;
   }
   .horse3{
      width: 160px;
      height: 160px;
   }
   .horse4{
      width: 180px;
      height: 180px;
   }
   .horse5{
      width: 200px;
      height: 200px;
   }
   
   .rank_1_horse{
      width: 35px;
      height: 35px;
   }
   
   .verticalLine {
        border-right: thick solid #ff0000;
      width: 900px;
      height: 647px;
   }
   
   hr{
      position: relative;
      border: solid 2px black;
   }

         
   #timer{
            z-index:40;
            position:absolute;
            left:550px;
            top:450px;
            width:300px;
            height:500px;
            text-align:center;
            color:white;
            font-size:400;
            font-weight:900;
            margin-left:-150px;
            margin-top:-50px;
            
         }
      
      #me {
   position: relative;
   left: 100px;
}

#you {
   position: relative;
   left: 10px;
   min-width: 100px;
   max-width : 400px;
}
   
</style>



<!-- 게임 배경 -->
<script type="text/javascript" src="<c:url value="/resources/js/racing/animationParallxingBackground.js?version=69" />"></script>
<div id="gameBackground" style="position:relative;">
   
   <canvas id="GameCanvas" width="1100" height="650" style="border: 1px solid #000;">
      
   </canvas>
   <div id="track" style="position: absolute; top: 0; left:0;" >
   
      <!-- 랭킹 테이블 -->
   <table align="right" style="margin: 10px 10px 10px 10px; border: 1px solid black; width: 150px; color:black;">
         <th colspan="3">RANKING</th>
         <tr>
            <td>1등 :</td> 
            <td id=rank_1>0</td>
            <td><img class="rank_1_horse" src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif"></td>   
         </tr>
         <tr>
            <td>2등 :</td> 
            <td id=rank_2>0</td>
            <td><img class="rank_1_horse" src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif"></td>   
         </tr>
         <tr>
            <td>3등 :</td> 
            <td id=rank_3>0</td>   
            <td><img class="rank_1_horse" src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif"></td>
         </tr>
         <tr>
            <td>4등 :</td> 
            <td id=rank_4>0</td>   
            <td><img class="rank_1_horse" src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif"></td>
         </tr>
         <tr>
            <td>5등 :</td> 
            <td id=rank_5>0</td>
            <td><img class="rank_1_horse" src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif"></td>   
         </tr>
      </table>
      
      <!-- 타이머 출력 -->
      
         <h1 id="timer">
            READY
         </h1>
   
      <div style="position:relative; left:10px; top:330px" id="img1">
         <%-- <img src="${pageContext.request.contextPath}/resources/images/horse_stop.png" class="stop_horse1"  id="race1" > --%>
         <img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif" class="horse1"  id="race1" >
      </div><!-- <hr/> -->
      <div style="position:relative; left:10px; top:250px" id="img2"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif" class="horse2"  id="race2" ></div><!-- <hr/> -->
      <div style="position:relative; left:10px; top:140px" id="img3"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif" class="horse3"  id="race3" ></div><!-- <hr/> -->
      <div style="position:relative; left:10px; top:10px"  id="img4"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif" class="horse4"  id="race4" ></div><!-- <hr/> -->
      <div style="position:relative; left:10px; top:-120px" id="img5"><img src="${pageContext.request.contextPath}/resources/images/racing/horses/horse_2.gif" class="horse5"  id="race5" ></div>
   <!-- </div> -->
     
</div>
</div>

<!-- 트랙 생성 및 말 생성 -->

   <!-- 출발 버튼 및 랭킹 -->
   <div>
      <input type="button" onclick="start()" value=" 출발! >> " style="margin : 0px 0px 10px 10px; ">
   </div>


<!-- 채팅 -->
<fieldset>
      <div id="messageWindow"
         style="margin-left: 10px; width: 500px; height: 300px; border: 1px solid grey; overflow: auto;"></div>
      <br /> 
      <input id="inputMessage" type="text" onkeypress="enterKey(event)" /> 
      <input type="submit"
         value="send" onclick="send()" style="margin-left: 10px" />
   </fieldset>



<section class="ftco-section contact-section ftco-no-pb"
   id="contact-section">
   <div class="container">
      <div>경마 경기 ${userId}</div>
      <div>출주마 정보</div>
      <div>대기시간에 베팅 가능(경시 시작 후 베팅 불가)</div>
      <div>실시간 단체 채팅</div>
   </div>
</section>

<c:if test = "${userId != null }">
   <script>
   var loginId = '${userId}';
   </script>
   </c:if>
   <c:if test = "${userId == null }">
   <script>
   var loginId = "익명";
   </script>
   </c:if>

<script src="<c:url value="/resources/js/chat/chat.js" />"></script> 
 <script src="<c:url value="/resources/js/racing/race.js?version=5" />"></script>
 <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
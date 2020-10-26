<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<section class="ftco-section bg-light">

      <div class="container">
      
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">My Page</span>
               <h2 class="mb-4">마 이 페 이 지</h2>
                
            </div>
         </div>
    <script>
  
  </script>

         <div class="row block-9" style="margin:auto; margin-bottom: 50px; width: 60%;">
            <div>
            <!-- 회원가입 form -->
               <form name="myPageForm" method="POST"  class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">이 름</td>
                               <td width="300">${vo.name}</td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">아이디 </td>
                               <td width="300">${vo.member_id}</td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                 
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">이메일 </td>
                               <td width="300">${vo.email}</td> 
                            </tr> 
                        </table>
                        </div> 
                        </div>
                   
                  <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">나의 승률 </td>
                               <td width="300">${vo.win_rate}%</td>
                            </tr> 
                        </table>
                        </div> 
                     </div>
                      <div class="col-md-12">
                         
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150"> 포인트 잔액 </td>
                               <td width="300">${vo.point}point</td> 
                            </tr> 
                        </table>
                        </div> 
                       </div> 
                   
                   
                    <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; margin-bottom : 20px;">
                        <div class="form-group">
                         <a href="${pageContext.request.contextPath}/member/myPageUpdate" class="btn btn-primary">회원수정</a>
                            <a href="${pageContext.request.contextPath}/member/deleteMember" class="btn btn-dark">회원탈퇴</a>
                        </div>
                     </div>

                  </div>
               </form>               
            </div>
            
         </div>
      </div>
   </section> 
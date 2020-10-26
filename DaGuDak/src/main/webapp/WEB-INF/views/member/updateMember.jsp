<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<section class="ftco-section bg-light">

      <div class="container">
      
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
               <span class="subheading">My Page</span>
               <h2 class="mb-4">마이 페이지 수정하기</h2>
                
            </div>
         </div> 

         <div class="row block-9" style="margin:auto; margin-bottom: 50px; width: 60%;">
            <div>
            <!-- 회원가입 form -->
               <form action="myPageForm"  class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">이 름</td>
                               <td width="300">${sessionScope.userName}</td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">아이디 </td>
                               <td width="300">${sessionScope.userId}</td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                 
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">이메일 </td>
                               <td width="300">${sessionScope.userEmail}</td> 
                            </tr> 
                        </table>
                        </div> 
                        </div>
                   
                  <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150">나의 승률 </td>
                               <td width="300">${sessionScope.userWin_rate}%</td>
                            </tr> 
                        </table>
                        </div> 
                     </div>
                      <div class="col-md-12">
                         
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="150"> 포인트 잔액 </td>
                               <td width="300">${sessionScope.userPoint}point</td> 
                            </tr> 
                        </table>
                        </div> 
                       </div> 
                   
                   
                    <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; margin-bottom : 20px;">
                        <div class="form-group">
                           <input type="button" value="수정하기" class="btn btn-primary py-3 px-5">
                           <input type="button"  value="회원탈퇴" class="btn btn-dark py-3 px-5">
                        </div>
                     </div>
       

                  </div>
               </form>
               
            </div>

            
         </div>
      </div>
   </section>
   
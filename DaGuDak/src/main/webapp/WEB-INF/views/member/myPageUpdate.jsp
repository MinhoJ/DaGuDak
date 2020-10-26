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
               <form name="myPageUpdateForm" id="myPageUpdateForm" action="${pageContext.request.contextPath}/member/updateMember" class="p-4 p-md-5 contact-form" >
                  <div class="row" >
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="200">이 름</td>
                                <td width="300">
                                      <input type="text" readonly="readonly" name="name" value=" ${loginMemberInfo.name}"/>
                                      
                               </td>
                              </tr> 
                        </table>
                        </div> 
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="200">아이디 </td>
                               <td width="300">
                           <input type="text" readonly="readonly" name="member_id" value=" ${loginMemberInfo.member_id}"/>
                          </td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                     
                      <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="200">비밀번호</td>
                               <td width="300" Style="readonly">
                               <input type="password" name="password"/>
                         
                          </td> 
                            </tr> 
                        </table>
                        </div> 
                     </div>
                     
                 
                     <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="200">이메일 </td>
                               <td width="300"> 
                        <input type="text" name="email" value="${loginMemberInfo.email}"/> 
                        </td> 
                            </tr> 
                        </table>
                        </div> 
                        </div>
                        
                         <div class="col-md-12">
                        <div class="form-group">
                        <table> 
                            <tr>
                               <td width="200">전화번호 </td>
                               <td width="300"> 
                         <input type="text" name="phone" value="${loginMemberInfo.phone}"/>
                        <input type = "hidden" name = "birth" value = "19990101"/>
                        </td> 
                            </tr> 
                        </table>
                        </div> 
                        </div>
   
                   
                    <div style="margin-left: auto;  margin-right: auto; margin-top: 20px; margin-bottom : 20px;">
                        <div class="form-group">
                           <input type="submit" value="완료" id="bntUpdate" class="btn btn-primary py-3 px-5">
                          
                        </div>
                     </div>

                  </div>
               </form>
               
            </div>

            
         </div>
      </div>
   </section>
   
	$(document).ready(function(){
			
			$("#submit").on("click", function(){
		 
				var idChkVal = $("#idChk").val();
				
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
					
				} else if(idChkVal == "Y"){
					
					 
					$("#regForm").submit();
					return true;
				}
			});
		})
	//id 중복확인	
		function fn_idChk(){
			 
			$.ajax({
				url : "/DaGuDak/member/idChk?member_id="+$("#member_id").val(),
				type : "get",
				success : function(data){
				 
					if(data == 1){ 
						$("#idChecked").css("color", "red");
						$("#idChecked").html("이미 사용중인 아이디입니다.");
						$("#idChk").attr("value", "N");
						$("#submit").attr("disabled", "disabled"); 
						
					} else if(data == 0){
						$("#idChecked").css("color", "green");
						$("#idChecked").html("사용가능한 아이디입니다.");
						$("#idChk").attr("value", "Y");
						$("#submit").removeAttr("disabled");
					} else {
						$("#idChecked").css("color", "red");
						$("#idChecked").html("아이디를 입력해주십시오.");
						$("#idChk").attr("value", "N");
						$("#submit").attr("disabled", "disabled"); 
					}
				}
			})
		}
	// 비밀번호 맞는지 확인
	 function checkPwd(){
		  
		  var pw1 = $("#password").val();
		  var pw2 = $("#checkPassword").val();
		  if(pw1!=pw2){
		   document.getElementById('passwordChecked').style.color = "red";
		   document.getElementById('passwordChecked').innerHTML = "동일한 암호를 입력하세요.";
		   $("#submit").attr("disabled", "disabled");
		  }else{
		   document.getElementById('passwordChecked').style.color = "black";
		   document.getElementById('passwordChecked').innerHTML = "암호가 확인 되었습니다.";
		   $("#submit").removeAttr("disabled");
		   
		  }
		  
		 }
	 
	 //생년월일 확인
	 function checkBirth(){
		 var birth = $('#birth').val();
		 
		 if(birth ==''){
			 document.getElementById('checkBirth').style.color = "red";
			   document.getElementById('checkBirth').innerHTML = "생년월일을 입력해주세요.";
			   $("#submit").attr("disabled", "disabled");
		 }else if(birth.length!=8){
			 document.getElementById('checkBirth').style.color = "red";
			   document.getElementById('checkBirth').innerHTML = "생년월일을 정확히 입력해주세요. ex)19990101";
			   $("#submit").attr("disabled", "disabled");
		 }else if(birth.length==8){
		 
			 var date = new Date();
			    var year = date.getFullYear();
			    var month = (date.getMonth() + 1);
			    var day = date.getDate();       
			    if (month < 10) month = '0' + month;
			    if (day < 10) day = '0' + day;
			    var monthDay = month +"" + day;
			    birth = birth.replace('-', '').replace('-', '');
			    var birthdayy = birth.substr(0, 4);
			    var birthdaymd = birth.substr(4, 4);
			    
			    var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
			 
		
			 if(age>19){
			   document.getElementById('checkBirth').style.color = "gray";
			   document.getElementById('checkBirth').innerHTML = "성인입니다.";
			   $("#submit").removeAttr("disabled");
			 }
			 else{
				 document.getElementById('checkBirth').style.color = "red";
				   document.getElementById('checkBirth').innerHTML = "성인이 아닙니다.";
				   $("#submit").attr("disabled", "disabled");
			 }
		 }
	 }
	
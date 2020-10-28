
   var rate = 3;
   
   var user = new Array(5); 
   user[0] = "1번마";
   user[1] = "2번마";
   user[2] = "3번마";
   user[3] = "4번마";
   user[4] = "5번마";
   
   var speed = new Array(5);
   speed[0] = new Array(5);
   speed[1] = new Array(5);
   speed[2] = new Array(5);
   speed[3] = new Array(5);
   speed[4] = new Array(5);

   var rally = new Array(5); 
   rally[0] = 0;
   rally[1] = 0;
   rally[2] = 0;
   rally[3] = 0;
   rally[4] = 0;



    //화면 왼쪽에서 출발, 3/1 지점까지 1단계속도, 2/1 지점까지 2단계 속도, 나머지는 3단계 속도
   var goal = 880;  // 경기장 길이

   // 각 지점
   var goal1 = goal / 4;
   var goal2 = goal / 2;
   var goal3 = goal *3 / 4;

   var gage = 0;  // 단계
   var best = 0;  //제일 빠른놈
   var j = 0;
   var first = 0;   // 1등

   var player = new Array(5);
   var rac = new Array(5);
   var jump =0;

   var winner =0;

   var ranking = create2DArray(5,2);      // 2차원 배열 [ 말번호 , 현재위치 ]
   


   // 경기장 랜덤 선택
   /* var obj= Math.floor(Math.random()*(6))+1;
   document.getElementById("bk" + obj).style.display = "block"; */


   
      
      // 버튼누르면 출발함
      function gogo () {
         
         // ? 또 누르면
         //각 단계별 속도를 지정함
         for(var i=0; i<5; i++) {
            for(var j=0; j<4; j++) {
               if(i==0) {
                  speed[i][j] = Math.random()*(1) + Math.random()*(j+1)+.5;
               } else if(i==3) {
                  speed[i][j] = Math.random()*(1) + Math.random()*(j+1)+.5;
               } else if(i==2) {
                  speed[i][j] = Math.random()*(1) + Math.random()*(j+1)+.5;
               } else if(i==1) {
                  speed[i][j] = Math.random()*(1) + Math.random()*(j+1)+.5;
               } else {    
                  speed[i][j] = Math.random()*(1) + Math.random()*(j+1)+.5;
               }
            }
         }
         
         race();
         
      }
      
   
   // 경기 진행
   function race () {
   
      // 동물의 DIV
      player[0] = document.getElementById("img1");
      player[1] = document.getElementById("img2");
      player[2] = document.getElementById("img3");
      player[3] = document.getElementById("img4");
      player[4] = document.getElementById("img5");
      
      // 동물의 이미지
      rac[0] = document.getElementById("race1");
      rac[1] = document.getElementById("race2");
      rac[2] = document.getElementById("race3");
      rac[3] = document.getElementById("race4");
      rac[4] = document.getElementById("race5");
      
      
      
      
      if (gage < goal) { // 결승선 통과를 안했다면
         //단계별 속도변화 제일 빠른 동물 기준
         if(gage >goal1) j=1;
         if(gage >goal2) j=2;
         if(gage >goal3) j=3;

         for(var i=0; i<5; i++) {
            //jump +=1
            rally[i] += speed[i][j];
            if(best <rally[i]) { 
               best = rally[i];  //젤빠른놈
               winner = i;      // 1등
            }
 
            // 현재 위치에 따라 표시
            player[i].style.left=rally[i]+"px";  // 현재 위치
            
            var currentLoc = player[i].style.left;
            var onlyNumCurrentLoc = currentLoc.replace(/[^0-9]/g, '');   // 'px' 제거
            
            
            // 2차원 배열에 [말번호, 현재위치] 입력
            for(var k=0; k<2; k++){
               if(k==0){
                  ranking[i][k] = (i + 1) + "번마";
               } else {
                  ranking[i][k] = onlyNumCurrentLoc;
               }
            }
            
            
            // 말 움직일 경우 위아래 살짝 점프?  
            /*if (i==0) {
               player[i].style.top= Math.abs(Math.sin((jump+rally[i])/70))*10+"px";  // 말 움직임
            } else if (i==1) {
               player[i].style.top= Math.abs(Math.sin((jump+rally[i])/70))*10+"px";  // 말 움직임
            } else if (i==2) {
               player[i].style.top= Math.abs(Math.sin((jump+rally[i])/70))*10+"px";  // 말 움직임
            } else if (i==3) {
               player[i].style.top= Math.abs(Math.sin((jump+rally[i])/70))*10+"px";  // 말 움직임
            } else if (i==4) {
               player[i].style.top= Math.abs(Math.sin((jump+rally[i])/70))*10+"px";  // 말 움직임
            }*/
            
            
         } // for
         
         
         
         // 실시간 1위만 출력 
         /*for(var i=0; i<5; i++){
            document.getElementById('rank').innerHTML = winner+1; 
         }*/
         
         // 현재위치 기준 내림차순 정렬 (2열 내림차순)
         ranking.sort( function(a, b) {
              return b[1] - a[1];
         });
         
         // 말 순위 출력
         document.getElementById("rank_1").innerHTML = ranking[0][0]; 
         document.getElementById("rank_2").innerHTML = ranking[1][0]; 
         document.getElementById("rank_3").innerHTML = ranking[2][0]; 
         document.getElementById("rank_4").innerHTML = ranking[3][0]; 
         document.getElementById("rank_5").innerHTML = ranking[4][0]; 
         
         
         
         gage = best;
         setTimeout("race()",20);     // 시간 증가하면 말 이동 속도 느려져 게임 진행 시간 증가
         
       } else {
          // 경기 종료
         alert(user[winner] + "가 이겼습니다 !");
          
         // 경기 종료 후 말 위치 카운트 초기화
          for(var i=0; i<5; i++) {
             rally[i] = 0;
             gage=0;
             best=0;
             document.getElementById("timer").innerHTML = "READY";
             document.getElementById("timer").style.display = "";

            // 현재 위치에 따라 표시
            player[i].style.left=rally[i]+"px";  // 현재 위치
 
             
          }
       }

   }
   
   
   // 2차원 배열 생성
   function create2DArray(rows, columns) {
       var arr = new Array(rows);
       for (var i = 0; i < rows; i++) {
           arr[i] = new Array(columns);
       }
       return arr;
   }

   
   function start() {   // 시작 버튼 연결
      
      // 타이머
      var time = 4;
      var sec = "";
      
      var timer = setInterval(function() {
         sec = time%60 - 1;
         
         getTimer();
         time-- ;
         
         if(time == 0){
            document.getElementById("timer").innerHTML = "START";
         } else if(time < 0){
            clearInterval(timer);
            document.getElementById("timer").style.display = "none";
            gogo();
         }
         
      }, 1000);
      
      
      // 타이머 출력 함수
      function getTimer(){
         document.getElementById("timer").innerHTML = sec;
      }
   }
   
   

   

var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://192.168.0.103:8089/DaGuDak/racing');
//당신의 url로 변경해두세요!.
//test 나경
var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function onMessage(event) {
    textarea.innerHTML += "<div  id='you'  "
    +"style='width:"+(event.data.length*12)+"px;'>"
    +event.data + "</div><br>";
         textarea.scrollTop=textarea.scrollHeight;  }
    
    function onOpen(event) {
       textarea.innerHTML += "연결 성공<br>";
       webSocket.send(id + "님이 입장 하였습니다");   }
    
    function onError(event) {     alert(event.data);   }
    
    function send() {
        textarea.innerHTML += "<div  "
        +" id='me' style='width:"
        +((inputMessage.value.length*12)+45)+"px;'>나: " 
        + inputMessage.value 
        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><br>";
        textarea.scrollTop=textarea.scrollHeight;
        webSocket.send(id +  " : " + inputMessage.value);
		inputMessage.value = "";
	}
    
    function enterKey(e) {
     
        if (e.keyCode == 13) {
        	send();       
        }
    }
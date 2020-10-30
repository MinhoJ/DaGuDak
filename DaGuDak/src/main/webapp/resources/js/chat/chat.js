var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://192.168.0.104:8089/DaGuDak/racing');
var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function onMessage(event) {
    textarea.innerHTML += "<div  id='you'  "
    +"style='width:auto; padding-left: 10px;'>"
    +event.data + "</div><br/><br/>";
         textarea.scrollTop=textarea.scrollHeight;
         }
    
    function onOpen(event) {
       textarea.innerHTML += "연결 성공<br/>";
       webSocket.send( loginId +"님이 입장 하였습니다<br/>");
       }
    
    function onError(event) {     
       alert(event.data);
       }
    
    function send() {
        textarea.innerHTML += "<div  "
        +" id='me' style='width: auto;  padding-right: 10px;'>나 : " 
        + inputMessage.value 
        + "</div><br/><br/>";
        textarea.scrollTop=textarea.scrollHeight;
        webSocket.send(loginId + " : " + inputMessage.value);
      inputMessage.value = ""; 
   }
    
    function enterKey(e) {
     
        if (e.keyCode == 13) {
           send();       
        }
    }
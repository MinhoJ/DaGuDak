package kr.co.DaGuDak.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set; 
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
  
@ServerEndpoint("/racing")
public class WebSocketController {
   private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
   Map<String, String> clientMap = new HashMap<String, String>();

   @OnMessage // 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
   public void onMessage(String message, Session session) throws IOException {
      System.out.println("input: " + message);
      String[] messageSplit = message.split("님");
      
      for(int i =0; i<messageSplit.length; i++) {
         System.out.println("*** "+messageSplit[i]);
      }

      synchronized (clients) {
         System.out.println("clients 확인 ====> " + clients);

         for (Session session2 : clients) {
            System.out.println("session.getId() 확인 ====> " + session2.getId());
            clientMap.put(session.getId(), "aaa");  //HttpSession 을 파라미터로 가져올 수가 없어
         } 
          
         /*
          * 메세지는 '이름:' 추가하여 보냄 귓속말은 메세지 입력 창에 [번호] 입력하면 됨 admin창에만 번호를 보이게 하여 admin은 귓속말을
          * 할 수 있게 한다
          */
         String id = null;

         if (message.indexOf(":[") > 0) {
            id = message.substring(message.indexOf(":[") + 2, message.indexOf("]"));
            System.out.println("id:[" + id + "]");
         }
         String userlist = "쌍용";

         String movemessage = session.getId() + ":" + message;
         for (Session client : clients) {
            
            
            // 자기 자신한테는 보내지 않음
            if (!client.equals(session)) {
               if (id == null) {
                  //output  
                   client.getBasicRemote().sendText(userlist+"//"+movemessage);
               } // 귀속말 보냄
               else if (id.equals(client.getId())) {
                  client.getBasicRemote().sendText(movemessage);
                  System.out.println(message);
               }
            }
         }
         
         
      }
   }

   @OnOpen // 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드입니다.
   public void onOpen(Session session) {
      clients.add(session);

   }

   @OnClose // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
   public void onClose(Session session) {
      clients.remove(session);
   }
 

}
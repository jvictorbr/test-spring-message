package com.citi.test.controller.stomp;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompChat {

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Message greeting(HelloMessage message) throws Exception {
        return new Message("Hello, " + message.getName() + "!");
    }
    
    @MessageMapping("/message")
    @SendTo("/topic/greetings")
    public Message message(Message message) {
		return new Message(message.getContent());
    }
    
    

}

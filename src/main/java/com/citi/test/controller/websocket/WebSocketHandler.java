package com.citi.test.controller.websocket;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {
	
	private static final transient Logger log = Logger.getLogger(WebSocketHandler.class);
	private static final Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException { 
		log.info("session: " + session);
		log.info("message: " + message);
		
		if (!sessions.contains(session)) { 
			sessions.add(session);
		}
		
		TextMessage serverMessage = new TextMessage("Server: " + message.getPayload());
		
		for (WebSocketSession websocketsession : sessions) { 
			websocketsession.sendMessage(serverMessage);
		}
		
	}

}

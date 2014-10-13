package com.citi.test.controller.stomp;

public class Message {

	private String content;

	public Message(String content) {
		this.content = content;
	}
	
	public Message() { 
		
	}

	public String getContent() {
		return content;
	}

}

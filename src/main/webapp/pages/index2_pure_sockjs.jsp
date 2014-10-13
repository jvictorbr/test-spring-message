<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <title>Sock chat</title>
  </head>
  <body>
    <textarea id="chat-content" style="width:500px;height:300px"></textarea><br/>
    <input type="text" id="username" placeholder="Choose username"/>
    <input type="text" id="message" placeholder="Enter chat message"/>
    <input type="button" value="Send" onclick="sendMessage()"/>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/pages/sockjs-0.3.4.js"></script>
    
   	<script type="text/javascript">
   		 	
   		var socket = new SockJS('<%= request.getContextPath() %>/controller/echo');
	
	   	// Open the connection
	   	socket.onopen = function() {
	   	  console.log('web socket opened...');
	   	};
	
	   	// On connection close
	   	socket.onclose = function() {
	   	  console.log('close')
	   	};
	   	
	 // On receive message from server
	   	socket.onmessage = function(e) {
		 
		 
	   	  // Get the content
	   	  var message = e.data;

	   	  // Append the text to text area (using jQuery)
	   	  $('#chat-content').val(function(i, text){
	   	    return text + message  + '\n';
	   	  });
	   	  
	   	};
	   	
	 // Function for sending the message to server
	   	function sendMessage(){
	   	  // Get the content from the textbox
	   	  var message = $('#message').val();
	   	  var username = $('#username').val();

	   	  // The object to send
	   	  
	   	  var  content  = username + '> ' + message
	   	  

	   	  // Send it now
	   	  socket.send(content);
	   	}
   	
   	</script>
  
  </body>
  
  
  
  
</html>
<!DOCTYPE html>
<html>
<head>
    <title>Hello WebSocket</title>
    <script src="<%=request.getContextPath() %>/pages/sockjs-0.3.4.js"></script>
    <script src="<%=request.getContextPath() %>/pages/stomp.js"></script>
    <script type="text/javascript">
        var stompClient = null;
        
        function setConnected(connected) {
            
        	document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            
                      
            document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
            document.getElementById('response').innerHTML = '';
            
        }
        
        function connect() {
      
        	document.getElementById('div_welcome').style.display = "none";
            document.getElementById('div_welcome').style.visibility = "hidden";
        	
            var socket = new SockJS('<%= request.getContextPath() %>/sock/hello');
            stompClient = Stomp.over(socket);            
            stompClient.connect({}, function(frame) {
                setConnected(true);
                
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/greetings', function(greeting){
                    showGreeting(JSON.parse(greeting.body).content);
                });
                var name = document.getElementById('name').value;
                stompClient.send("/app/hello", {}, JSON.stringify({ 'name': name }));
                
            });
        }
        
        function disconnect() {
            stompClient.disconnect();
            setConnected(false);
            console.log("Disconnected");
        }
        
        function sendMessage() {
            var message = document.getElementById('message').value;
            stompClient.send("/app/message", {}, JSON.stringify({ 'content': message }));
        }
        
        function showGreeting(message) {
            var response = document.getElementById('response');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }
    </script>
</head>
<body>
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div>
    <div id="div_welcome">
    	<label>Name: </label><input type="text" id="name" />
        <button id="connect" onclick="connect();">Connect</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>
    </div>
    <div id="conversationDiv" style='visibility:hidden'>
        <label>Message: </label><input type="text" id="message" />
        <button id="sendMessage" onclick="sendMessage();">Send</button>
        <p id="response"></p>
    </div>
</div>
</body>
</html>

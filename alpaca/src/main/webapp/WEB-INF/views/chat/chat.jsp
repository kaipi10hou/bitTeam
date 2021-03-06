<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico"/>	
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/custom.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.js"></script>
</head>
<body>
	<div class="container" id="chat">
		<div class="container bootstrap sinppet" style="margin-top:100px">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<a class="homebtn" href="${contextPath}/index.do"></a>
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>알파카 실시간 채팅방</h4>
								<button type="button" onclick="openSocket();">채팅 시작</button>
       	    					<button type="button" onclick="closeSocket();">채팅 종료</button>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 400px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2020년 12월 7일(월)</p>
									</div>
								</div>
								<div class="row">											
									<div id="messages">
										<!-- 채팅 메시지 영역 -->
									</div>
								</div>
							</div>
							<div class="portlet-footer">
								<div class="row" style="height: 90px">
									<div class="form-group">
										<input type="text" id="sender" class="form-control" placeholder="메세지를 입력하세요." maxlength="100" value="${sessionScope.id}" style="height: 80px; display: none;">
										<input type="text" id="messageinput">
									</div>
									<div>
										<input type="button" class="chat-submit-btn btn btn-default pull-right" onclick="send();" />
										<div class="clearfix"></div>
									</div>
								</div>
							</div>														
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="ftco-footer ftco-no-pt">
		<div class="container">

			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved by Alpaca
					</p>
				</div>
			</div>
		</div>
	</footer>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8090/alpaca/chat/echo.do");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("<br>채팅이 종료되었습니다.");
            }
            
        }
        
        function send(){
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
            $('#messageinput').val('');
        }       
 
        $('#messageinput').keypress(function(event){
            if (event.which == 13 ) {
            	$('.chat-submit-btn').click();
                return false;
            }
        });
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}        
  </script>
</body>
</html>
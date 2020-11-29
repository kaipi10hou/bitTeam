<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
	    }
	    
	    #chatLogin{position:relative;width:500px;height:800px;background:#ddd;}
	    #chatLogin .userBox{position:absolute;bottom:0;left:0;width:100%}
	    #chatLogin .btn-primary{border-radius:0}
	
	</style>
	<title>알파카 - 믿을 수 있는 중고 책 거래사이트</title>
</head>
<body>
<div class="container" id="chatLogin">
    <div class="userBox">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title"></div>
            </div>
            <div class="panel-body">
                <form id="login-form" method="post" action="/trip/chat/loginProcess.do">
                    <div>
                        <input type="text" name="id" class="form-control" name="아이디 입력" placeholder="대화명을 입력하세요" autofocus>
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">접속</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
    table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
        
    }
    
    input[type="submit"]{
    	height: 50px;
    }    
    
    body {
    background-color: #edf0ef; 
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
	}

.login-table {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

th {
    background-color: #b7c5c9; 
    padding: 10px;
    text-align: center;
	}

input {

    padding: 8px;
    margin: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
	}

#login, #signup, #find {
    background-color: #4682b4;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
	}

#login:hover, #signup:hover, #find:hover {
    background-color: #36648b; /* hover */
	}

    
</style>
</head>
<body>
	<table>
	        <tr>
	            <th>ID</th>
	            <th>
	                <input type="text" name="id" value="" placeholder="아이디를 입력 하세요"/>
	            </th>
	            <th rowspan="2">
	                <input type="button" id="login" value="login"/>
	            </th>
	        </tr>
	        <tr>
	            <th>PW</th>
	            <th>
	                <input type="password" name="pw" value="" placeholder="비밀번호를 입력 하세요"/>
	            </th>                
	        </tr>
	        <tr>
	            <th colspan="3">
	                <input id="signup" type="button" value="회원가입"/>
	                <input id="find" type="button" value="아이디/비밀번호 찾기"/>
	            </th>    
	        </tr>
	    </table>
</body>
<script>


$('#login').on('click',function(){
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	console.log(id+"/"+pw);
	
	$.ajax({
		type:'post',
		url:'login',
		data:{'id':id, 'pw':pw},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			alert(data.msg);
			if(data.loginInfo != null){
				location.href = '<c:url value='/'/>';
				//location.reload();
					
			}		
		},
		error:function(e){
			console.log(e);
		}
	}); 
	
});


	$('#signup').on('click',function(){
		console.log('회원가입 페이지 진입');
		location.href='signup';
	});
	
	$('#find').on('click',function(){
		console.log('아이디 비밀번호 찾기 페이지 진입');
		location.href='find';
	});
	
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}

		

	
	

</script>
</html>
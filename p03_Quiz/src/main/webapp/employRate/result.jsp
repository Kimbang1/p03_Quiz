<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>출력화면</title>
	<link rel="stylesheet" href="style/style.css?v">
</head>
<body>


<%
//졸업자 수와 취업자 수를 파라미터로 받아오기
String CCountStr = request.getParameter("CCount");
String EPYStr = request.getParameter("EPY");

//취업자% 구하기
double res= 0.0;
if(CCountStr != null && EPYStr != null && !CCountStr.isEmpty() && !EPYStr.isEmpty()){
	try{
		int CCount = Integer.parseInt(CCountStr);
		int EPY = Integer.parseInt(EPYStr);
		
		//취업률 구하기
		if(CCount >0 ){
			res=(double)EPY/CCount*100;
		};
	}catch(NumberFormatException e){
		res=-1;	
		};
};




%>
	<div id="wrap">
		<div id="resArea">
		<span>취업률 : 
		 <% if (res >= 0) { %>
		        <%= String.format("%.2f", res) %>%
		    <% } else { %>
		        오류: 잘못된 입력입니다.
		    <% } %>
		</span>
		</div>
		
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>    
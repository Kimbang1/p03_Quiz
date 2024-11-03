<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	//세션에서 누적된 입력값 목록 가져오기
	List<Integer> cumulativeValues = (List<Integer>) session.getAttribute("cumulativeValue");
	if (cumulativeValues == null) {
		cumulativeValues = new ArrayList<>();
	}

	//입력한 값 파라미터로 가져오기
	String ins1Str = request.getParameter("insert1");
	String ins2Str = request.getParameter("insert2");

	if (ins1Str != null && ins2Str != null) {
		int ins1 = Integer.parseInt(ins1Str);
		int ins2 = Integer.parseInt(ins2Str);

		//각각의 입력값을 누적 리스트에 추가

		int start = Math.min(ins1, ins2);
		int end = Math.max(ins1, ins2);

		for (int i = start; i <= end; i++) {
			cumulativeValues.add(i);
		}

		//세션에 누적 리스트 저장
		session.setAttribute("cumulativeValues", cumulativeValues);
	}

	//누적합의 계산

	int cumulativeSum = 0;
	for (int num : cumulativeValues) {
		cumulativeSum += num;
	}
	%>

	<div id="wrap">
		<h3>누적 결과</h3>
		<span> <%
 for (int i = 0; i < cumulativeValues.size(); i++) {
 	out.print(cumulativeValues.get(i));
 	if (i < cumulativeValues.size() - 1) {
 		out.print("+");
 	}

 }
 %> = <%=cumulativeSum%>
		</span>

	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
		$("#btn1").click(function(){
			location.href="/HbLib/Controller?type=history&id=${user.id}";
		});
		$("#btn2").click(function(){
			location.href="/HbLib/guide/libinfo3.jsp";
		});
	});
</script>
</head>
<body>
<jsp:useBean id="user" scope="session" class="com.hb.mybatis.UsersVO" />
<jsp:setProperty property="*" name="user" />
<c:if test="${user.id==null }">
<script type="text/javascript">
alert("로그인해주세요")
history.go(-1)
</script>
</c:if>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="my_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆My Library > 대출현황</div>
				<div>
					<div class="mainview_c_btn">
						<input type="button" value="대출반납이력" id="btn1" >&nbsp;&nbsp;
						<input type="button" value="대출안내" id="btn2">
					</div>
					<div align="center">
						<table width="680">
							<thead>
								<tr align="left">
									<th width="250">제목</th>
									<th width="150">저자</th>
									<th width="130">고유번호</th>
									<th width="150">반납예정일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><hr color="black" /></td>
								</tr>
								<c:forEach var="k" items="${list }">
								<tr>
									<td>${k.b_subject }</td>
									<td>${k.writer }</td>
									<td>${k.isbn }</td>
									<td>${k.bd_date.substring(0,10) }</td>
								</tr>
								<tr>
									<td colspan="4"><hr /></td>
								</tr>
								</c:forEach>
								<!-- for끝 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
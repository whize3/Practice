<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('td').dblclick(function() {
			var id = $(this).closest("tr").find(".td_id").text();
			location.href="/HbLib/Controller?type=a_memberOnelist&id="+id;
			
		});	
/* 		$("#search_go").click(function() {
		 	var name = $("#search_text").val();
		 	alert(name);
		 	$.ajax({
		 		type : "get",
		 		url : "/HbLib/Controller",
		 		data :
		 			"name="+name+
		 			"&type=memberSearch",
		 		success : function (data){
		 			if(data != null){
		 				alert("검색");
		 			}
		 		},
		 		error:function(){
		 			alert("안돼");
		 		}
		 	});
		}); */
	});
	function search_go(f) {
		f.action="/HbLib/Controller?type=memberSearch";
		f.submit();
	}
</script>
</head>
<body>
<%@ include file="main.jsp" %>
	<!-- 전체 -->
	<div id="content-wrap">
		<!-- 메뉴 -->
		<div id="menu">
			<!-- menu 로고 -->
			<div class="menu-header"><img src="/HbLib/img/icon_menu_member.png" class="img"/><h3>회원관리</h3><hr/></div>
			
			<div class="menu-wrap">
				<ul class="submenu">
					<li><span class="li-s">></span><a href="/HbLib/Controller?type=a_memberlist">회원목록</a></li>
				</ul>
			</div>
		</div>
		<!-- 내용 -->
		<div id="content">
			<div class="page-header">
				<h3>회원목록 
					<small>
						현재 회원 수 
						<a style="color: red">${pvo.totalRecord}</a>
						명
					</small>
				</h3>
			</div>
			<div class="page-header-f">
				<form>
					<select name="searchCategory">
						<option value="1">ID</option>
						<option value="2">이름</option>
						<option value="3">주민번호</option>
					</select>
					<input type="text" name="search_text" placeholder="회원 검색" id="search_text"/>
					<input type="button" value="검색" style="width: 100px;" onclick="search_go(this.form)"/>
					<input type="hidden" name="type" value="memberSearch"/>
				</form>
			</div>
			<hr/>
			<div class="table-wrap">
				<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>ID</th>
							<th>이름</th>
							<th>주민번호</th>
							<th>E-MAIL</th>
							<th>전화번호</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty a_memberlist}">
							<c:forEach items="${a_memberlist}" var="k">
								<tr>
									<td class="td_id">${k.id}</td>
									<td>${k.name}</td>
									<td>${k.jumin}</td>
									<td>${k.email}</td>
									<td>${k.tel}</td>
									<td>${k.addr}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr style="text-align: center;">
							<td colspan="5">
								<ul class="paging">
									<c:choose>
										<c:when test="${pvo.beginPage<pvo.pagePerBlock}">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_memberlist&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=a_memberlist&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=a_memberlist&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_01").css("background-color", "gray")
	});	
</script>
<style type="text/css">
<style>
.table-wrap .table{
border-bottom:0;}
table{
border-collapse: 0;
border-spacing: 0;
border:0;
}
table thead tr{
background-color:#dedede !important;
}
table td{
border-bottom: 1px solid #dedede;
}
tfoot td{
border-bottom:0;

}
thead th{
height:35px;
}
tbody td{
padding-left:16px;
height:30px;
}


table tfoot ul.paging li a:HOVER{
border:1px solid #7383bf;
background:#fff;
color:#000000 !important;
}
table tfoot ul.paging li a{
	border:0;
	
	
}
tfoot td{
height:80px;
}
#writeBtn:HOVER{
	background:#7383bf;
	cursor:pointer;
}
#writeBtn{
	background:#a3b4f3;
	color:#fff;
	border:0;
	width:100px;
	height:30px;
}
.paging{
    display: block;
    margin: 0 auto;
    height: 31px;
    width: 300px;
    margin-top:80px;
}
table tfoot tr:LAST-CHILD{
height:50px;
}
.now{
	display: block;
    padding: 3px 7px;
    background: #7383bf;
    font-weight: bold;
    list-style: none;
    color:#fff;
}
.paging li:LAST-CHILD a, .paging li:FIRST-CHILD a{
	border: 1px solid #545454;
	
}
.paging li:LAST-CHILD a:HOVER, .paging li:FIRST-CHILD a:HOVER{
background:#ddd;
border:0;
font-weight: normal;
}

tfoot tr td div{
width:100%;
height:50%;
display:block;
}
#btnArea{
width:100%;
height:50px;
display: block;
position: relative;
    right: -264px;
}
</style>
</style>
</head>
<body>
	
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> 공지사항</div>
				<div>
					<div align="center">
					<input type="hidden" class="id" value="${user.id}" >
					<div class="table-wrap">
						<table class="table">
					<thead>
						<tr style="background-color: #BCBCBC;">
							<th>순번</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="k" items="${a_noticeList}">
							<tr>
								<td>${pvo.totalRecord-k.r_num+1}</td>
								<td><a href="Controller?type=onenotice&cPage=${pvo.nowPage}&n_idx=${k.n_idx}">${k.n_subject}</a></td>								
								<td>${k.n_date.substring(0,10)}</td>
								<td>${k.n_hit}</td>
							</tr>
						</c:forEach>
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
											<li><a href="/HbLib/Controller?type=noticelist&cPage=${pvo.beginPage-pvo.pagePerBlock}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}" step="1">
										<c:choose>
											<c:when test="${k==pvo.nowPage}">
												<li class="now">${k}</li>
											</c:when>
											<c:otherwise>
												<li><a href="/HbLib/Controller?type=noticelist&cPage=${k}">${k}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pvo.endPage>=pvo.totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="/HbLib/Controller?type=noticelist&cPage=${pvo.beginPage+pvo.pagePerBlock}">다음으로</a></li>
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
			</div>
		</div>
	</div>

</body>
</html>
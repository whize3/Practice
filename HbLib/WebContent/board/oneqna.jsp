<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="/HbLib/css/common.css">
<link href="/HbLib/css/menuList.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	function modify_go(f) {
		var login_id = "<c:out value="${user.id}" />";
		var writer = "<c:out value="${qna.id}" />";
		if (login_id === writer) {
			f.action = "/HbLib/board/qnamodify.jsp";
			f.submit();
		} else {
			alert("권한이 없습니다.");
		}
	}
	function comment_go(f) {
		var login_id = "<c:out value="${user.id}" />";
		if (login_id === "") {
			alert("로그인 해주세요");
		} else {
			f.action = "/HbLib/Controller?type=writeqcomment";
			f.submit();
		}
	}
	function delete_go(f) {
		var login_id = "<c:out value="${user.id}" />";
		var writer = "<c:out value="${qna.id}" />";
		if (login_id === writer) {
			var chk = confirm("정말 삭제 하시겠습니까?")
			if (chk === true) {
				f.action = "/HbLib/Controller?type=qnadelete";
				f.submit();
			} else {
				return;
			}

		} else {
			alert("권한이 없습니다.");
		}

	}
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		$("#navi_02").css("background-color", "gray")
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> QNA</div>
				<div>
					<div align="center">
						<form method="post">
							<table id="table">
								<tbody>
									<input type="hidden" name="q_idx" value="${qna.q_idx}">

									<tr>
										<td colspan="2"><input type="hidden" name="qa_date"
											value="${qna.qa_date}"><span class="date">
												${qna.qa_date}</span> <span class="hit"><input type="hidden"
												name="qa_hit" value="${qna.qa_hit}">조회수 :
												${qna.qa_hit}</span> <%-- <fmt:formatDate value=" ${qna.qa_date}" pattern="yyyy년 MM월 dd일 hh시 mm분"></fmt:formatDate> --%></td>
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="hidden" name="qa_subject"
											value="${qna.qa_subject}">${qna.qa_subject}</td>

									</tr>
									<tr>
										<td colspan="2" id="content"><pre>${qna.qa_content}</pre></td>

									</tr>

								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><input type="button" value="수정"
											onclick="modify_go(this.form)" name="modi" /> <input
											type="button" value="삭제" onclick="delete_go(this.form)"
											name="del" /> <input type="button" value="목록"
											onclick="javascript:location.href='Controller?type=qnalist'"
											name="list" /></td>
									</tr>
								</tfoot>
							</table>
						</form>
						<div class="q_comment_write">
							<form method="post">
								<textarea rows="4" cols="55" name="qc_content"></textarea>
								<input type="hidden" name="id" value="${user.id}" /> <input
									type="hidden" name="q_idx" value="${qna.q_idx}" /> <input
									type="button" value="댓글쓰기" class="re"
									onclick="comment_go(this.form)" />
							</form>
							<br />
						</div>
						<div class="q_comment">
							<c:forEach var="k" items="${qclist}">
								<p>
									<span class="c_id">${k.id} </span>:
								<pre>${k.qc_content}</pre>
								</p>
								<span class="c_date">${k.qc_date.substring(0,10)}</span>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
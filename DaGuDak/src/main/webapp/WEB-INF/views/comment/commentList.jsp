<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="cmt" items="${cmtList }" varStatus="status">
		<ul class="comment-list mt-5">
			<li class="comment">
				<div class="comment-body pt-4 pb-1 px-4"
					style="float: none; margin: auto; background-color: linen; border-radius: 5px;">
					<h5><b>${cmt.cmt_writer }</b></h5>
					<div class="meta"><fmt:formatDate value="${cmt.cmt_regdate }" type="both" /></div>
					<p style="font-size: 16px;">
						<font color="black">${cmt.cmt_content }</font>&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="javascript:commentUpdate(${cmt.cmtno}, ${status.count })" class="reply" style="border: none; margin-right: 2px; padding: 2px 10px;">수정</button>
						<a href="?cmtno=${cmt.cmtno }" class="reply" data-toggle="modal" data-target="#commentDelete">삭제</a>
					</p>
				</div>
			</li>
		</ul>
		<div id="updateForm${status.count }"></div>
</c:forEach>

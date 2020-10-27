<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:forEach var="cmt" items="${cmtList }">
		<ul class="comment-list mt-5">
			<li class="comment">
				<div class="comment-body pt-4 pb-1 px-4"
					style="float: none; margin: auto; background-color: linen; border-radius: 5px;">
					<h5>
						<b>${cmt.cmt_writer }</b>
					</h5>
					<div class="meta">
						<fmt:formatDate value="${cmt.cmt_regdate }" type="both" />
					</div>
					<p style="font-size: 16px;">
						<font color="black">${cmt.cmt_content }</font>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="?cmtno=${cmt.cmtno }" class="reply" data-toggle="modal" data-target="#commentUpdate">수정</a>&nbsp;&nbsp;
						<a href="?cmtno=${cmt.cmtno }" class="reply" data-toggle="modal" data-target="#commentDelete">삭제</a>
					</p>
				</div>
			</li>
		</ul>
</c:forEach>

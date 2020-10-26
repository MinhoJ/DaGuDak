<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
			
				<span class="subheading">NOTICE</span>
				<h2 class="mb-4">공 지 사 항</h2>
				<p>글쓰기</p>
			</div>
		</div>
	</div>
</section>

<section class="contact-section" id="contact-section">
	<div class="container">
		<div class="row block-9"
			style="margin: auto; margin-bottom: 50px; width: 80%;">
			<!-- form -->
			<form name="noiceForm" method="post" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/board/insert"
				class="p-4 p-md-5 contact-form">
				
				<!-- 임시 bid, 나중에는 session에서 받아 컨트롤러에서 입력 될 예정 -->
				<input type="hidden" name="bid" value="${sessionScope.bid }">

				<div class="col-md-12">
					<div class="form-group">
						<input type="text" name="title" class="form-control"
							maxlength="66" placeholder="제목을 입력하세요" required>
					</div>
				</div>

				<div class="col-md-12">
					<div class="form-group">
						<textarea name="content" id="" cols="30" rows="20"
							class="form-control" placeholder="내용을 입력하세요" required></textarea>
					</div>
				</div>

				<div class="col-md-12">
					<div class="form-group">
						<input type="file" name="file" class="form-control">
					</div>
				</div>
				<input type="hidden" name="writer" value="관리자">

				<div align="center">
					<div class="form-group">
						<input type="submit" value="확인" class="btn btn-primary py-3 px-5" />
						<button type="button"
							onclick="javascript:listBtn('${dto.bid}','${curPage }','${searchOption }','${keyword }')"
							class="btn btn-primary py-3 px-5">목록</button>
						<button type="reset" class="btn btn-primary py-3 px-5">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

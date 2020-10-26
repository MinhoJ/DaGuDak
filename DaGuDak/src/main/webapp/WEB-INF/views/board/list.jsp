<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<!-- bid 1 공지사항 , 2 경마뉴스, 3 익명게시판, 4 고객센터-->

<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<c:if test="${sessionScope.bid == '1'}">
					<span class="subheading">NOTICE</span>
					<h2 class="mb-4">공 지 사 항</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '2'}">
					<span class="subheading">NEWS</span>
					<h2 class="mb-4">경 마 뉴 스</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '3'}">
					<span class="subheading">ANONYMOUS BOARD</span>
					<h2 class="mb-4">익 명 게 시 판</h2>
				</c:if>
				<c:if test="${sessionScope.bid == '4'}">
					<span class="subheading">CUSTOMER SERVICE</span>
					<h2 class="mb-4">고 객 센 터</h2>
				</c:if>
			</div>
		</div>
	</div>
</section>

<div class="limiter" style="margin-bottom: 50px;">
	<div class="container-table100">
		<div class="wrap-table100">
			<div align="right" style="margin-bottom: 5px;">
				<c:if test="${sessionscope.bid == '4'}">
					<div
						style="margin-right: 0px; margin-bottom: 5px; width: 135px; float: left;">
						<a href="#" class="btn btn-dark"> FAQ </a> <a href="#"
							class="btn btn-dark"> 1:1 문의 </a>
					</div>
				</c:if>
				<c:if test="${sessionscope.bid != '2'}">
					<div style="margin-left: 0px; margin-bottom: 5px; float: right;">
						<button type="button" id="btnWrite" name="btnWrite"
							class="btn btn-primary">작성하기</button>
					</div>
				</c:if>
			</div>
			<div class="table">
				<div class="hrows header">
					<div class="cell">번호</div>
					<div class="cell">제목</div>
					<div class="cell">이름</div>
					<div class="cell">작성일</div>
					<div class="cell">조회수</div>
				</div>
				<c:forEach var="row" items="${map.list }">
					<div class="rows"
						OnClick="location.href='${pageContext.request.contextPath}/board/content?bid=${row.bid }&bno=${row.bno}&curPage=${map.boardPager.curPage }&searchOption=${map.searchOption }&keyword=${map.keyword }'">
						<div class="cell" data-title="번호">${row.bno}</div>
						<div class="cell" data-title="제목">${row.title }</div>
						<div class="cell" data-title="이름">${row.writer }</div>
						<div class="cell" data-title="작성일">
							<fmt:formatDate value="${row.regdate }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<div class="cell" data-title="조회수" align="center">${row.viewcnt}
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 신 검색창  -->
			<div style="background-color: #f2f2f2; padding: 10px; height: 75px;">
				<div class="sidebar-box" style="padding: 0px;">
					<form name="search" class="search-form" style="padding: 0px;">
						<div class="select-wrap appointment-form"
							style="width: 29%; margin: 0px; float: left;">
							<select name="searchOption" class="form-control appointment-form"
								style="font-size: 13px;">
								<option value="all"
									<c:out value="${map.searchOption== 'all'?'selected':''}"/>>
									제목+이름+내용</option>
								<option value="writer"
									<c:out value="${map.searchOption== 'writer'?'selected':''}"/>>
									이름</option>
								<option value="content"
									<c:out value="${map.searchOption== 'content'?'selected':''}"/>>
									내용</option>
								<option value="title"
									<c:out value="${map.searchOption== 'title'?'selected':''}"/>>
									제목</option>
							</select>
						</div>

						<div class="form-group"
							style="width: 69%; margin: 0px; float: right;">
							<input name="keyword" value="${map.keyword }"
								class="form-control" placeholder="검색어를 입력하세요"> <a
								href="${pageContext.request.contextPath}/board/list?bid=${sessionScope.bid}"
								onclick="submit()"><span class="icon fa fa-search"></span></a>
						</div>
					</form>
				</div>
			</div>
			<!-- 구버전 
			<form name="search" method="post"
					action="${pageContext.request.contextPath}/board/list">
					<select name="searchOption">
						<option value="all"
							<c:out value="${map.searchOption== 'all'?'selected':''}"/>>
							제목+이름+내용</option>
						<option value="writer"
							<c:out value="${map.searchOption== 'writer'?'selected':''}"/>>
							이름</option>
						<option value="content"
							<c:out value="${map.searchOption== 'content'?'selected':''}"/>>
							내용</option>
						<option value="title"
							<c:out value="${map.searchOption== 'title'?'selected':''}"/>>
							제목</option>
					</select> <input name="keyword" value="${map.keyword }"> <input
						type="submit" value="조회">
				</form> 
-->
			<!-- 페이지 번호 -->
			<div class="row" style="margin-top: 4rem">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<%-- <c:if test = "${map.boardPager.curBlock>1 }">
                  <a href = "javascript:list('1')">[처음]</a>
                  </c:if> --%>
							<c:if test="${map.boardPager.curBlock>1 }">
								<li><a
									href="javascript:list('${map.boardPager.prevPage }')">&lt;</a></li>
							</c:if>
							<c:forEach var="num" begin="${map.boardPager.blockBegin }"
								end="${map.boardPager.blockEnd }">
								<c:choose>
									<c:when test="${num==map.boardPager.curPage }">
										<li class="active"><span style="color: red">${num }</span></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="javascript:list('${bid }','${num }','${map.searchOption}','${map.keyword }')">${num }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.boardPager.curBlock<=map.boardPager.totBlock }">
								<li><a
									href="javascript:list('${map.boardPager.nextPage }')">&gt;</a></li>
							</c:if>

							<%--     <c:if test="${map.boardPager.curPage<=map.boardPager.totPage }">   
                  <a href="javascript:list('${map.boardPager.totPage }')">[끝]</a>
                  </c:if> --%>
							<!--                 
                     <li class="active"><span>1</span>
                     <li><a href="#">2</a>
                     <li><a href="#">3</a></li>
                     <li><a href="#">4</a></li>
                     <li><a href="#">5</a></li> -->

						</ul>
					</div>
				</div>
			</div>
			<!-- 페이지 번호 -->

		</div>
	</div>
</div>

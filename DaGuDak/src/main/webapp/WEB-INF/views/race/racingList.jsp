<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file = "/WEB-INF/views/common/head.jsp" %>
	
<section class="ftco-section contact-section ftco-no-pb"
	id="contact-section">
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">RACING LIST</span>
				<h2 class="mb-4">오늘의 경기</h2>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">

	<div class="container">
		<div class="row d-flex">
			<!-- 개별 경기 -->
			<!-- 경기 중일 때는 /racing, 대기 중일 때는 /betting, 경기 종료는 /racingResult -->
			<%-- 
			<div class="col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="/DaGuDak/race/racing" class="block-20"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/list_ing.jpg');">
					</a>
					<div class="text d-block">
						<div class="meta">
							<p>
								<a href="/DaGuDak/race/racing"><span class="fa fa-calendar mr-2"></span>2020년
									10월 20일</a>
							</p>
						</div>
						<h3 class="heading">
							<a href="/DaGuDak/race/racing">4번째 경기</a>
						</h3>
						<p>
							<a href="/DaGuDak/race/racing" class="btn btn-secondary py-2 px-3">경기
								보기</a>
						</p>
					</div>
				</div>
			</div>
 --%>
			
 <c:forEach var="race" items="${list }">
 
 <c:if test = "${race.isEnd == 'N'}">
			<div class="col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="/DaGuDak/horses" class="block-20"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/list_waiting.jpg');">
					</a>
					<div class="text d-block">
						<div class="meta">
							<p>
						<!-- 경기내용 -->		<a href="/DaGuDak/horses"><span class="fa fa-calendar mr-2"></span>
								${race.race_Date }
								</a>
							</p>
						</div>
						<h3 class="heading">
							<a href="/DaGuDak/horses">${race.race_No } 번째 경기</a>
						</h3>
						<h4> 참여 한 말</h4>
						<h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>
						<p>
						<!-- betting -->	<a href="/DaGuDak/horses" class="btn btn-secondary py-2 px-3">베팅
								하기</a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
			
			
			
			</c:forEach>
			 <c:forEach var="race" items="${list }">
			<c:if test = "${race.isEnd == 'Y'}">
			<div class="col-lg-4 ftco-animate">
				<div class="blog-entry">
					<a href="/DaGuDak/racingResult" class="block-20"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/list_end.jpg');">
					</a>
					<div class="text d-block">
						<div class="meta">
							<p>
								<a href="/DaGuDak/racingResult"><span
									class="fa fa-calendar mr-2"></span>${race.race_Date }</a>
							</p>
						</div>
						<h3 class="heading">
							<a href="/DaGuDak/racingResult?race_No=${race.race_No }">${race.race_No } 번째 경기</a>
						</h3>
						<h4> 참여 한 말</h4>
						<h5>${race.first_Horse } , ${race.second_Horse }, ${race.third_Horse }, ${race.fourth_Horse }, ${race.fifth_Horse }</h5>		
						<p>
							<a href="/DaGuDak/racingResult"
								class="btn btn-secondary py-2 px-3">경기 결과 보기</a>
						</p>
					</div>
				</div>
			</div>
			</c:if>
</c:forEach>
		</div>
		<div align="center">
			<button class="btn btn-primary py-3 ftco-animate">지난 경기 결과
				보기</button>
		</div>
	</div>
</section>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
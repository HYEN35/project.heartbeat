<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminLayout.jsp" %>

<body>
	<div class="inner admin member" data-name="member">
		<%@ include file="../include/admin.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="topCnt">
						<div class="searchWrap">
							<div class="searchBx">
								<select class="sltBx">
									<option value="#name">이름</option>
									<option value="#email">이메일</option>
									<option value="#nickname">닉네임</option>
								</select>
								<input type="text" class="txtBx" placeholder="검색어 입력">
								<button type="button" class="btn-border">검색</button>
							</div>
							<div class="btnBx">
								<!-- [D] 신규등록 미정 -->
								<!-- <button type="button" class="btn-full">신규등록</button> -->
							</div>
						</div>
					</div>
					<div class="midCnt">
						<ul class="list">
							<li class="item">
								<div class="infoWrap">
									<span class="info">이름 : <i id="name">관리자</i></span>
									<span class="info">이메일 : <i>admin@admin.com</i></span>
									<span class="info">닉네임 : <i>관리자</i></span>
									<span class="info">생년월일 : <i>2000-01-01</i></span>
									<span class="info">핸드폰번호 : <i>01012345678</i></span>
									<span class="info">구독등급 : <i>100</i></span>
									<span class="info">가입일 : <i>2024-01-01</i></span>
								</div>
								<div class="btnWrap">
									<a href="edit.html" class="btn-border">수정</a>
									<button type="button" class="btn-border-01" onclick="deleteMember(this);">삭제</button>
								</div>
							</li>					
							<li class="item">
								<div class="infoWrap">
									<span class="info">이름 : <i id="name">테스트</i></span>
									<span class="info">이메일 : <i>admin@admin.com</i></span>
									<span class="info">닉네임 : <i>테스트</i></span>
									<span class="info">생년월일 : <i>2000-01-01</i></span>
									<span class="info">핸드폰번호 : <i>01012345678</i></span>
									<span class="info">구독등급 : <i>100</i></span>
									<span class="info">가입일 : <i>2024-01-01</i></span>
								</div>
								<div class="btnWrap">
									<a href="edit.html" class="btn-border">수정</a>
									<button type="button" class="btn-border-01" onclick="deleteMember(this)">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">이름 : <i id="name">홍길동</i></span>
									<span class="info">이메일 : <i>admin@admin.com</i></span>
									<span class="info">닉네임 : <i>홍길동</i></span>
									<span class="info">생년월일 : <i>2000-01-01</i></span>
									<span class="info">핸드폰번호 : <i>01012345678</i></span>
									<span class="info">구독등급 : <i>100</i></span>
									<span class="info">가입일 : <i>2024-01-01</i></span>
								</div>
								<div class="btnWrap">
									<a href="edit.html" class="btn-border">수정</a>
									<button type="button" class="btn-border-01" onclick="deleteMember(this)">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">이름 : <i id="name">김민정</i></span>
									<span class="info">이메일 : <i>admin@admin.com</i></span>
									<span class="info">닉네임 : <i>김민정</i></span>
									<span class="info">생년월일 : <i>2000-01-01</i></span>
									<span class="info">핸드폰번호 : <i>01012345678</i></span>
									<span class="info">구독등급 : <i>100</i></span>
									<span class="info">가입일 : <i>2024-01-01</i></span>
								</div>
								<div class="btnWrap">
									<a href="edit.html" class="btn-border">수정</a>
									<button type="button" class="btn-border-01" onclick="deleteMember(this)">삭제</button>
								</div>
							</li>
						</ul>
						<div class="pagination">
							<button type="button" class="btn-i-prev"></button>
							<ul class="page">
								<li class="num on">1</li>
								<li class="num">2</li>
								<li class="num">3</li>
								<li class="num">4</li>
								<li class="num">5</li>
							</ul>
							<button type="button" class="btn-i-next"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="dimmed"></div>

	<script>
		//회원삭제
		function deleteMember(e){
			var name = $(e).closest('.item').find('#name').text();
			if(confirm(name + ' 회원을 삭제하시겠습니까?')){
				alert("삭제가 완료되었습니다.");
			}
		}
	</script>
</body>
</html>
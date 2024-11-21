<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminLayout.jsp" %>

<body>
	<div class="inner admin editMember" data-name="member">
		<%@ include file="../include/admin.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="midCnt">
						<form autocomplete="off">
							<div class="infoWrap">
								<input type="text" class="txtBx" value="홍길동" placeholder="이름">
								<input type="email" class="txtBx" value="admin@admin.com" placeholder="이메일">
								<input type="text" class="txtBx" value="홍길동" placeholder="닉네임">
								<input type="date" class="txtBx" value="2000-01-01" placeholder="생년월일">
								<input type="number" class="txtBx" value="01012345678" placeholder="핸드폰번호">
								<input type="text" class="txtBx" value="100" placeholder="구독등급">
								<input type="text" class="txtBx" value="2024-01-01" disabled>
							</div>
							<div class="btnWrap">
								<button type="button" class="btn-full">회원수정</button>
								<button type="button" class="btn-border">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="dimmed"></div>
</body>
</html>
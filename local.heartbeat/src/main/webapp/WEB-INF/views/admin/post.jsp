<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminLayout.jsp" %>

<body>
	<div class="inner admin post" data-name="post">
		<%@ include file="../include/admin.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="topCnt">
						<div class="searchWrap">
							<div class="searchBx">
								<select class="sltBx">
									<option value="#name">작성자</option>
									<option value="#contents">내용</option>
								</select>
								<input type="text" class="txtBx" placeholder="검색어 입력">
								<button type="button" class="btn-border">검색</button>
							</div>
						</div>
					</div>
					<div class="midCnt">
						<ul class="list">
							<li class="item">
								<div class="infoWrap">
									<span class="info">게시물 번호 : <i id="num">101011</i></span>
									<span class="info">작성자 : <i>관리자</i></span>
									<span class="info">작성일 : <i>2024-01-10</i></span>
									<span class="info content">내용 : <i class="elps">게시글 내용이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i></span>
								</div>
								<div class="btnWrap">
									<a href="/Html/community/artist/newjeans.html" class="btn-border">게시글 보기</a>
									<button type="button" class="btn-border-01" onclick="deleteItem(this);">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">게시물 번호 : <i id="num">101010</i></span>
									<span class="info">작성자 : <i>관리자</i></span>
									<span class="info">작성일 : <i>2024-01-09</i></span>
									<span class="info content">내용 : <i class="elps">게시글 내용이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i></span>
								</div>
								<div class="btnWrap">
									<a href="/Html/community/artist/newjeans.html" class="btn-border">게시글 보기</a>
									<button type="button" class="btn-border-01" onclick="deleteItem(this);">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">게시물 번호 : <i id="num">101009</i></span>
									<span class="info">작성자 : <i>관리자</i></span>
									<span class="info">작성일 : <i>2024-01-08</i></span>
									<span class="info content">내용 : <i class="elps">게시글 내용이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i></span>
								</div>
								<div class="btnWrap">
									<a href="/Html/community/artist/newjeans.html" class="btn-border">게시글 보기</a>
									<button type="button" class="btn-border-01" onclick="deleteItem(this);">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">게시물 번호 : <i id="num">101008</i></span>
									<span class="info">작성자 : <i>관리자</i></span>
									<span class="info">작성일 : <i>2024-01-07</i></span>
									<span class="info content">내용 : <i class="elps">게시글 내용이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i></span>
								</div>
								<div class="btnWrap">
									<a href="/Html/community/artist/newjeans.html" class="btn-border">게시글 보기</a>
									<button type="button" class="btn-border-01" onclick="deleteItem(this);">삭제</button>
								</div>
							</li>
							<li class="item">
								<div class="infoWrap">
									<span class="info">게시물 번호 : <i id="num">101007</i></span>
									<span class="info">작성자 : <i>관리자</i></span>
									<span class="info">작성일 : <i>2024-01-06</i></span>
									<span class="info content">내용 : <i class="elps">게시글 내용이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i></span>
								</div>
								<div class="btnWrap">
									<a href="/Html/community/artist/newjeans.html" class="btn-border">게시글 보기</a>
									<button type="button" class="btn-border-01" onclick="deleteItem(this);">삭제</button>
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
		//게시글삭제
		function deleteItem(e){
			var num = $(e).closest('.item').find('#num').text();
			if(confirm('게시글 번호 ' + num + '을 삭제하시겠습니까?')){
				alert("삭제가 완료되었습니다.");
			}
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/layout.jsp" %>
<% 
	request.setAttribute("artistPage", "artist");
%>

<link rel="stylesheet" type="text/css" href="/css/vendor/slick.css">
<link rel="stylesheet" type="text/css" href="/css/vendor/slick-theme.css">
<script src="/js/vendor/slick.min.js"></script>

<body>	
	<div class="inner service artist-newjeans" data-name="community">
		<%@ include file="../../include/menu.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="section-banner">
						<img src="/img/artist/newjeans-header.jpg" alt="newjeans" class="thumb">
					</div>
					<div class="section-artist-post">
						<div class="artistWrap">
							<div class="slideBx">
								<div class="postBx">
									<a href="#none" onclick="popPostArtistShow();">
										<div>
											<div class="arti-profile"><img src="/img/artist/nj_mj.jpeg" onerror=this.src="/img/user.png" class="arti-thumb" alt="민지"></div>
											<div class="arti-comment">
												<div class="arti-top">
													<span class="arti-mark"><span class="blind">artist</span></span>
													<span class="arti-name">민지</span>
												</div>
												<div class="arti-cnt">
													<div class="txt">안녕하세요</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="section-fan-post">
						<div class="fanWrap">
							<div class="posting" onclick="popPostShow();">
								<p>당신의 아티스트에게 포스트를 남겨보세요.</p>
								<i class="i-img"><i class="fa-regular fa-image"></i></i>
							</div>
							<div class="postWrap">
								<div class="postBx">
									<a href="#none" onclick="popPostFanShow();">
										<div>
											<div class="fan-profile">
												<img src="#none" onerror=this.src="/img/user.png" class="fan-thumb" alt="닉네임1">
												<span class="nickname">닉네임1</span>
												<div class="date">24-10-19 13:12</div>
											</div>
											<div class="fan-comment">
												<div class="fan-cnt">
													<img src="/img/artist/newjeans-header.jpg" alt="newjeans-header">
													<div class="txt">안녕하세요</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="postBx">
									<a href="#none" onclick="popPostFanShow();">
										<div>
											<div class="fan-profile">
												<img src="#none" onerror=this.src="/img/user.png" class="fan-thumb" alt="닉네임1">
												<span class="nickname">닉네임1</span>
												<div class="date">24-10-19 12:12</div>
											</div>
											<div class="fan-comment">
												<div class="fan-cnt">
													<img src="/img/artist/newjeans.jpg" alt="newjeans"><br><br>
													<div class="txt">안녕하세요</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
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
	
	<div class="dimmed" onclick="popPostArtistHide();popPostHide();popPostFanHide();"></div>

	<!-- [D] 팝업 아티스트 포스트 -->
	<div class="popup pop-post-artist"><%@ include file="../../popup/pop-post-artist.jsp" %></div>
	<!-- [D] 팝업 팬 포스트 -->
	<div class="popup pop-post-fan"><%@ include file="../../popup/pop-post-fan.jsp" %></div>
	<!-- [D] 팝업 포스트작성 -->
	<div class="popup pop-post"><%@ include file="../../popup/pop-post.jsp" %></div>
	
	<script>
		$(function(){
			slick();
		});
		function slick(){
			$('.slideBx').slick({
				infinite: true,
				slidesToShow: 3,
				slidesToScroll: 3,
				swipe: true,
				arrows: true,
				dots: false,
				variableWidth: false,
				adaptiveHeight: true
			});
		};

		//팝업 아티스트포스트
		function popPostArtistShow(){
			$('.pop-post-artist').show();
			$('.dimmed').show();
		}
		function popPostArtistHide(){
			$('.pop-post-artist').hide();
			$('.dimmed').hide();
		}
		
		//아티스트 포스트 하트 토글
		function likeToggle(e){
			$(e).toggleClass('on');
		}

		//팝업 팬포스트작성
		function popPostShow(){
			$('.pop-post').show();
			$('.dimmed').show();
			//uploadFileName();
			multipleUploadFile();
		}
		function popPostHide(){
			$('.pop-post').hide();
			$('.dimmed').hide();
		}

		//팝업 팬포스트
		function popPostFanShow(){
			$('.pop-post-fan').show();
			$('.dimmed').show();
			//uploadFileName();
			multipleUploadFile();
		}
		function popPostFanHide(){
			$('.pop-post-fan').hide();
			$('.dimmed').hide();
		}
	</script>
</body>
</html>
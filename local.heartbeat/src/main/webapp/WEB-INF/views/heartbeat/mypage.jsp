<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<script>
		$(function(){
			mypageTab();
			tabListShow();
		});

		function mypageTab(){
			$('.tabBtn .tab').on('click', function () {

				var tabName = $(this).attr('data-tab');

				$('.tabBtn .tab').removeClass('on');
				$('.tabCnt .cntBx').removeClass('on');
				$(this).addClass('on');
				$('.' + tabName).addClass('on');
			});
		}

		function tabListShow(){
			$('.tab-playlist .item .tit').on('click', function(){
				$(this).siblings('.list').children('.listWrap').toggle();
			})
		}		
		
		//닉네임 중복 확인 여부
		let isNickAvailable = false;
		let nickDuplicateChecked = false; 	
		
		//닉네임 중복확인
		function nicknameCheck(nickname) {
			if(nickname =="") {
				alert(' 닉네임을 입력하세요.');
				document.mypageFrm.nickname.focus();
				return false;
			}		
			 $.ajax({
		       		url: '/join/nicknamecheck',
		        	type: 'POST',
		        	data: { nickname: nickname },
		        	success: function(data) {
		        		nickDuplicateChecked = true;
			           	if (data === 'success') {
			           				popAlertCheckShow("사용 불가능합니다.");
			                       	$('.msg').text(nickname+ '은/는 사용 불가능합니다. ');
			                       	isNickAvailable = false;
			                   	} else {
			                   		popAlertCheckShow("중복된 사용 가능합니다");
			                       	$('.msg').text(nickname+ '은/는 사용 가능합니다.');
			                       	isNickAvailable = true;
			                   	}
		           	popAlertCheckShow(); 
		        	}
		    	});
		}
		
	    function resetNickAvailability() {
	    	nickDuplicateChecked = false;
	    }
		
		//유효성 체크
		function validityCheck() {
			if (document.mypageFrm.pwd.value == '') {
				alert('비밀번호를 입력하세요.');
				document.mypageFrm.pwd.focus();
				return false;
			}
			if (document.mypageFrm.newPwd.value == '') {
				alert('비밀번호를 입력하세요.');
				document.mypageFrm.pwd.focus();
				return false;
			}
			if (document.mypageFrm.newPwdCheck.value == '') {
				alert('비밀번호를 입력하세요.');
				document.mypageFrm.pwd.focus();
				return false;
			}
			
			// 비밀번호 유효성 체크
		    const pwd = document.mypageFrm.newPwd.value;
		    const pwdVPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/; 
		    if (!pwdVPattern.test(pwd)) {
		    	alert("비밀번호는 대문자 영어, 특수문자, 숫자를 포함하여 8~16자로 해주세요.");
		        document.mypageFrm.pwd.focus();
		        return false;
		    }
			
			if(document.mypageFrm.newPwd.value != document.mypageFrm.newPwdCheck.value) {
				alert("입력한 새 비밀번호가 서로 일치하지 않습니다. 다시 확인해주세요.");
				document.mypageFrm.pwd.focus();
				return false;
			}
			
		    if (!nickDuplicateChecked) {
		        alert("닉네임 중복 확인이 필요합니다.");
		        return false;
		    }
		    if (!isNickAvailable) {
		        alert("중복된 닉네임입니다. 닉네임을 변경해주세요.");
		        return false;
		    }
		    
			document.mypageFrm.submit();
		}
		// 닉네임 팝업
		function popAlertCheckShow() {
		    $('.pop-alert-check').show();
			$('.dimmed').show();
		}
		function popAlertCheckHide(){
			$('.pop-alert-check').hide();
			$('.dimmed').hide();
		}
		
		// 탈퇴 팝업
		function popDeleteUserShow(){
			$('.pop-delete-user').show();
			$('.dimmed').show();
		}
		function popDeleteUserHide(){
			$('.pop-delete-user').hide();
			$('.dimmed').hide();
		}
		
	//멤버쉽 해지
		function deleteMembership() {
		if(confirm('멤버십 해지를 진행하시겠습니까?')) {
			$('#membershipDel').val(0);
			document.membershipFrm.submit();
		}
	}
		
	</script>
	
	<div class="inner service mypage" data-name="mypage">
		<%@ include file="../include/menu.jsp" %>
		
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="tabBtn">
						<ul>
							<li data-tab="tab-myinfo" class="tab on">내 정보 변경</li>
							<li data-tab="tab-membership" class="tab">멤버십 변경</li>
							<li data-tab="tab-post" class="tab">작성글 확인</li>
							<li data-tab="tab-playlist" class="tab">플레이리스트 확인</li>
						</ul>
					</div>
					<div class="tabCnt">
						<form action="/mypage/modify" method="post"name="mypageFrm">
							<div class="cntBx tab-myinfo on">
								<div class="cnt">
									<ul class="itemWrap">
										<li class="item password">
											<p class="dt">비밀번호 변경</p>
											<div class="dd">
												<input type="password"  name="pwd" class="txtBx" placeholder="현재 비밀번호 입력">
												<input type="password"  name="newPwd" class="txtBx" placeholder="새 비밀번호 입력">
												<input type="password"  name="newPwdCheck" class="txtBx" placeholder="새 비밀번호 확인">
											</div>
										</li>
										<li class="item nickname">
											<p class="dt">닉네임 변경</p>
											<div class="dd">
												<input type="text" name="nickname"  oninput="resetNickAvailability()" class="txtBx" placeholder="닉네임 입력">
												<button type="button" onclick="nicknameCheck(this.form.nickname.value)" class="btn-border">중복확인</button>
											</div>
										</li>
										<li class="item image">
											<p class="dt">프로필 사진 변경</p>
											<div class="dd">
												<input type="file" hidden>
												<button type="button" class="btn-border" onclick="$(this).siblings('input').click();">사진 변경</button>
												<p class="file"><i>filenme.jpg</i></p>
											</div>
										</li>
										<li class="item">
											<p class="dt">회원 탈퇴</p>
											<div class="dd"><button type="button" class="btn-under-01" onclick="popDeleteUserShow()" >탈퇴하기</button>
											</div>
										</li>
									</ul>
								</div>
								<div class="btnWrap">
									<button type="button" class="btn-full" onclick="validityCheck()">저장</button>
									<button type="button" class="btn-border">취소</button>
								</div>
							</div>
						</form>
						<div class="cntBx tab-membership">
							<div class="cnt">
								<form action="mypage/membership" method="post" name="membershipFrm">
								<div class="current">
									<div>현재 사용하고 계신 이용권은 <i id="nowLevel">Level  ${user.level }</i>입니다. <p>(이용기간 : <i>2024-08-29 ~ 2024-09-29</i>)</p></div>
									<button id="membershipDel" type="button" class="btn-under-01" name="level" onclick="deleteMembership()">멤버십 해지</button>
								</div>
									<ul class="itemWrap">
										<li class="item ${user.level == 1 ? 'disabled' : ''}">
											<p class="thumb"><i class="fa-solid fa-coins"></i></p>
											<p class="info">
												<span class="grade">Level 1</span>
												<span>단일 스트리밍 이용권</span>
											</p>
											<p class="price">3,900원</p>
											<button type="submit" class="btn-full" name="level" value="1" ${user.level == 1 ? 'disabled' : ''}>구매하기</button>
										</li>
										<li class="item ${user.level == 2 ? 'disabled' : ''}">
											<p class="thumb"><i class="fa-solid fa-coins"></i></p>
											<p class="info">
												<span class="grade">Level 2</span>
												<span>스트리밍 이용권 + 아티스트 구독</span>
											</p>
											<p class="price">6,900원</p>
											<button type="submit" class="btn-full" name="level" value="2" ${user.level == 2 ? 'disabled' : ''}>구매하기</button>
										</li>
									</ul>
								</form>
							</div>
						</div>
						<div class="cntBx tab-post">
							<div class="cnt">
								<div class="searchWrap">
									<div class="searchBx">
										<select class="sltBx">
											<option value="#name">작성자</optoin>
											<option value="#contents">내용</optoin>
										</select>
										<input type="text" class="txtBx" placeholder="검색어 입력">
										<button type="button" class="btn-border">검색</button>
									</div>
									<div class="btnBx">
										<button type="button" class="btn-full">전체선택</button>
										<button type="button" class="btn-border">삭제</button>
									</div>
								</div>
								<ul class="itemWrap">
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>1</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>2</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>3</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
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
						<div class="cntBx tab-playlist">
							<div class="cnt">
								<div class="btnWrap">
									<button type="button" class="btn-full">전체선택</button>
									<button type="button" class="btn-border">삭제</button>
								</div>
								<ul class="itemWrap">
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>1</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-27 18:11</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>2</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-26 15:13</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>3</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-25 06:55</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dimmed" onclick="popAlertCheckHide()"></div>
	<div class="dimmed" onclick="popDeleteUserHide();"></div>

	<!-- [D] 팝업 중복확인 -->
	<div class="popup pop-alert-check"><%@ include file="../popup/pop-alert-check.jsp" %></div>
	<!-- [D] 팝업 회원 탈퇴 -->
	<div class="popup pop-delete-user"><%@ include file="../popup/pop-delete-user.jsp" %></div>
	
</body>
</html>
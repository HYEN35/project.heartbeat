<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrap">
	<div class="topArea">
		<div class="title">
			<p>포스트 쓰기</p>
			<p class="artiName">Newjeans</p>
		</div>
		<button type="button" class="btn-i-close" onclick="popPostHide();"></button>
	</div>
	<div class="cntArea">
		<form action="" method="post" autocomplete="off">
			<textarea class="txtBx"></textarea>
			<div class="btmBx">
				<div class="imgBx">
					<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif" hidden multiple>
					<button type="button" class="btn-under" onclick="$('#file').click();">첨부파일 선택</button>
					<div class="fileName"></div>
				</div>
				<button type="submit" class="btn-full">등록</button>
			</div>
		</form>
	</div>
</div>
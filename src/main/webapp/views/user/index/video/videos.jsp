<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Videos</title>
<%@ include file="/common/head_foot/head.jsp"%>

</head>
<body>

	<%@ include file="/common/head_foot/header.jsp"%>
	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<div class="col-12 d-flex justify-content-end align-items-center ">
				<form action="" class="tm-text-primary">
					Page <input type="text" value="1" size="1"
						class="tm-input-paging tm-text-primary"> of 1
				</form>
			</div>
			<h2 class="mt-2 col-12 tm-text-primary text-dark">
				<i class="fas fal fa-list"></i> Danh mục Video
			</h2>
		</div>
		<!-- row -->
		<div class="row">
			<!--tm-mb-90 tm-gallery-->
			<c:forEach var="item" items="${videos}">
				<%@ include file="/common/item/content.jsp"%>
			</c:forEach>
		</div>
		<!-- row -->

		<%@ include file="/common/head_foot/paging.jsp"%>
	</div>
	<%@ include file="/common/head_foot/footer.jsp"%>
	<script src="<c:url value='/templates/user/js/plugins.js'/>"></script>
	<script>
		$(window).on("load", function() {
			$('body').addClass('loaded');
		});

		$(function() {
			/************** Video background *********/

			function setVideoSize() {
				const vidWidth = 1280;
				const vidHeight = 720;
				const maxVidHeight = 400;
				let windowWidth = window.innerWidth;
				let newVidWidth = windowWidth;
				let newVidHeight = windowWidth * vidHeight / vidWidth;
				let marginLeft = 0;
				let marginTop = 0;

				if (newVidHeight < maxVidHeight) {
					newVidHeight = maxVidHeight;
					newVidWidth = newVidHeight * vidWidth / vidHeight;
				}

				if (newVidWidth > windowWidth) {
					marginLeft = -((newVidWidth - windowWidth) / 2);
				}

				if (newVidHeight > maxVidHeight) {
					marginTop = -((newVidHeight - $('#tm-video-container')
							.height()) / 2);
				}

				const tmVideo = $('#tm-video');

				tmVideo.css('width', newVidWidth);
				tmVideo.css('height', newVidHeight);
				tmVideo.css('margin-left', marginLeft);
				tmVideo.css('margin-top', marginTop);
			}

			setVideoSize();

			// Set video background size based on window size
			let timeout;
			window.onresize = function() {
				clearTimeout(timeout);
				timeout = setTimeout(setVideoSize, 100);
			};

			// Play/Pause button for video background      
			const btn = $("#tm-video-control-button");

			btn.on("click", function(e) {
				const video = document.getElementById("tm-video");
				$(this).removeClass();

				if (video.paused) {
					video.play();
					$(this).addClass("fas fa-pause");
				} else {
					video.pause();
					$(this).addClass("fas fa-play");
				}
			});
		});
	</script>
</body>
</html>
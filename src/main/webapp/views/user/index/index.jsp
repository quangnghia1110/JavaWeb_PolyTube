<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
<%@ include file="/common/head_foot/head.jsp"%>
</head>
<body>
	<%@ include file="/common/head_foot/header.jsp"%>
	<div class="container-fluid tm-container-content mt-3 ps-3">
		<!-- Video new -->
		<div class="row mb-1">
			<h2 class="mt-1 col-12 tm-text-primary text-dark">
				<i class="fas fad fa-video"></i> Video mới nhất
			</h2>
		</div>
		<!-- row -->
		<div class="row">
			<!--tm-mb-90 tm-gallery-->
			<c:forEach var="item" items="${video1}">
				<%@ include file="/common/item/content.jsp"%>

			</c:forEach>
			<div class="text-center">
				<a class="btn btn-primary" href="/ASM_Java4/videos">Xem Thêm</a>
			</div>
		</div>
		<!-- Video được xem nhiều -->
		<div class="row mb-4">
			<h2 class="col-6 text-dark">
				<i class="fas fad fa-chart-line"></i> Video nhiều lượt xem nhất
			</h2>
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach var="item" items="${video2}">
				<%@ include file="/common/item/content.jsp"%>

			</c:forEach>
			<div class="text-center">
				<a class="btn btn-primary" href="/ASM_Java4/videos">Xem Thêm</a>
			</div>
		</div>
		<!-- Video yêu thích -->
		<div class="row mb-4" ${hidden}>
			<h2 class="col-6 text-dark">
				<a href="/ASM_Java4/like-video" class="tm-dtn1"> <i
					class="fas far fa-thumbs-up"></i> Video đã thích
				</a>
			</h2>
		</div>
		<div class="row tm-mb-90 tm-gallery" ${hidden}>
			<c:forEach var="item" items="${video3}" varStatus="loopStatus">
        		<c:if test="${loopStatus.index < 4}">
           			<%@ include file="/common/item/content.jsp"%>
        		</c:if>
    		</c:forEach>
			<div class="text-center">
				<a class="btn btn-primary bg-danger" href="/ASM_Java4/like-video">Xem
					Thêm</a>
			</div>
		</div>
		<!-- Video đã chia sẻ -->
		<div class="row mb-4" ${hidden}>
			<h2 class="col-6 text-dark">
				<a href="/ASM_Java4/video-share" class="tm-dtn1"> <i
					class="fas fad fa-share-square"></i> Video đã chia sẻ
				</a>
			</h2>

		</div>
		<div class="row tm-mb-90 tm-gallery" ${hidden}>
			<c:forEach var="item" items="${video4}" varStatus="loopStatus">
        		<c:if test="${loopStatus.index < 4}">
           			<%@ include file="/common/item/content.jsp"%>
        		</c:if>
    		</c:forEach>
			<div class="text-center">
				<a class="btn btn-primary bg-danger" href="/ASM_Java4/share-video">Xem
					Thêm</a>
			</div>
		</div>
		<!-- row -->
	</div>
	<%@ include file="/common/head_foot/footer.jsp"%>
</body>
</html>
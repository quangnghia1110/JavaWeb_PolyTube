<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>PolyTube | CẬP NHẬT VIDEO</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value='/templates/admin/css/styles.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/templates/admin/css/my-style.css'/>"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@include file="/common/head_foot/header_admin.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">CẬP NHẬT VIDEO</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a style="text-decoration: none"
						href="/ASM_Java4/admin/index">Trang chủ</a></li>
					<li class="breadcrumb-item active">Cập nhật video</li>
				</ol>
				<div class="card mb-4">
					<form ${hidden} class="mt-3 ms-3 me-3 mb-3 row"
						action="/ASM_Java4/admin/video-update" method="post"
						enctype="multipart/form-data">
						<div class="col-6">
							<div class="mb-3">
								<label for="youtubeID" class="form-label">Video ID*</label> <input
									name="id" type="text" class="form-control" id="youtubeID"
									aria-describedby="youtubeIDHelp" value="${video.id}" ${videoid}
									${videoid2} placeholder="Nhập Video Id của bạn?"
									required="required">
							</div>
							<h6 class="ms-3 text-primary">${message6}</h6>
							<div class="mb-3">
								<label for="youtubeID" class="form-label">Tiêu đề video*</label>
								<input name="title" type="text" class="form-control"
									id="youtubeID" aria-describedby="youtubeIDHelp"
									value="${video.title}" placeholder="Nhập title của video?"
									required="required">
							</div>
							<div class="mb-3" hidden>
								<label for="youtubeID" class="form-label">Tổng lượt xem*</label>
								<input type="text" class="form-control" id="youtubeID"
									aria-describedby="youtubeIDHelp" value="${video.views}"
									name="views">
							</div>
							<div class="mb-3">
								<label for="videoDTN" class="form-label">Video Href*</label> <input
									name="href" type="text" class="form-control" id="videoDTN"
									aria-describedby="videoDTNHelp" value="${video.href}"
									placeholder="Nhập VideoId Youtube bạn muốn đăng?"
									required="required">
							</div>
							<div class="mb-3">
								<label for="moTa" class="form-label">Mô Tả*</label>
								<textarea name="discriptions" class="form-control" id="moTa"
									rows="3" placeholder="Nhập mô tả?" required="required">${video.discriptions}</textarea>
							</div>
							<div class="mb-3">
								<input type="text" class="form-control" type="text" id="youtubeUrl" placeholder="Nhập liên kết YouTube..." oninput="displayData()"/>
								<label style="margin:10px 50px 0 10px;"class="form-label" id="videoId"></label> 
  								<label style="margin:10px 0 0 50px" class="form-label" id="thumbnailLink"></label>
							</div>
							
						</div>

						<div class="col-6">
							<div class="card mt-4">
								<div class="mt-2 mb-2 p-2">
									<img src="<c:url value='${img.poster}'/>"
										class="card-img-top img-fluid" width="300px" height="100px"
										alt="Poster video" ${log2img}> <input accept="image/*"
										class="mt-2 form-control form-control-sm" id="formFileSm"
										type="file" name="photo_file">
								</div>
							</div>
						</div>
						
						<div style="margin:20px 0px 0px 0px;" class="text-end" ${hidden}>
							<button type="submit" class="btn btn-primary"
								formaction="/ASM_Java4/admin/video-update/create" ${log_btnThem}>Thêm</button>
							<button type="submit" class="btn btn-success"
								formaction="/ASM_Java4/admin/video-update/update" ${log_btn}>Sửa</button>
							<button type="submit" class="btn btn-danger" ${log_btn}
								${buttonxoa} formaction="/ASM_Java4/admin/video-update/delete">Xóa</button>
							<a class="btn btn-dark"
								href="/ASM_Java4/video-detail/id/${video.id}" ${log_btn}>Xem
								Video</a>
						</div>
					</form>
					<h6 class="ms-3 text-primary">${message}</h6>
				</div>
			</div>
		</main>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function displayData() {
	      const url = document.getElementById('youtubeUrl').value;
	      const videoId = url.match(/(?:\?v=|\/embed\/|\/\d+\/|\/vi\/)([^#\&\?]*).*/)?.[1];
	      const thumbnailUrl = videoId ? "https://img.youtube.com/vi/" + videoId + "/maxresdefault.jpg" : null;

	      document.getElementById('videoId').innerText = videoId ? 'Video Href: ' + videoId : 'Không tìm thấy Video ID.';
	      document.getElementById('thumbnailLink').innerHTML = thumbnailUrl ? '<a href="' + thumbnailUrl + '" target="_blank">Link ảnh</a>' : '';
	    }

	</script>
</body>
</html>

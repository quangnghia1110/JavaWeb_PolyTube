<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>PolyTube | DANH SÁCH VIDEO</title>
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
				<h1 class="mt-4">Danh sách Video</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a style="text-decoration: none"href="/ASM_Java4/admin/index">Trang
							chủ</a></li>
					<li class="breadcrumb-item active">Danh sách Video</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> BẢNG DANH SÁCH VIDEO
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th class="table-cell">ID</th>
									<th class="table-cell">Tiêu đề Video</th>
									<th class="table-cell">Poster</th>
									<th class="table-cell">Video</th>
									<th class="table-cell">Mô tả</th>
									<th class="table-cell">Views</th>
									<th class="table-cell">Action</th>
									<th class="table-cell"></th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="item" items="${videos}">
									<tr>
										<td class="table-cell">${item.id}</td>
										<td class="table-cell">${item.title}</td>
										<td class="table-cell">
                							<img src="<c:url value='${item.poster}'/>" class="card-img-top img-fluid" width="300px" height="100px" alt="Poster video" />
            							</td>
										<td class="table-cell">
											<a href="/ASM_Java4/video-detail/id/${item.id}">${item.href}</a>
										</td>
										<td class="table-cell">${item.discriptions}</td>
										<td class="table-cell">${item.views}</td>
										<td class="table-cell"><a class="btn btn-success"
											href="/ASM_Java4/admin/video-update/edit/${item.id}">edit</a>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>

<style>
  .table-cell {
    width: 20%; /* Đặt chiều rộng mong muốn cho các cột, ở đây là 20% */
    padding: 10px; /* Tuỳ chỉnh padding để cách biệt các ô */
  }
</style>


</body>
</html>

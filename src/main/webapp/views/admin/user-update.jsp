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
<title>PolyTube | CẬP NHẬT NGƯỜI DÙNG</title>
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
				<h1 class="mt-4">CẬP NHẬT NGƯỜI DÙNG</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a style="text-decoration: none" href="/ASM_Java4/admin/index">Trang
							chủ</a></li>
					<li class="breadcrumb-item active">Cập nhật người dùng</li>
				</ol>
				<div class="card mb-4">
					<form class="mt-3 ms-3 me-3 mb-3"
						action="/ASM_Java4/admin/user-update/create" method="post">
						<div class="mb-3" ${hidden}>
							<label for="exampleInputUsername" class="form-label">Tên
								tài khoản*</label> <input placeholder="Username?" name="id" type="text"
								class="form-control" id="exampleInputUsername"
								aria-describedby="usernameHelp" value="${u.id}" ${loguser}
								required="required">
						</div>
						<h6 class="ms-3 text-primary">${message1}</h6>
						<div class="mb-3" ${hidden}>
							<label for="exampleInputFullname" class="form-label">Họ
								tên*</label> <input placeholder="Fullname?" name="fullname" type="text"
								class="form-control" id="exampleInputFullname"
								aria-describedby="fullnameHelp" value="${u.fullname}"
								required="required">
						</div>
						<div class="mb-3" ${buttonnolog}>
							<label for="exampleInputPassword1" class="form-label">Mật
								khẩu*</label> <input placeholder="Password?" name="password"
								type="password" class="form-control" id="exampleInputPassword1"
								value="${u.password}" required="required">
						</div>
						<h6 class="ms-3 text-primary">${message4}</h6>
						<div class="mb-3" ${buttonnolog}>
							<label for="exampleInputPassword2" class="form-label">Nhập
								lại mật khẩu*</label> <input placeholder="Confirm password?"
								type="password" class="form-control" id="exampleInputPassword2"
								value="${u.password}" name="confirmPass" required="required">
						</div>
						<h6 class="ms-3 text-primary">${message3}</h6>
						<div class="mb-3" ${hidden}>
							<label for="exampleInputEmail1" class="form-label">Địa
								chỉ Email*</label> <input placeholder="Email ?" name="email"
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" value="${u.email}"
								required="required">
						</div>
						<h6 class="ms-3 text-primary">${message5}</h6>
						<div class="form-check form-check-inline">
  							<input ${u.admin ? 'checked' : ''} class="form-check-input" type="radio" name="admin" id="inlineRadio2" value="true">
 							 <label class="form-check-label" for="inlineRadio2">ADMIN</label>
						</div>
						<div class="form-check form-check-inline">
  							<input ${u.admin ? '' : 'checked'} class="form-check-input" type="radio" name="admin" id="inlineRadio1" value="false" required="required">
 							<label class="form-check-label" for="inlineRadio1">USER</label>
						</div>

						<div class="text-end" ${hidden}>
							<button type="submit" class="btn btn-primary"
								formaction="/ASM_Java4/admin/user-update/create" ${buttonnolog}>Thêm</button>
							<button type="submit" class="btn btn-success"
								formaction="/ASM_Java4/admin/user-update/update" ${buttonlog}>Sửa</button>
							<button type="submit" class="btn btn-danger"
								formaction="/ASM_Java4/admin/user-update/delete" ${buttonlog1}
								${buttonxoa}>Xóa</button>
						</div>
					</form>
					<h6 class="ms-3 text-primary">${message}</h6>
				</div>
			</div>
		</main>
	</div>
	</div>
</body>
</html>

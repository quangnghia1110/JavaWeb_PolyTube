<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="loader-wrapper">
	<div id="loader"></div>
	<div class="loader-section section-left"></div>
	<div class="loader-section section-right"></div>
</div>

<!-- The navigation bar -->
<nav class="navbar navbar-expand-lg nav-dtn">
	<div class="container-fluid">
		<a class="navbar-brand ps-3" href="/ASM_Java4/index">PolyTube</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0 navbar-color">
				<li id="nav-item" class="nav-item"><a class="nav-link nav-link-1"
					aria-current="page" href="/ASM_Java4/index">Trang chủ</a></li>
				<li id="nav-item"class="nav-item"><a class="nav-link nav-link-1"
					href="/ASM_Java4/videos">Video</a></li>
				<li id="nav-item"class="nav-item"><a class="nav-link nav-link-1"
					href="/ASM_Java4/about">Giới thiệu</a></li>
				<li id="nav-item"class="nav-item"><a class="nav-link nav-link-1"
					href="/ASM_Java4/contact">Liên hệ - Góp ý</a></li>
				<li id="nav-item" class="nav-item dropdown"><a
					class="nav-link nav-link-1 dropdown-toggle" href="#" id="taiKhoan"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${account} </a>
					<ul class="dropdown-menu dmenu-design" aria-labelledby="taiKhoan">
						<li><a class="dropdown-item" href="/ASM_Java4/login"
							${login_pass}>Đăng nhập</a></li>
						<li><a class="dropdown-item" href="/ASM_Java4/register"
							${login_pass}>Đăng ký</a></li>
						<li><a class="dropdown-item" href="/ASM_Java4/logout"
							${login_no}>Đăng xuất</a></li>
						<li><hr class="dropdown-divider" ${login_no}></li>
						<li><a class="dropdown-item" href="/ASM_Java4/changePassword"
							${login_no}>Đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="/ASM_Java4/forgotPassword"
							${login_pass}>Quên mật khẩu</a></li>
						<li><a class="dropdown-item" href="/ASM_Java4/editAccount"
							${login_no}>Sửa tài khoản</a></li>
						<li><hr class="dropdown-divider" ${login_admin}></li>
						<li><a class="dropdown-item" href="/ASM_Java4/admin/index"
							${login_admin}>Giao diện Admin</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>

<div class="tm-hero d-flex justify-content-center align-items-center"
	data-parallax="scroll"
	data-image-src="<c:url value='/templates/user/img/bg88.jpg'/>">
	<form class="d-flex tm-search-form">
		<input class="form-control tm-search-input" type="search"
			placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-primary tm-search-btn" type="submit">
			<i class="fas fa-search"></i>
		</button>
	</form>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script> -->
<!-- //   $(document).ready(function() { -->
<!-- //     var currentPath = window.location.pathname; -->
<!-- //     console.log("Current Path:", currentPath); -->

<!-- //     $(".nav-item").each(function() { -->
<!-- //       var link = $(this).find("a").attr("href"); -->
<!-- //       console.log("Link:", link); -->

<!-- //       if (currentPath === link) { -->
<!-- //         $(this).addClass("active"); -->
<!-- //       } else { -->
<!-- //         $(this).removeClass("active"); -->
<!-- //       } -->
<!-- //     }); -->
<!-- //   }); -->
<!-- </script> -->



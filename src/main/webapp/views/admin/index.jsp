<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>PolyTube | TRANG CHỦ</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<c:url value='/templates/admin/css/styles.css'/>" rel="stylesheet" />
    <link href="<c:url value='/templates/admin/css/my-style.css'/>" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    	<%@include file="/common/head_foot/header_admin.jsp"%>
    
        <div id="layoutSidenav_content">
        <form action="/ASM_Java4/admin/index" method="post">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">BÁO CÁO - THỐNG KÊ</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Báo cáo - Thống kê</li>
                    </ol>
                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-primary text-white mb-4">
                                <div class="card-body">Tổng số người dùng</div>
                                <h2 class="ms-3">${countUser}<i class="fas fad fa-user float-end me-2"></i></h2>                              
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body">Tổng số Video</div>
                                <h2 class="ms-3">${countVideo}<i class="fas fad fa-video float-end me-2"></i></h2> 
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-success text-white mb-4">
                                <div class="card-body">Tổng lượt xem</div>
                                <h2 class="ms-3">${countViews}<i class="fas fad fa-eye float-end me-2"></i></h2> 
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card bg-danger text-white mb-4">
                                <div class="card-body">Tổng lượt thích</div>
                                <h2 class="ms-3">${countLike}<i class="fas fad fa-heart float-end me-2"></i></h2> 
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
						  <li class="nav-item" role="presentation">
						    <button class="nav-link ${ms1}" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">FAVORITES</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link ${ms2}" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">FAVORITES USERS</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link ${ms3}" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">SHARE FRIENDS</button>
						  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
						<!--Favorites-->
						  <div class="tab-pane fade ${message} mt-2 p-3" id="home" role="tabpanel" aria-labelledby="home-tab">
						  	<table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Video Title</th>
                                        <th>Favorite Count</th>
                                        <th>Latest Date</th>
                                        <th>Oldest Date</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                         <th>Video Title</th>
                                        <th>Favorite Count</th>
                                        <th>Latest Date</th>
                                        <th>Oldest Date</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                	<c:forEach var="item" items="${videos}">
										<tr>
											<td>${item.group}</td>
											<td>${item.likes}</td>
											<td>
											<fmt:formatDate value="${item.newest}" pattern="dd-MM-yyyy"/>
											</td>
											<td>
											<fmt:formatDate value="${item.oldest}" pattern="dd-MM-yyyy" />
											</td>
										</tr>
									</c:forEach>
                                </tbody>
                            </table>
						  </div>
						 <!--Favorites-->
						 <!--Favorites User-->
						  <div class="tab-pane fade ${message1} mt-2 p-3" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						  	<div class="row">
						  		<h4 class="col-2">Video Title?</h4>
						  		<select name="title1" class="col-8 form-select pe-2" aria-label="Default select example" style="width: 70%;">
								  <option selected></option>
								<c:forEach var="sel1" items="${sel1}">
									  <option value="${sel1}">${sel1}</option>
								</c:forEach>
								</select>
								<button type="submit" class="ms-1 col-2 btn btn-primary" formaction="/ASM_Java4/admin/index/report1"style="width: 80px;">Tìm</button>
						  	</div>
						  	<table class="table mt-2 table-bordered">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Email</th>
                                        <th>Favorite Date</th>
                                        <th>Video Like</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="user" items="${user}">
	                                	<tr>
	                                        <td>${user.user.id}</td>
	                                        <td>${user.user.fullname}</td>
	                                        <td>${user.user.email}</td>
	                                        <td>${user.likeDate}</td>
	                                        <td>${user.video.id}</td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
						  </div>
						  <!--Favorites User-->
						  <!--Share Friends-->
						  <div class="tab-pane fade ${message2} mt-2 p-3" id="contact" role="tabpanel" aria-labelledby="contact-tab">
						  	<div class="row">
						  		<h4 class="col-2">Video Title?</h4>
						  		<select name="title2" class="col-8 form-select pe-2" aria-label="Default select example" style="width: 70%;">
								  <option selected></option>
									<c:forEach var="sel1" items="${sel1}">
										  <option value="${sel1}">${sel1}</option>
									</c:forEach>
								</select>
								<button type="submit" class="ms-1 col-2 btn btn-primary" formaction="/ASM_Java4/admin/index/report2"style="width: 80px;">Tìm</button>
						  	</div>
						  	<table class="table mt-2 table-bordered">
                                <thead>
                                    <tr>
                                        <th>Sender Name</th>
                                        <th>Sender Email</th>
                                        <th>Receiver Email</th>
                                        <th>Sent Date</th>
                                        <th>Video Share</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="sha" items="${share}">
                                		<tr>
	                                        <td>${sha.user.fullname}</td>
	                                       	<td>${sha.user.email}</td>
	                                        <td>${sha.email}</td>
	                                       	<td>
	                                       		<fmt:formatDate value="${sha.shareDate}" pattern="dd-MM-yyyy"/>
	                                       	</td>
	                                       	<td>${sha.video.id}</td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
						  </div>
						  <!--Share Friends-->
						</div>
                    </div>
                </div>
            </main>
            </form>
        </div>
</body>

</html>

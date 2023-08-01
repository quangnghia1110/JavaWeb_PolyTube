<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PolyTube | DANH SÁCH NGƯỜI DÙNG</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<c:url value='/templates/admin/css/styles.css'/>" rel="stylesheet" />
          <link href="<c:url value='/templates/admin/css/my-style.css'/>" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="/common/head_foot/header_admin.jsp" %>
       
       
       
       
       
       
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">DANH SÁCH NGƯỜI DÙNG</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a style="text-decoration: none" href="/ASM_Java4/admin/index">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Danh sách người dùng</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                          BẢNG DANH SÁCH NGƯỜI DÙNG
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Tên tài khoản</th>
                                        <th>Họ tên</th>
                                        <th>Email</th>
                                        <th>Phân quyền</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${users}">
                                	<tr>
                                        <td>${item.id}</td>
                                        <td>${item.fullname}</td>
                                        <td>${item.email}</td>
                                        <td>${item.admin?'Admin':'User'}</td>
                                        <td><a class="btn btn-success" href="/ASM_Java4/admin/user-update/edit/${item.id}">edit</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>

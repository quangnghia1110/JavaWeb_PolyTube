<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
    <title>Đăng ký</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value='/templates/login/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/login/css/my-style.css'/>">
    <style type="text/css">
        body {
            background-image: url(<c:url value='/templates/user/img/anh2.png'/>);
            background-repeat: no-repeat;
            background-size: 100%;
        }

        .heading-section {
            font-size: 40px;
        }
    </style>
</head>

<body class="img js-fullheight">
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <form action="/ASM_Java4/register" class="signin-form" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username" name="id" required>
                            </div>
                            <h6 class="ms-2 text-white">${message1}${message2}</h6>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Fullname" name="fullname" required>
                            </div>
                            <div class="form-group">
                                <input id="password-field" type="password" class="form-control" placeholder="Password" name="password"
                                    required> <span toggle="#password-field"
                                    class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
							<h6 class="ms-2 text-white">${message4}</h6>
                            <div class="form-group">
                                <input id="password-field-cofirm" type="password" class="form-control"
                                    placeholder="Confirm Password" name="confirmPass"required> <span toggle="#password-field-cofirm"
                                    class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                             <h6 class="ms-2 text-white">${message3}</h6>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Email" name="email" required>
                            </div>
                            <h6 class="ms-2 text-white">${message5}</h6>
                            <input name="admin" type="hidden" value="false">
                            <div class="form-group">
                                <button type="submit"
									class="form-control btn submit px-3 dtn-btn" formaction="/ASM_Java4/register">Đăng ký</button>                  
                            </div>
                 	</form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="<c:url value='/templates/login/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/templates/login/js/popper.js'/>"></script>
    <script src="<c:url value='/templates/login/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/templates/login/js/main.js'/>" /></script>
    <script src="<c:url value='/templates/user/js/plugins.js'/>"></script>
    <script>
        $(window).on("load", function () {
            $('body').addClass('loaded');
        });
    </script>

</body>

</html>


















































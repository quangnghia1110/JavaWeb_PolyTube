<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <%@ include file="/common/head_foot/head.jsp" %>
</head>
<body>
    <%@ include file="/common/head_foot/header.jsp" %>
	<div class="container-fluid tm-mt-60">
	<div class="row tm-mb-50">
		<div class="col-lg-4 col-12 mb-5">
			<h2 class="tm-text-primary mb-5">GÓP Ý</h2>
			<form id="contact-form" action="/ASM_Java4/contact" method="POST"
				class="tm-contact-form mx-auto">
				<div class="form-group">
					<input type="text" name="id" class="form-control rounded-0"
						placeholder="Name" required />
				</div>
				<h6 class="text-red ">${message}</h6>
				<div class="form-group">
                    <input type="text" class="form-control" name="email" placeholder="Email" required>
                </div>
				<h6 class="text-red ">${message5}</h6>
				<div class="form-group">
					<textarea rows="8" name="message" class="form-control rounded-0"
						placeholder="Message" required=></textarea>
				</div>

				<div class="form-group tm-text-right">
					<button type="submit" class="btn btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-lg-4 col-12 mb-5">
			<div class="tm-address-col">
				<h2 class="tm-text-primary mb-5">Liên hệ</h2>
				<p class="tm-mb-50">Mọi thông tin yêu cầu và đóng góp ý kiến xin
					vui lòng liên hệ:</p>
				<address class="tm-text-gray tm-mb-50">Văn Phòng: Số 1, Võ Văn Ngân, Phường Linh Chiểu, Thành phố Thủ Đức</address>
				<ul class="tm-contacts">
					<li><a href="#" class="tm-text-gray"> <i
							class="fas fa-envelope"></i>Email: 21110559@student.hcmute.com
					</a></li>
					<li><a href="#" class="tm-text-gray"> <i
							class="fas fa-phone"></i> Tel: 0974117373
					</a></li>
				</ul>
			</div>
		</div>
		<div class="col-lg-4 col-12">
			<h2 class="tm-text-primary mb-5">Địa chỉ</h2>
			<!-- Map -->
			<div class="mapouter mb-4">
				<div class="gmap-canvas">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8943.038882372884!2d106.7690653444354!3d10.850835069587758!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1690690722652!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</div>
	<div class="row tm-mb-74 tm-people-row">
	<h2 class="tm-text-primary mb-5"><i class="fab fa-teamspeak"></i> NHÓM HỖ TRỢ</h2>
		<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5 text-center">
			<img src="<c:url value='templates/user/img/poly.jpg'/>"
				alt="Image" class="mb-4 w-50 img-fluid">
			<h2 class="tm-text-primary text-dtn mb-4">Ngô Quang Nghĩa</h2>
			<h3 class="tm-text-secondary h5 mb-4">Trưởng Nhóm</h3>
			<ul class="tm-social pl-0 mb-0 justify-content-center ">
				<li><a href="https://www.facebook.com/quangnghia559/"><i
						class="fab fa-facebook"></i></a></li>
				<li><a href="https://github.com/quangnghia1110"><i class="fab fa-github"></i></a></li>
				<li><a href="https://www.linkedin.com/in/ngh%C4%A9a-ng%C3%B4-quang-62739024b/"><i
						class="fab fa-linkedin"></i></a></li>
			</ul>
		</div>
	</div>
</div>
    <%@ include file="/common/head_foot/footer.jsp" %>
</body>
</html>
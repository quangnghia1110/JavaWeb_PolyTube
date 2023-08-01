<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/head_foot/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video đã chia sẻ</title>
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
				<i class="fas far fa-thumbs-up"></i> Video đã chia sẻ
			</h2>
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach var="item" items="${shares}">
				<%@ include file="/common/item/content.jsp"%>
			</c:forEach>
		</div>
		<%@ include file="/common/head_foot/paging.jsp"%>
	</div>
	<%@ include file="/common/head_foot/footer.jsp"%>
</body>
</html>
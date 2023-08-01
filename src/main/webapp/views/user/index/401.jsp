<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

/* CSS which you need for blurred box */
body {
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-position: top;
	background-image: url(http://bit.ly/2gPLxZ4);
	width: 100%;
	height: 100%;
	font-family: Arial, Helvetica;
	letter-spacing: 0.02em;
	font-weight: 400;
	-webkit-font-smoothing: antialiased;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.blurred-box {
	position: relative;
	width: 250px;
	height: 350px;
	top: calc(50% - 175px);
	left: calc(50% - 125px);
	background: inherit;
	border-radius: 2px;
	overflow: hidden;
}

.blurred-box:after {
	content: '';
	width: 300px;
	height: 300px;
	background: inherit;
	position: absolute;
	left: -25px; left position right : 0;
	top: -25px; top position bottom : 0;
	box-shadow: inset 0 0 0 200px rgba(255, 255, 255, 0.05);
	filter: blur(10px);
}

.btn1 {
	text-align: center;
}

.text {
	text-align: center;
	font-size: 30px;
	margin-bottom: 40px;
	color: #cccccc;
}

.texts {
	text-align: center;
	font-size: 60px; /* Increase font size to 24px */
	margin-bottom: 40px;
	font-weight: bold; /* Make the text bold */
	color: red;
}

.error {
	font-family: 'Roboto', sans-serif;
	font-size: 1.5rem;
	text-decoration: none;
	padding: 15px;
	background: #6200ee;
	color: #fff;
	border-radius: 10px;
}
</style>
</head>
<body>
	<h1 class="texts">Error 401 - Unauthorized</h1>
	<p class="text">Please check that the Web site is logged in</p>
	<div class="btn1">
		<a class="error" href="/ASM_Java4/index">Go to Homepage</a>
	</div>
</body>
</html>

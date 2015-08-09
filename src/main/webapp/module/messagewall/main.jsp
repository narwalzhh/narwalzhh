<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="narwal,narwalzhh,服务器,maven,ubuntu,linux,编程,java,android,开发,火影忍者,server，svn，git">
<meta name="description" content="narwal的个人网站，好的东西要与人分享">
<title>narwal个人网站主页</title>

<link href="../../refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../../refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	/* padding-top: 70px; */
	padding-bottom: 50px;
}

.change-bg-color {
	height: 90px;
	background-color: #bce8f1;
	color: #bce8f1;
}


.messagewall-show {
	border: 0px;
	width: 100%;
	height: 900px;
}


</style>

<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>

</head>
<body>
	<div class="messagewall-container">
		<iframe class="messagewall-show" src="messagecontent.jsp"></iframe>
	</div>
	<!-- blog的导航条 -->
	<nav class="navbar navbar-default navbar-fixed-bottom panel-info change-bg-color">
	<div class="container">
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=contextPath %>/index.jsp" >
					<!-- 返回主页图标 -->
					<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 返回主页</span>
				</a></li>
			</ul>
			
			<form class="navbar-form navbar-left make-center">
				<div class="form-group">
					<label class="sr-only" for="">昵称
						</label> <input type="text" class="form-control"
						id="" placeholder="昵称">
				</div>
				<div class="form-group">
					<label class="sr-only" for="">留言内容</label>
					<input type="password" class="form-control"
						id="" placeholder="内容">
				</div>
				<button type="submit" class="btn btn-default">留言</button>
			</form>
			
			<ul class="nav navbar-nav ">
				<li><a href="" >
					<!-- 返回主页图标 -->
					<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
 %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="narwal,narwalzhh,服务器,maven,ubuntu,linux,编程,java,android,开发,火影忍者,server，svn，git">
<meta name="description" content="narwal的个人网站，好的东西要与人分享">
<title>narwal错误页面</title>

<link rel="shortcut icon" href="<%=contextPath %>/refs/images/favicon.ico" type="image/x-icon" />

<link href="<%=contextPath %>/refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=contextPath %>/refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	/* padding-bottom: 50px; */
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	});
</script>

</head>
<body>
	<!-- blog的导航条 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=contextPath %>/index.jsp">narwal</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=contextPath %>/module/programming/main.jsp">编程</a></li>
				<li><a href="<%=contextPath %>/module/messagewall/main.jsp">留言墙</a></li>
				<li><a href="<%=contextPath %>/module/littlestuff/main.jsp">小玩意</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">其他 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath %>/module/reading/main.jsp">读书</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath %>/module/music/main.jsp">音乐</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath %>/module/video/main.jsp">视频</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath %>/module/comic/main.jsp">动漫</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=contextPath %>/login.jsp" id="loginBtn">
					<span class="glyphicon glyphicon glyphicon-log-in" aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- blog主页主体 -->
	<div class="container">
		<!-- 第一条水平分割线 -->
		<hr/>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-danger">
					<div class="panel-body">
						<div class="alert alert-danger" role="alert">OPPS：客官您访问的页面不存在，去其他模块转转呗...</div>
						<center><img src="<%=contextPath %>/refs/images/error-opps.gif" alt="error-opps" class="img-thumbnail"></center>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		
	</div>
		
	<script src="<%=contextPath %>/refs/jsutils/jquery.min.js"></script>
	<script src="<%=contextPath %>/refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
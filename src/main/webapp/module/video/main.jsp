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
<title>视频模块</title>

<link rel="shortcut icon" href="../../refs/images/favicon.ico" type="image/x-icon" />

<link href="../../refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../../refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 50px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		//定义json文件中的数据，在界面开始的时候自动加载
		var jsonUrl = "<%=contextPath%>/json/video.json";
		//alert(jsonUrl + "------------");
		$.getJSON(jsonUrl, function(data) {
			var readingMainContent = $("#videoMainContent");
			var toBeAppended = "";
			readingMainContent.empty();
			$.each(data, function(index, element) {
				toBeAppended += '<div class="row"><div class="col-md-3">';
				toBeAppended += '<img src="'+ element["imgurl"] +'"  width="200px;" alt="'+ element["bookname"] +'" class="img-thumbnail">';
				toBeAppended += '</div>	<div class="col-md-9"><h4><cite>';
				toBeAppended += element["videoname"];
				toBeAppended += '</cite></h4><h4><small>类型：';
				toBeAppended += element["type"];
				toBeAppended += ' / 状态：';
				toBeAppended += element["state"];
				toBeAppended += '</small></h4><h5>';
				toBeAppended += element["description"];
				toBeAppended += '</h5>';
				toBeAppended += '</div></div><br/>';
			});
			readingMainContent.html(toBeAppended);
		});
		
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
			<a class="navbar-brand" href="<%=contextPath%>/index.jsp">narwal</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=contextPath%>/module/programming/main.jsp">编程</a></li>
				<li><a href="<%=contextPath%>/module/messagewall/main.jsp">留言墙</a></li>
				<li><a href="<%=contextPath%>/module/littlestuff/main.jsp">小玩意</a></li>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">其他 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath%>/module/reading/main.jsp">读书</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath%>/module/music/main.jsp">音乐</a></li>
						<li role="separator" class="divider"></li>
						<li class="active"><a href="<%=contextPath%>/module/video/main.jsp">视频</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath%>/module/comic/main.jsp">动漫</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=contextPath %>/login.jsp" data-toggle="tooltip" data-placement="bottom"
					title=""> <span class="glyphicon glyphicon glyphicon-log-in"
						aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 视频模块主体 -->
	<div class="container">
		<!-- 第一条水平线 -->
		<hr />
		<div class="row">
			<div class="col-md-3 about-author">
				<blockquote>
					<p>I'm the type of person,if you ask me a question, and I don't
						know the answer,I'm gonna to tell you that I don't know.But I bet
						you what: I know how to find the answer, and I'll find the answer.</p>
					<footer>
					<cite title="Source Title">the PURSUIT of HAPPYNESS</cite></footer>
				</blockquote>
			</div>
			<!-- 读书主体 -->
			<div class="col-md-9">
				<div class="panel panel-default">
					<div id="videoMainContent" class="panel-body">
					</div>
				</div>
			</div>
		</div>
		<!-- 第二条水平线 -->
		<hr />
		<!-- footer -->
			<footer>
			<p class="pull-right">
				&middot; <a href="http://www.bootcss.com" target="_blank">Bootstrap中文网</a>
				&middot; <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>
				&middot; <a href="https://github.com" target="_blank">Github</a>
			</p>
			<p>
				&copy; 2015 <a href="<%=contextPath%>/index.jsp">narwal</a>
			</p>
			</footer>
	</div>

		<script src="../../refs/jsutils/jquery.min.js"></script>
		<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
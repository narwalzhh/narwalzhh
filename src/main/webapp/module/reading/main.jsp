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
<title>narwal个人网站读书模块</title>

<link href="../../refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../../refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 50px;
}
.about-author img {
	height: 150px;
	width: 150px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		//定义json文件中的数据，在界面开始的时候自动加载
		var jsonUrl = "<%=contextPath%>/json/reading.json";
		//alert(jsonUrl + "------------");
		$.getJSON(jsonUrl, function(data) {
			var readingMainContent = $("#readingMainContent");
			var toBeAppended = "";
			readingMainContent.empty();
			$.each(data, function(index, element) {
				toBeAppended += '<div class="row"><div class="col-md-3">';
				toBeAppended += '<img src="'+ element["imgurl"] +'" height="160px;" width="200px;" alt="'+ element["bookname"] +'" class="img-thumbnail">';
				toBeAppended += '</div>	<div class="col-md-9"><h4><cite>';
				toBeAppended += element["bookname"];
				toBeAppended += '</cite></h4><h4><small>作者：';
				toBeAppended += element["author"];
				toBeAppended += ' / 推荐人：';
				toBeAppended += element["recommender"];
				toBeAppended += ' / 状态：';
				toBeAppended += element["state"];
				toBeAppended += '</small></h4><h5>';
				toBeAppended += element["description"];
				toBeAppended += '</h5></div></div><br/>';
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
				<li class="active"><a
					href="<%=contextPath%>/module/reading/main.jsp">读书</a></li>
				<li><a href="<%=contextPath%>/module/music/main.jsp">音乐</a></li>
				<li><a href="<%=contextPath%>/module/video/main.jsp">视频</a></li>
				<li><a href="<%=contextPath%>/module/comic/main.jsp">动漫</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" data-toggle="tooltip" data-placement="bottom"
					title=""> <span class="glyphicon glyphicon glyphicon-log-in"
						aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 读书模块主体 -->
	<div class="container">
		<!-- 第一条水平线 -->
		<hr />
		<div class="row">
			<div class="col-md-3 about-author">
				<!-- 个人标签 -->
				<img src="../../refs/images/narwal.jpg" alt="narwal"
					class="img-rounded">
				<p />
				<address>
					<strong>昵称：</strong>narwalzhh<br> <strong>星座：</strong>摩羯座
					Capricorn<br> <strong>职业：</strong>北方小镇学生程序猿<br> <strong>邮件：</strong>1577107936@qq.com<br>
				</address>
				<p />
				<blockquote>
					<p>What one describes in the books is one’s thought in his mind. The personality of a book is that of the author.</p>
				</blockquote>
			</div>
			<!-- 读书主体 -->
			<div class="col-md-9">
				<div class="panel panel-default">
					<div id="readingMainContent" class="panel-body">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String blogName = request.getParameter("blogName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>编程模块</title>

<link rel="shortcut icon" href="../../refs/images/favicon.ico" type="image/x-icon" />

<link href="../../refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../../refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 50px;
}
.about-author {
	width: 25%;
}
.about-author img {
	height: 150px;
	width: 150px;
}
.jumbotron h4 {
	margin-top: -30px;
}
.jumbotron ol {
	margin-left: -40px;
	margin-right: -40px;
	margin-bottom: -30px;
}
.panel .panel-body iframe {
	/* height: 1700px; */
	width: 100%; 
	border: 0;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#contentFrame").load(function(){
			var mainheight = $(this).contents().find("body").height()+30;
			if(mainheight < 1300) {
				$(this).height(1300);
			} else {
				$(this).height(mainheight);
			}
		});
		
		<%
			if(blogName == null) {
				blogName = "usfwqsjpgz";
			}
		%>
		var requiredBlog = "<%=blogName%>";
		var route = "details/" + requiredBlog + ".html";
		$("#contentFrame").attr("src", route);
		
		var jsonUrl = "<%=contextPath%>/json/programming.json";
		$.getJSON(jsonUrl, function(data) {
			var fwqBlog = $("#fwqBlog");
			var bcBlog = $("#bcBlog");
			var qtBlog = $("#qtBlog");
			var toBeAppendedAboutFwq = "";
			var toBeAppendedAboutBc = "";
			var toBeAppendedAboutQt = "";
			fwqBlog.empty();
			bcBlog.empty();
			qtBlog.empty();
			$.each(data, function(index, element) {
				if(element["belongto"] == "fwqxg") {
					toBeAppendedAboutFwq += '<li><a href="'+ element["hrefurl"] +'" target="details">';
					toBeAppendedAboutFwq += element["blogname"];
					toBeAppendedAboutFwq += '</a></li>';
				} else if(element["belongto"] == "bcxg") {
					toBeAppendedAboutBc += '<li><a href="'+ element["hrefurl"] +'" target="details">';
					toBeAppendedAboutBc += element["blogname"];
					toBeAppendedAboutBc += '</a></li>';
				} else {
					toBeAppendedAboutQt += '<li><a href="'+ element["hrefurl"] +'" target="details">';
					toBeAppendedAboutQt += element["blogname"];
					toBeAppendedAboutQt += '</a></li>';
				}
			});
			fwqBlog.html(toBeAppendedAboutFwq);
			bcBlog.html(toBeAppendedAboutBc);
			qtBlog.html(toBeAppendedAboutQt);
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
					<li class="active"><a href="<%=contextPath%>/module/programming/main.jsp">编程</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">留言 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath %>/module/message/main.jsp">留言墙</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath %>/module/message/messagepanel.jsp">留言板</a></li>
					</ul>
					</li>
					<li><a href="<%=contextPath%>/module/littlestuff/main.jsp">小玩意</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">其他 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=contextPath%>/module/reading/main.jsp">读书</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=contextPath%>/module/music/main.jsp">音乐</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=contextPath%>/module/video/main.jsp">视频</a></li>
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
	<!-- 编程模块主体 -->
	<div class="container">
		<!-- 编程模块第一个水平线条 -->
		<div class="alert alert-warning" role="alert"><strong>文章持续更新中，还请客官您小小的关注下...</strong></div>
		<hr/>
		<!-- 编程模块具体实现 -->
		<div class="row">
			<div class="col-md-3 about-author">
				<!-- 个人标签 -->
				<img src="../../refs/images/narwal.jpg" alt="narwal" class="img-rounded">
				<p/>
				<address>
					<strong>昵称：</strong>narwalzhh<br>
					<strong>星座：</strong>摩羯座 Capricorn<br>
					<strong>职业：</strong>北方小镇学生程序猿<br>
					<strong>邮件：</strong>1577107936@qq.com<br>
				</address>
				<p/>
				<blockquote>
					<p>The fragrance always stays in the hand that gives the rose.</p>
				</blockquote>
				<hr/>
				<!-- blog文章列表 -->
				<div class="jumbotron">
					<h4>服务器相关</h4>
					<ol id="fwqBlog" class="list-unstyled">
					</ol>
				</div>
				<div class="jumbotron">
					<h4>编程相关</h4>
					<ol id="bcBlog" class="list-unstyled">
					</ol>
				</div>
				<div class="jumbotron">
					<h4>其他</h4>
					<ol id="qtBlog" class="list-unstyled">
					</ol>
				</div>
			</div>
			<!-- 文章主体 -->
 		 	<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-body">
						<iframe id="contentFrame" src="details/usfwqsjpgz.html" name="details"></iframe>
					</div>
				</div>
			</div>
		</div>
	<!-- 第二条水平线 -->
	<hr/>
	<!-- footer -->
		<footer>
			<p class="pull-right">
				&middot; <a href="http://www.bootcss.com" target="_blank">Bootstrap中文网</a>
				&middot; <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>
				&middot; <a href="https://github.com" target="_blank">Github</a>
			</p>
			<p>&copy; 2015 <a href="<%=contextPath %>/index.jsp" >narwal</a></p>
		</footer>
	</div>

	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
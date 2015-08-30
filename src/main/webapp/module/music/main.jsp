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
<title>音乐模块</title>

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
		
		var jsonUrl = "<%=contextPath%>/json/music.json";
		$.getJSON(jsonUrl, function(data) {
			var musicContent = $("#musicContent");
			var toBeAppended = "";
			musicContent.empty();
			$.each(data, function(index, element) {
				toBeAppended += '<tr><td><cite>';
				toBeAppended += element["musicname"];
				toBeAppended += '</cite></td><td>';
				toBeAppended += element["singer"];
				toBeAppended += '</td></tr>';
			});
			musicContent.html(toBeAppended);
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
			<a class="navbar-brand" href="<%=contextPath %>/index.jsp">narwal</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=contextPath%>/module/programming/main.jsp">编程</a></li>
				<li><a href="<%=contextPath%>/module/messagewall/main.jsp">留言墙</a></li>
				<li><a href="#">小玩意</a></li>
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">其他 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath%>/module/reading/main.jsp">读书</a></li>
						<li role="separator" class="divider"></li>
						<li class="active"><a href="<%=contextPath%>/module/music/main.jsp">音乐</a></li>
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
	<!-- 音乐模块主体 -->
	<div class="container">
		<!-- 第一条水平线 -->
		<hr />
		<div class="row">
			<div class="col-md-3 about-author">
				<blockquote>
					<p>多少年以后 往事随云走 那纷飞的冰雪容不下那温柔 这一生一世 这时间太少 不够证明融化冰雪的深情</p>
					<footer>李健<cite title="Source Title">《贝加尔湖畔》</cite></footer>
				</blockquote>
			</div>
			<!-- 读书主体 -->
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3>歌单列表</h3>
						<hr/>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>歌名</th>
									<th>歌手</th>
								</tr>
							</thead>
							<tbody id="musicContent">
							</tbody>
						</table>
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
			&copy; 2015 <a href="<%=contextPath %>/index.jsp">narwal</a>
		</p>
		</footer>
	</div>

	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
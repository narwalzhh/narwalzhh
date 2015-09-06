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
<title>动漫模块</title>

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
		
		var jsonUrl = "<%=contextPath%>/json/comic.json";
		//alert(jsonUrl + "==============");
		$.getJSON(jsonUrl, function(data) {
			var dhContent = $("#dhContent");
			var mhContent = $("#mhContent");
			var otherContent = $("#otherContent");
			var toBeAppended = "";
			var toBeAppended2 = "";
			var toBeAppended3 = "";
			dhContent.empty();
			mhContent.empty();
			otherContent.empty();
			$.each(data, function(index, element) {
				if(element["belongto"] == "dh") {
					toBeAppended += '<tr><td><cite>';
					toBeAppended += element["comicname"];
					toBeAppended += '</cite></td><td>';
					toBeAppended += element["state"];
					toBeAppended += '</td><td>';
					toBeAppended += element["description"];
					toBeAppended += '</td></tr>';
					dhContent.html(toBeAppended);
				} else if(element["belongto"] == "mh"){
					toBeAppended2 += '<tr><td><cite>';
					toBeAppended2 += element["comicname"];
					toBeAppended2 += '</cite></td><td>';
					toBeAppended2 += element["state"];
					toBeAppended2 += '</td><td>';
					toBeAppended2 += element["description"];
					toBeAppended2 += '</td></tr>';
					mhContent.html(toBeAppended2);
				} else {
					toBeAppended3 += '<tr><td><cite>';
					toBeAppended3 += element["comicname"];
					toBeAppended3 += '</cite></td><td>';
					toBeAppended3 += element["description"];
					toBeAppended3 += '</td></tr>';
					otherContent.html(toBeAppended3);
				}
			});
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
				<li class="dropdown active"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">其他 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath%>/module/reading/main.jsp">读书</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath%>/module/music/main.jsp">音乐</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<%=contextPath%>/module/video/main.jsp">视频</a></li>
						<li role="separator" class="divider"></li>
						<li class="active"><a href="<%=contextPath%>/module/comic/main.jsp">动漫</a></li>
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
	<!-- 动画模块主体 -->
	<div class="container">
		<!-- 第一条水平线 -->
		<hr />
		<div class="row">
			<div class="col-md-3 about-author">
				<blockquote>
					<p>只要有树叶飞舞的地方，火就会燃烧。火的影子会照耀着村子，并且，让新的树叶发芽，当想要保护自己做珍惜的人时…忍者真正的力量才会表现出来…</p>
					<footer>猿飞日斩<cite title="Source Title">《火影忍者》</cite></footer>
				</blockquote>
			</div>
			<!-- 读书主体 -->
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3>动画</h3>
						<hr />
						<table class="table table-striped">
							<thead>
								<tr>
									<th>名称</th>
									<th>状态</th>
									<th>简介</th>
								</tr>
							</thead>
							<tbody id="dhContent">
							</tbody>
						</table>
						<h3>漫画</h3>
						<hr />
						<table class="table table-striped">
							<thead>
								<tr>
									<th>名称</th>
									<th>状态</th>
									<th>简介</th>
								</tr>
							</thead>
							<tbody id="mhContent">
							</tbody>
						</table>
						<h3>动画电影</h3>
						<hr />
						<table class="table table-striped">
							<thead>
								<tr>
									<th>名称</th>
									<th>简介</th>
								</tr>
							</thead>
							<tbody id="otherContent">
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
			&copy; 2015 <a href="<%=contextPath%>/index.jsp">narwal</a>
		</p>
		</footer>
	</div>

	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
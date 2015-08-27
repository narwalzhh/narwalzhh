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
<title>登录模块</title>

<link href="refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	/* padding-bottom: 50px; */
}


.fixed-in-bottom {
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	function queryForGrage() {
		alert($("#cust_student_id").val() + "==" + $("#cust_student_password").val());
		return false;
	}
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
				<li><a href="module/programming/main.jsp">编程</a></li>
				<li><a href="module/messagewall/main.jsp">留言墙</a></li>
				<li><a href="#">小玩意</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">其他 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="module/reading/main.jsp">读书</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="module/music/main.jsp">音乐</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="module/video/main.jsp">视频</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="module/comic/main.jsp">动漫</a></li>
					</ul>
				</li>
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
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-info">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne" aria-expanded="true"
									aria-controls="collapseOne">长春理工大学一键成绩查询 </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
										<label class="col-sm-2 control-label">学号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cust_student_id"
												placeholder="ID" >
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">密码</label>
										<div class="col-sm-10">
											<input type="password" class="form-control"
												id="cust_student_password" placeholder="Password" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-5 col-sm-10">
											<button type="submit" class="btn btn-default" onclick="return queryForGrage()">查询</button>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	
	<div class="navbar navbar-fixed-bottom ">
		<div class="container">
			<!-- 第二条水平分割线 -->
			<hr />
			<!-- footer -->
			<footer style="margin-bottom: 50px;">
				<p class="pull-right">
					&middot; <a href="http://www.bootcss.com" target="_blank">Bootstrap中文网</a>
					&middot; <a href="http://glyphicons.com/" target="_blank">Glyphicons</a>
					&middot; <a href="https://github.com" target="_blank">Github</a>
				</p>
				<p>&copy; 2015 <a href="<%=contextPath %>/index.jsp" >narwal</a></p>
			</footer>
		</div>
	</div>

	<script src="refs/jsutils/jquery.min.js"></script>
	<script src="refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
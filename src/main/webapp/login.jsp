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
<title>登录模块</title>

<link href="refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	/* padding-bottom: 50px; */
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	});
	
	function queryForGrage() {
		var custStudentId = $("#cust_student_id").val();
		var custStudentPassword = $("#cust_student_password").val();
		if(custStudentId == "" && custStudentPassword == "") {
			$("#tips_alert").html("请输入必要信息！");
			$("#tips_alert").css("display", "block");
			return false;
		} else if(custStudentId == "") {
			$("#tips_alert").html("请输入学号！");
			$("#tips_alert").css("display", "block");
			return false;
		}  else if(custStudentPassword == "") {
			$("#tips_alert").html("请输入密码！");
			$("#tips_alert").css("display", "block");
			return false;
		} else if(custStudentId.length != 9) {
			$("#tips_alert").html("请输入9位的学号！");
			$("#tips_alert").css("display", "block");
			return false;
		}
		
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			//请求后台的保存留言方法
			url: "queryForGrade.action?timestamp="+new Date().getTime(),
			data: $("#cust_query_for_grade_form").serialize(),
			dataType: "json",
			success: function(data) {
				var html = data.result;
				$(".alert-success").css("display", "block");
				$("#grade_table").html(html);
			},
			error: function(data) {
				alert("Tips:！@（出错了，不好意思客官，稍后再来吧！）@!");
			}
		});
		
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
								<form class="form-horizontal" id="cust_query_for_grade_form">
									<div class="form-group">
										<label class="col-sm-2 control-label">学号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cust_student_id"
												name="custStuId" placeholder="ID" >
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">密码</label>
										<div class="col-sm-10">
											<input type="password" class="form-control"
												id="cust_student_password" name="custStuPwd" placeholder="Password" >
										</div>
									</div>
									<div class="alert alert-danger" role="alert" id="tips_alert" style="display: none;">...</div>
									<div class="form-group">
										<div class="col-sm-offset-5 col-sm-10">
											<a class="btn btn-default" href="javascript:void(0);" role="button" onclick="return queryForGrage()" >查询</a>
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
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-success alert-dismissible" role="alert" style="display: none;">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div id="grade_table"></div>
				</div>
			</div>
		</div>
		
	</div>
		
	<script src="refs/jsutils/jquery.min.js"></script>
	<script src="refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
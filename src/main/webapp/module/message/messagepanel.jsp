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
<title>留言板</title>

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
		$.ajax({
			cache: false,
			async: false,
			type: "post",
			//请求后台的保存留言方法
			url: "listAllMessage.action",
			data: $("#messagepanel_form").serialize(),
			dataType: "json",
			success: function(data) {
				showMessage(data);
			},
			error: function(data) {
				alert("Tips:！@（出错了，不好意思客官，稍后再来吧！）@!");
			}
		});
	});
	
	function showMessage(data) {
		var messagelist = data.messagepanelList.messageList;
		var toBeAppended = "";
		var messagepanelContent = $("#messagepanelContent");
		messagepanelContent.empty();
		var listLength = data.messagepanelList.messageList.length;
		for(var i = 0; i < listLength; i++) {
			toBeAppended += '<tr><td class="active">';
			toBeAppended += listLength - i;
			toBeAppended += '</td><td class="success">';
			toBeAppended += messagelist[i].from;
			toBeAppended += '</td><td class="warning">';
			toBeAppended += messagelist[i].say_something;
			toBeAppended += '</td><td class="danger">';
			toBeAppended += messagelist[i].to;
			toBeAppended += '</td><td class="info">';
			toBeAppended += timeformat(messagelist[i].time);
			toBeAppended += "</td></tr>";
		}
		messagepanelContent.html(toBeAppended);
	}
	
	function timeformat(time) {
		var locateT = time.indexOf("T");
		var formatedTime = time.substring(0,locateT) + " " + time.substring(locateT + 1, time.length);
		return formatedTime;
	}
	
	function checkAndSubmit() {
		var from = $("#from").val();
		var say_something = $("#say_something").val();
		var to = $("#to").val();
		
		if(from == "" && say_something == "" && to == "") {
			alert("Tips:！@（客官您至少写点什么吧！）@！");
			return false;
		} else if(from == "" && say_something != "" && to != "") {
			alert("Tips:！@（请问客官尊姓大名！）@！");
			return false;
		} else if(from != "" && say_something == "" && to != "") {
			alert("Tips:！@（客官您就不想说点什么吗？）@！");
			return false;
		} else if(from != "" && say_something != "" && to == "") {
			alert("Tips:！@（客官你想要给谁留言呢？）@！");
			return false;
		} else if(from != "" && say_something == "" && to == "") {
			alert("Tips:！@（请输入完整的信息）@！");
			return false;
		} else if(from == "" && say_something != "" && to == "") {
			alert("Tips:！@（请输入完整的信息）@！");
			return false;
		} else if(from == "" && say_something == "" && to != "") {
			alert("Tips:！@（请输入完整的信息）@！");
			return false;
		} else {
			$.ajax({
				cache: false,
				async: false,
				type: "post",
				//请求后台的保存留言方法
				url: "saveMessage.action",
				data: $("#messagepanel_form").serialize(),
				dataType: "json",
				success: function(data) {
					alert("Tips:！@（留言成功，客官：" + data.savedMessage.from + "）@!");
					window.location.reload();
				},
				error: function(data) {
					alert("Tips:！@（出错了，不好意思客官，稍后再来吧！）@!");
				}
			});
		}
		
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
						<li class="active"><a href="<%=contextPath %>/module/message/messagepanel.jsp">留言板</a></li>
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
	<!-- 留言板模块主体 -->
	<div class="container">
		<div class="row">
			<!-- 留言板主体 -->
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">Message Panel</div>
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>From</th>
									<th>Say something</th>
									<th>To</th>
									<th>Time</th>
								</tr>
							</thead>
							<tbody id="messagepanelContent">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<form id="messagepanel_form" class="form-inline">
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">From</div>
						<input type="text" class="form-control" id="from"
							name="messagepanelobj.from" maxlength="15" placeholder="from">
					</div>
					<div class="input-group">
						<div class="input-group-addon">Say something</div>
						<input type="text" class="form-control" id="say_something"
							name="messagepanelobj.say_something" maxlength="50" placeholder="say something">
					</div>
					<div class="input-group">
						<div class="input-group-addon">To</div>
						<input type="text" class="form-control" id="to"
							name="messagepanelobj.to" maxlength="15" placeholder="@">
					</div>
				</div>
				<a class="btn btn-default" href="javascript:void(0);" role="button" onclick="return checkAndSubmit()" >留言</a>
			</form>
		</div>
	</div>
	</nav>

	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
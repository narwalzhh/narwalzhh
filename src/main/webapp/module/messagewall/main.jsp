<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
 %>
 <%@ taglib prefix="s" uri="/struts-tags" %>
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
<script type="text/javascript" src="../../refs/jsutils/jquery-1.7.1.js"></script>

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
}

.container .make-longer {
	width: 220px;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		//此处是获得iframe的高度
		$("#messagewallContainer").load(function(){
			var mainheight = $(this).contents().find("body").height()+30;
			if(mainheight < 768) {
				$(this).height(768);
			} else {
				$(this).height(mainheight);
			}
		});		
	});
	
	function checkAndSubmit() {
		
		var nickname = $("#nickname").val();
		var content = $("#content").val();
		
		//判断两个输入框是否为空
		if(nickname == "" && content == "") {
			alert("Tips:！@（客官您至少写点什么吧！）@！");
			return;
		}
		if(nickname == "" && content != "") {
			alert("Tips:！@（请问客官尊姓大名！）@！");
			return;
		}
		if(nickname != "" && content == "") {
			$.messager.alert("Tips:！@（客官您就没有什么要说的吗？）@！");
			return;
		}
		//判断输入的名字是否复合要求
		if(/^[\u4e00-\u9fa5]+$/.test(nickname)){
			if(nickname.length > 6) {
				alert("Tips:！@（请最多输入6个汉字！）@!");
				return;
			}
		}
		
		$.ajax({
			cache: false,
			async: false,
			type: "post",
			//请求后台的保存留言方法
			url: "saveNote.action",
			data: $("#messagewallForm").serialize(),
			dataType: "json",
			success: function(data) {
				alert("Tips:！@（留言成功，客官：" + data.savedNote.nickname + "）@!");
			},
			error: function(data) {
				alert("Tips:！@（出错了，不好意思客官，稍后再来吧！）@!");
			}
		});
		
	}
	
</script>

</head>
<body>
	<div class="messagewall-container">
		<iframe id="messagewallContainer" class="messagewall-show" src="messagecontent.jsp"></iframe>
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
			
			<form id="messagewallForm" class="navbar-form navbar-left">
				<div class="form-group">
					<label class="sr-only" for="">昵称
						</label> <input type="text" class="form-control"
						id="nickname" name="messagewallObj.nickname" maxlength="10" placeholder="昵称(6个汉字或10个字符)" >
				</div>
				<div class="form-group">
					<label class="sr-only" for="">留言内容</label>
					<input type="text" class="form-control make-longer"
						id="content" name="messagewallObj.content" maxlength="13" placeholder="内容(请输入10到13个汉字)">
				</div>
				<button type="submit" class="btn btn-default" onclick="checkAndSubmit()">留言</button>
			</form>
			<ul class="nav navbar-nav ">
				<li><a href="#" data-toggle="modal" data-target="#bell">
					<!-- 铃铛图标 -->
					<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	
	<!-- 模态弹出框 -->
	<div class="modal fade" id="bell">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">留言墙</h4>
				</div>
				<div class="modal-body">
					<p>此处留言墙介绍</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="../../refs/jsutils/jquery.min.js"></script>
	<script src="../../refs/bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>
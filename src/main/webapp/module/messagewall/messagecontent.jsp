<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../refs/cssutils/messagewall.css" rel="stylesheet">
<script src="../../refs/jsutils/jquery-1.7.1.js"></script>
<title>留言墙模块</title>

<style type="text/css"></style>

<script type="text/javascript">
	$(document).ready(function() {
		
		$.ajax({
			cache: false,
			async: false,
			type: "post",
			//请求后台的取得所有留言的方法
			url: "listAllNote.action",
			dataType: "json",
			success: function(data) {
				showNote(data);
			},
			error: function(data) {
				alert("！@（出错了，不好意思客官，稍后再来吧！）@!");
			}
		});
		
	});
	
	function showNote(data) {
		var toBeAppended = "";
		var ulContent = $("#ulContainer");
		ulContent.empty();
		var listLength = data.messagewallList.noteList.length;
		for(var i = 0; i < listLength; i++) {
			toBeAppended += "<li><a><h2>";
			toBeAppended += data.messagewallList.noteList[i].nickname;
			toBeAppended += "</h2><p>";
			toBeAppended += data.messagewallList.noteList[i].content;
			toBeAppended += "</p></a></li>";
		}
		ulContent.html(toBeAppended);
	}
	
</script>

</head>
<body>
	<ul id="ulContainer"></ul>
</body>
</html>
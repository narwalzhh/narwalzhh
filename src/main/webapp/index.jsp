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
<meta name="keywords" content="narwal,narwalzhh,留言墙,长春理工大学一键成绩查询,服务器,maven,ubuntu,linux,编程,java,android,开发,火影忍者,server，svn，git">
<meta name="description" content="narwal的个人网站，好东西要与人分享">
<title>narwal个人网站主页</title>

<link rel="shortcut icon" href="refs/images/favicon.ico" type="image/x-icon" /> 

<link href="refs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="refs/jsutils/jquery-1.7.1.js"></script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 50px;
}

.carousel {
	width: 100%;
	height: 500px;
	background-color: #000;
}

.carousel-inner .item img {
	height: 500px;
	width: 100%;
}

.make-center {
	text-align: center;
}

.make-center a {
	text-decoration: none;
	cursor: pointer;
}

.list-group .active {
	text-align: center;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		var jsonUrl = "<%=contextPath%>/json/index.json";
		$.getJSON(jsonUrl, function(data) {
			var listGroupContent = $("#listGroupContent");
			var toBeAppended = ""; 
			listGroupContent.empty();
			$.each(data, function(index, element) {
				if(element["id"] == 101) {
					toBeAppended += '<a class="list-group-item active">';
					toBeAppended += element["name"];
					toBeAppended += '</a>';
				} else {
					toBeAppended += '<a href="'+ element["hrefurl"] +'" class="list-group-item">';
					toBeAppended += element["name"];
					toBeAppended += '</a>';
				}
			});
			listGroupContent.html(toBeAppended);
		});
		
	    $("#reading").popover({
	    	trigger: "hover",
	    	container: "body",
	    	content: "远离工业社会，回归纯真，在田园生活中感知自然，重塑自我，一字一句，都能让够感受到心灵的纯净，精神的升华！"
	    });
	    $("#music").popover({
	    	trigger: "hover",
	    	container: "body",
	    	content: "黄老板这传说中的拉布拉多般治愈嗓音不知俘获了多少少男少女的芳心，这首的治愈能力超强哦，另外，黄老板和你霉可是密友！"
	    });
	    $("#video").popover({
	    	trigger: "hover",
	    	placement: "left",
	    	content: "没有读过原著的小猿从砖家的视频中了解到了许多以前不曾体会的深意，不管正确与否，单是节目结尾的那一段肺腑之言，就绝对值得一看！"
	    });
	    $("#comic").popover({
	    	trigger: "hover",
	    	placement: "left",
	    	content: "儿时最大的遗憾，估计就是没有完整的看完悟空从小到大的每一个细节，为了不能忘却的纪念，这一次一定要玩玩整整的补回来！"
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
				<li><a href="module/programming/main.jsp">编程</a></li>
				<li><a href="module/messagewall/main.jsp">留言墙</a></li>
				<li><a href="module/littlestuff/main.jsp">小玩意</a></li>
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
				<li><a href="#" data-toggle="modal" data-target="#aboutModal">关于</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp" id="loginBtn">
					<span class="glyphicon glyphicon glyphicon-log-in" aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- blog主页主体 -->
	<div class="container">
		<!-- 第一条水平分割线 -->
		<div class="alert alert-warning" role="alert"><strong>留言墙来了，戳<a href="module/messagewall/main.jsp">这里</a>进入，谷歌浏览器展示效果更佳哦！</strong></div>
		<hr/>
		<div class="row">
			<div class="col-md-9">
				<!-- 焦点图 -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides  -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="refs/images/hanjiaren.jpg" alt="韩佳人">
							<div class="carousel-caption">
								<h3>韩佳人</h3>
								<p>侧脸，给人以神秘但又不失美感，代码，亦是如此！</p>
							</div>
						</div>
						<div class="item">
							<img src="refs/images/unicorn.jpg" alt="unicorn">
							<div class="carousel-caption">
								<h3>Unicorn</h3>
								<p>Ubuntu Terminal，代码满满一屏幕，菜鸟眼中的装X神器！</p>
							</div>
						</div>
						<div class="item">
							<img src="refs/images/taylor.jpg" alt="Taylor Swift">
							<div class="carousel-caption">
								<h3>Taylor Swift</h3>
								<p>整天学习，整天敲代码，累不累，听首歌放松一下吧，放松完继续苦X的生活！</p>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- 右侧列表组 -->
			<div class="col-md-3">
				<div id="listGroupContent" class="list-group">
				</div>
			</div>
		</div>
		<!-- 第二条水平分割线 -->
		<hr />
		<!-- 四个缩略图和简单介绍 -->
		<div class="row make-center">
			<div class="col-lg-3">
				<img class="img-circle" src="refs/images/reading.jpg" alt="smile"
					width="140" height="140">
				<h2><small>读书</small></h2>
				<p><a id="reading">
					<cite>《瓦尔登湖》</cite>
					远离工业社会，回归纯真，在田园生活中感知自然...
					</a>
				</p>
				<p>
					<a class="btn btn-default" href="<%=contextPath %>/module/reading/main.jsp" role="button">详细&raquo;</a>
				</p>
			</div>
			<div class="col-lg-3">
				<img class="img-circle" src="refs/images/music.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2><small>音乐</small></h2>
				<p>
					<a id="music"><cite>Photograph</cite> 黄老板这传说中的拉布拉多般治愈嗓音不知俘获了多少...</a>
				</p>
				<p>
					<a class="btn btn-default" href="<%=contextPath %>/module/music/main.jsp" role="button">详细&raquo;</a>
				</p>
			</div>
			<div class="col-lg-3">
				<img class="img-circle" src="refs/images/video.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2><small>视频</small></h2>
				<p>
					<a id="video"><cite>你不知道的西游记</cite> 没有读过原著的小猿从砖家的视频中了解到了许多以前...</a>
				</p>
				<p>
					<a class="btn btn-default" href="<%=contextPath %>/module/video/main.jsp" role="button">详细&raquo;</a>
				</p>
			</div>
			<div class="col-lg-3">
				<img class="img-circle" src="refs/images/comic.jpg"
					alt="Generic placeholder image" width="140" height="140">
				<h2><small>动漫</small></h2>
				<p>
					<a id="comic"><cite>龙珠超</cite> 儿时最大的遗憾，估计就是没有完整的看完悟空从小到大的...</a>
				</p>
				<p>
					<a class="btn btn-default" href="<%=contextPath %>/module/comic/main.jsp" role="button">详细&raquo;</a>
				</p>
			</div>
		</div>
		<!-- 第三条水平分割线 -->
		<hr />
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

	<!-- 模态弹出框 -->
	<div class="modal fade" id="aboutModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">narwal 的个人网站</h4>
				</div>
				<div class="modal-body">
					<p>小猿---北方小镇的大学生一枚，闲来无事，又是心血来潮便写了这个小网站。
						想记录下在学习道路上遇到的一些困难，又想把一些有趣的好东西与大家分享！</p>
					<p>欢迎大家通过邮件的方式给小猿提出意见，邮件地址在编程模块已经标注(注：不接受附件形式的邮件，来信请表明身份，谢谢合作！)</p>
					<P>欢迎大家常来骚扰！！！</P>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解</button>
				</div>
			</div>
		</div>
	</div>

	<script src="refs/jsutils/jquery.min.js"></script>
	<script src="refs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
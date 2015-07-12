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
<title>narwal个人网站主页</title>

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
				if(element["id"] == 101 || element["id"] == 108) {
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
		
	    $("#loginBtn").popover({
    		trigger: "hover",
    		container: "body",
    		content: "登录功能正在抓紧制作中，客观您见谅！"
	        });
	    $("#reading").popover({
	    	trigger: "hover",
	    	container: "body",
	    	content: "远离工业社会，回归纯真，在田园生活中感知自然，重塑自我，一字一句，都能让够感受到心灵的纯净，精神的升华。"
	    });
	    $("#music").popover({
	    	trigger: "hover",
	    	container: "body",
	    	content: "当内心躁动不已，当终日奔波，身心俱疲时，不如静静地躺下，用心聆听，或许，心就不是那么累了！"
	    });
	    $("#video").popover({
	    	trigger: "hover",
	    	placement: "left",
	    	content: "森叔不是来打架耍帅的，他是来负责逗逼的，大侦探福尔摩斯中的华生也有出演哦，，it‘s always nice to meet you, Mr. Watson!"
	    });
	    $("#comic").popover({
	    	trigger: "hover",
	    	placement: "left",
	    	content: "自我约束，誓死也要守护自己最重要的东西，当凯开启八门遁甲最后一门死门的时候，除了激动和震惊之外，小猿还知道了：青春至死不息！"
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
				<li><a href="module/reading/main.jsp">读书</a></li>
				<li><a href="module/music/main.jsp">音乐</a></li>
				<li><a href="module/video/main.jsp">视频</a></li>
				<li><a href="module/comic/main.jsp">动漫</a></li>
				<li><a href="#" data-toggle="modal" data-target="#aboutModal">关于</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" id="loginBtn">
					<span class="glyphicon glyphicon glyphicon-log-in" aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- blog主页主体 -->
	<div class="container">
		<!-- 第一条水平分割线 -->
		<div class="alert alert-warning" role="alert"><strong>网站持续优化中，建议使用谷歌浏览器浏览，blog与其他模块继续更新中，敬请期待！</strong></div>
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
								<h3>Taylor</h3>
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
					<a id="music"><cite>尘缘</cite> 当内心躁动不已，当终日奔波，身心俱疲时，不如静静地...</a>
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
					<a id="video"><cite>女间谍</cite> 广受大家喜爱的光头肌肉男郭达斯坦森又来了，但是，请注意...</a>
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
					<a id="comic"><cite>火影忍者639集：爸爸的青春</cite> 自我约束，誓死也要守护自己...</a>
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
					<p>小猿是来自北方小镇的一名大学生，为了打发无聊的考研，又是心血来潮便写了这么个简单网站，
						一方面想记录下在编程道路上遇到的一些困难，另一方面想把自己遇到的好东西与大家分享，
						也不枉小猿每个月上交的服务器的钱！</p>
					<p>欢迎大家通过邮件的方式给小猿提出意见，邮件地址在各个模块都已标注，
					为了安全起见，小猿不接受附件形式的邮件，来信请表明身份，谢谢合作！</p>
					<p>大家多来逛一逛是对小猿最大的支持！</p>
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
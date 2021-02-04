<%@ page import="entity.Knowledgedata" %>
<%@ page import="java.util.*" %>
<%@ page import="entity.Userdata" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
    <!-- 这个属性主要是设置浏览器优先使用什么模式来渲染页面的-->
    <!-- #下面的meta标签告诉IE浏览器，IE8/9及以后的版本都会以最高版本IE来渲染页面。  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--移动设备都是这Viewport里面打开，width=device-width表示打开页面默认和设备一致，initial-scale=1表示页面不进行缩放   -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>知识库搜索</title>
    <!-- Bootstrap -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet"/>-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<%
    List<Object> list = new ArrayList<>();
    list = (List<Object>) request.getSession().getAttribute("list_Session");
    List<Knowledgedata> knowledgedataList = new ArrayList<>();
    knowledgedataList = (List<Knowledgedata>) list.get(0);
    int count = (int) list.get(1);
%>
<%
    HttpSession httpSession = request.getSession();
    Userdata user_session = (Userdata) httpSession.getAttribute("user_session");
%>
<!-- --导航条  默认高度50px, 反色（黑色） 固定在顶部 -->
<nav class="navbar navbar-inverse .navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <!--当浏览器宽度变窄的时候会显示这个Button按钮，并且会把data-target中的div中ul收缩导航到Button下方-->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <!--定义小按钮的样式-->
                <span class="sr-only">Toggle navigation</span>
                <!-- 页面变窄时 ， 按钮的3条横线 -->
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!--Logo位置-->

        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!--导航条内容-->
                <li class="active"><a href="home_page.jsp">首页 <span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">用户<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="index.html">登录</a></li>
                        <li><a href="reg.html">注册</a></li>
                        <%--                        <li><a href="reg.html">注销</a></li>--%>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">联系我们<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">地址</a></li>
                        <li><a href="#">电话</a></li>
                        <li><a href="#">邮箱</a></li>
                        <li class="divider"></li>
                        <li><a href="#">微信</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <li>
                    <a class="nav-link navbar-item active">
                        <img src="<%=user_session.getAvatar()%>" alt="" height="25px" width="25px" id="avatar">
                        您好, <%=user_session.getName()%> 欢迎访问~
                    </a>
                </li>
            </ul>
            <!--搜索表单-->
            <form class="navbar-form navbar-right" role="search" action="SearchServlet" method="get">
                <div class="form-group">
                    <input type="text" class="form-control" name="search" placeholder="Search" />
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div>
    </div>
</nav>
<div class="container" style="margin-top: -15px">
    <div class="row">
        <div class="col-md-3">
            <h4 align="center">热门标签</h4>
            <hr>
            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="JAVA" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">JAVA</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="C" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">C</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="HTML" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">HTML</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="CSS" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">CSS</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="JS" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">JS</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="Python" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">Python</button>
                            </div>
                        </form>
                        <form action="SearchServlet" method="get">
                            <div class="form-group">
                                <input type="hidden" value="PHP" name="search" />
                                <button type="submit" class="btn btn-default" style="width: 260px">PHP</button>
                            </div>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-9">
            <img src="https://picbedd.oss-cn-beijing.aliyuncs.com/fengmian.jpg" style="width: 850px; height: 150px" />
            <div style="font-size: x-large" align="center">—————— <font color="blue"><%=count%></font> 个搜索结果——————</div>
            <div class="row" style="margin-top: 15px">
                <!--添加列表组件-->
                <div class="col-md-12">
                    <div class="list-group" id="title">
                        <a class="list-group-item active" align="center">知识库</a>

                        <!-- 如果出现Http : 500 或者一共有8个词条只展示2个就是这里的问题 -->
                        <!-- 0个词条会Http: 500,或者展示的词条与搜索的词条数量不一样，会展示不全 -->
                        <!-- 今天先到这，明天一定解决  =_=  -->

                        <a href="#" class="list-group-item lgi">
                            <div class="row">
                                <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(0).getTitle()%></font></h4></div>
                                <div class="col-sm-3">
                                    <font color="#a9a9a9"><%=knowledgedataList.get(0).getCreateTime()%></font>
                                </div>
                                <div class="col-sm-12"><%=knowledgedataList.get(0).getAbstract()%></div>
                                <div class="col-sm-10"></div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-xs">编辑</button>
                                    <button type="button" class="btn btn-danger btn-xs">删除</button>
                                </div>
                            </div>
                        </a>
                        <a href="#">查看更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>

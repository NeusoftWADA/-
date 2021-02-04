<%@ page import="entity.Userdata" %>
<%@ page import="database.Database" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="entity.Knowledgedata" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<html lang="en">

<head>
    <style>
        .top {
            margin: 18px 0px 18px 0px
        }

        .picture {
            text-align: center
        }

        .name {
            height: 40px;
            line-height: 40px;
            font-size: 18px;
            color: #000000;
            text-align: center
        }

        .border_b2 {
            margin-left: 20px;
            border-bottom: 1px solid #9c9c9c
        }

        .title {
            height: 30px;
            font-weight: bold;
            color: #000000
        }

        .wid {
            width: 225px
        }

        .mes_l {
            margin-left: 20px
        }

        .per_list {
            line-height: 35px;
            font-size: 12px;
            color: #323232
        }

        .y_black {
            color: #000000
        }

        .dir {
            vertical-align: top
        }

        .limit2 {
            width: 204px
        }

        .limit1 {
            width: 180px
        }

        #profile {
            border: 1px solid black;
            border-radius: 20px;
            height: 80%;
            background-color: #eee;
        }

        .lgi {
            height: 100px;
        }

        /*.info {*/
        /*    color: #565a5f;*/
        /*    font: 16px "open sans", "Helvetica Neue", "Microsoft Yahei", Helvetica, Arial, sans-serif;*/
        /*    margin: 0;*/
        /*    border: 0;*/
        /*    outline: 0;*/
        /*    font-weight: inherit;*/
        /*    font-style: inherit;*/
        /*    font-family: inherit;*/
        /*    font-size: 100%;*/
        /*    vertical-align: baseline;*/
        /*    border-bottom: 1px solid #eceff2;*/
        /*    padding: 0px;*/
        /*}*/
    </style>

    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
    <!-- 这个属性主要是设置浏览器优先使用什么模式来渲染页面的-->
    <!-- #下面的meta标签告诉IE浏览器，IE8/9及以后的版本都会以最高版本IE来渲染页面。  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--移动设备都是这Viewport里面打开，width=device-width表示打开页面默认和设备一致，initial-scale=1表示页面不进行缩放   -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>知识库首页</title>

    <!-- Bootstrap -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet"/>-->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>

<body style="background-color: #fff;">

<% HttpSession httpSession=request.getSession(); Userdata user_session=(Userdata)
        httpSession.getAttribute("user_session"); %>

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
                <li class="active"><a href="#">首页 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="#">JAVA</a></li>
                <li><a href="#">PS</a></li>
                <li><a href="#">C++</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                       role="button" aria-expanded="false">更多<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Vue</a></li>
                        <li><a href="#">C#</a></li>
                        <li><a href="#">Html</a></li>
                        <li><a href="#">C#高级</a></li>
                        <li><a href="#">Python</a></li>
                    </ul>
                </li>
            </ul>
            <!--搜索表单-->
            <form class="navbar-form navbar-left" action="SearchServlet" method="get">
                <div class="form-group">
                    <input type="text" class="form-control" name="search" placeholder="Search" />
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>

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
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!--------栅格系统， 全局CSS样式-栅格系统  -------->

<!--栅格系统放在container容器中-->
<!-- 	<div class="container" style="margin-top">
<div class="row" align="left">
<div class="col-sm-12">

</div>
</div>
</div> -->
<div class="container" style="margin-top: -15px">

    <div class="row">

        <div class="col-sm-3" id="profile">
            <div class="top">
                <p class="picture"><img src="<%=user_session.getAvatar()%>" width="100" height="100" style="border-radius: 100%"></p>
                <p class="name"><%=user_session.getName()%></p>
            </div>

            <table class="border_b2">
                <tbody>
                <tr class="title">
                    <td class="wid"><span>个人信息</span></td>
                </tr>
                </tbody>
            </table>


            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td><span>昵称：</span></td>
                    <td><span class="y_black"><%=user_session.getName()%></span></td>
                </tr>
                </tbody>
            </table>

            <%
                int user_id=user_session.getId();
                int cnt=0; Database database=new Database();
                PreparedStatement preparedStatement=database.getConnection().prepareStatement("select COUNT(k_id) from knowledge where user_id=?");
                preparedStatement.setInt(1, user_id);
                ResultSet resultSet=preparedStatement.executeQuery();
                while(resultSet.next() ) {
                    cnt=resultSet.getInt(1);
                }
//                preparedStatement=database.getConnection().prepareStatement("select title from knowledge where user_id=?");
//                preparedStatement.setInt(1, user_id);
//                resultSet=preparedStatement.executeQuery();
//                int i=0;
//                while(resultSet.next()) {
//                    request.getSession().setAttribute("title"+i,resultSet.getString(1));
//                    i++;
//                }
            %>

            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td class="dir"><span>知识量：</span></td>
                    <td class="limit1"><span class="y_black"><%=cnt%>篇</span>
                    </td>
                </tr>
                </tbody>
            </table>

            <table class="mes_l">
                <tbody>
                <tr class="per_list">
                    <td class="dir"><span>E-mail：</span></td>
                    <td class="limit1"><span class="y_black"><%=user_session.getEmail()%></span>
                    </td>

                </tbody>
            </table>
            <a href="entering.jsp">
                <button class="btn btn-primary btn-lg btn-block">发布知识点</button>
            </a>
        </div>

        <div class="col-sm-9">
            <img src="https://picbedd.oss-cn-beijing.aliyuncs.com/fengmian.jpg" style="width: 850px; height: 150px" />

            <div class="row" style="margin-top: 15px">
            <!--添加列表组件-->
                <div class="col-sm-12">
            <div class="list-group" id="title">

                <%
                    //按时间顺序封装取出十条知识点数据，放入集合
                    String sql = "SELECT * FROM `knowledge` ORDER BY createTime DESC LIMIT 10";
                    PreparedStatement preparedStatement1 = database.getConnection().prepareStatement(sql);
                    ResultSet resultSet1 = preparedStatement1.executeQuery();
                    List<Knowledgedata> knowledgedataList = new ArrayList<>();
                    while ( resultSet1.next() ) {
                        Knowledgedata knowledgedata = new Knowledgedata(resultSet1.getInt(1), resultSet1.getInt(2), resultSet1.getString(3), resultSet1.getString(4), resultSet1.getString(5), resultSet1.getString(6));
                        knowledgedataList.add(knowledgedata);
                    }
                %>

                <a class="list-group-item active" align="center">我的知识库</a>
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
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(1).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(1).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(1).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(2).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(2).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(2).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi" >
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(3).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(3).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(3).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(4).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(4).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(4).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(5).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(5).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(5).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi" >
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(6).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(6).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(6).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(7).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(7).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(7).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
            </a>
                <a href="#" class="list-group-item lgi">
                    <div class="row">
                        <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(8).getTitle()%></font></h4></div>
                        <div class="col-sm-3">
                            <font color="#a9a9a9"><%=knowledgedataList.get(8).getCreateTime()%></font>
                        </div>
                        <div class="col-sm-12"><%=knowledgedataList.get(8).getAbstract()%></div>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                        </div>
                    </div>
            </a>
                <a href="#" class="list-group-item lgi" >
                <div class="row">
                    <div class="col-sm-9"><h4><font color="#00FF00"><%=knowledgedataList.get(9).getTitle()%></font></h4></div>
                    <div class="col-sm-3">
                        <font color="#a9a9a9"><%=knowledgedataList.get(9).getCreateTime()%></font>
                    </div>
                    <div class="col-sm-12"><%=knowledgedataList.get(9).getAbstract()%></div>
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

        <!-- 添加分页效果 -->
<%--        <nav>--%>
<%--            <ul class="pagination" id="pagination">--%>
<%--                <li>--%>
<%--                    <a href="#" aria-label="Previous">--%>
<%--                        <span aria-hidden="true">«</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li><a href="#">1</a></li>--%>
<%--                <li><a href="#">2</a></li>--%>
<%--                <li><a href="#">3</a></li>--%>
<%--                <li><a href="#">4</a></li>--%>
<%--                <li><a href="#">5</a></li>--%>
<%--                <li>--%>
<%--                    <a href="#" aria-label="Next">--%>
<%--                        <span aria-hidden="true">»</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </nav>--%>

        <div class="copyright text-center">
            <p>©我的知识库myk1</p>
        </div>
    </div>
</div>

</div>
<script>
        <%--var size = <%=i%>;--%>
        <%--for(var i=0;i<size;i++){--%>
        <%--    $("#title").append('<a href="#" class="list-group-item" align="center title"><%=request.getSession().getAttribute("title"+i)%></a>');//此处的i有问题--%>
        <%--}--%>
</script>
</body>

</html>
<%@ page import="entity.Userdata" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <title>发布知识点</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        .w-e-toolbar,
        .w-e-text-container,
        .w-e-menu-panel {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            background-color: #fff;
            /*表情菜单样式*/
            /*分割线样式*/
        }

        .w-e-toolbar h1,
        .w-e-text-container h1,
        .w-e-menu-panel h1 {
            font-size: 2em !important;
        }

        .w-e-toolbar h2,
        .w-e-text-container h2,
        .w-e-menu-panel h2 {
            font-size: 1.5em !important;
        }

        .w-e-toolbar h3,
        .w-e-text-container h3,
        .w-e-menu-panel h3 {
            font-size: 1.17em !important;
        }

        .w-e-toolbar h4,
        .w-e-text-container h4,
        .w-e-menu-panel h4 {
            font-size: 1em !important;
        }

        .w-e-toolbar h5,
        .w-e-text-container h5,
        .w-e-menu-panel h5 {
            font-size: 0.83em !important;
        }

        .w-e-toolbar p,
        .w-e-text-container p,
        .w-e-menu-panel p {
            font-size: 1em !important;
        }

        .w-e-toolbar .eleImg,
        .w-e-text-container .eleImg,
        .w-e-menu-panel .eleImg {
            cursor: pointer;
            display: inline-block;
            font-size: 18px;
            padding: 0 3px;
        }

        .w-e-toolbar *,
        .w-e-text-container *,
        .w-e-menu-panel * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .w-e-toolbar hr,
        .w-e-text-container hr,
        .w-e-menu-panel hr {
            cursor: pointer;
            display: block;
            height: 0px;
            border: 0;
            border-top: 3px solid #ccc;
            margin: 20px 0;
        }

        .w-e-clear-fix:after {
            content: "";
            display: table;
            clear: both;
        }

        .w-e-drop-list-item {
            position: relative;
            top: 1px;
            padding-right: 7px;
            color: #333 !important;
        }

        .w-e-drop-list-tl {
            padding-left: 10px;
            text-align: left;
        }
    </style>
    <style>
        @font-face {
            font-family: 'w-e-icon';
            src: url(data:font/woff;base64,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) format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        [class^="w-e-icon-"],
        [class*=" w-e-icon-"] {
            /* use !important to prevent issues with browser extensions that change fonts */
            font-family: 'w-e-icon' !important;
            speak: none;
            font-style: normal;
            font-weight: normal;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            /* Better Font Rendering =========== */
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .w-e-icon-close:before {
            content: "\f00d";
        }

        .w-e-icon-upload2:before {
            content: "\e9c6";
        }

        .w-e-icon-trash-o:before {
            content: "\f014";
        }

        .w-e-icon-header:before {
            content: "\f1dc";
        }

        .w-e-icon-pencil2:before {
            content: "\e906";
        }

        .w-e-icon-paint-brush:before {
            content: "\f1fc";
        }

        .w-e-icon-image:before {
            content: "\e90d";
        }

        .w-e-icon-play:before {
            content: "\e912";
        }

        .w-e-icon-location:before {
            content: "\e947";
        }

        .w-e-icon-undo:before {
            content: "\e965";
        }

        .w-e-icon-redo:before {
            content: "\e966";
        }

        .w-e-icon-quotes-left:before {
            content: "\e977";
        }

        .w-e-icon-list-numbered:before {
            content: "\e9b9";
        }

        .w-e-icon-list2:before {
            content: "\e9bb";
        }

        .w-e-icon-link:before {
            content: "\e9cb";
        }

        .w-e-icon-happy:before {
            content: "\e9df";
        }

        .w-e-icon-bold:before {
            content: "\ea62";
        }

        .w-e-icon-underline:before {
            content: "\ea63";
        }

        .w-e-icon-italic:before {
            content: "\ea64";
        }

        .w-e-icon-strikethrough:before {
            content: "\ea65";
        }

        .w-e-icon-table2:before {
            content: "\ea71";
        }

        .w-e-icon-paragraph-left:before {
            content: "\ea77";
        }

        .w-e-icon-paragraph-center:before {
            content: "\ea78";
        }

        .w-e-icon-paragraph-right:before {
            content: "\ea79";
        }

        .w-e-icon-paragraph-justify:before {
            content: "\ea7a";
        }

        .w-e-icon-terminal:before {
            content: "\f120";
        }

        .w-e-icon-page-break:before {
            content: "\ea68";
        }

        .w-e-icon-cancel-circle:before {
            content: "\ea0d";
        }

        .w-e-icon-font:before {
            content: "\ea5c";
        }

        .w-e-icon-text-heigh:before {
            content: "\ea5f";
        }

        .w-e-icon-paint-format:before {
            content: "\e90c";
        }

        .w-e-icon-indent-increase:before {
            content: "\ea7b";
        }

        .w-e-icon-indent-decrease:before {
            content: "\ea7c";
        }

        .w-e-icon-row-height:before {
            content: "\e9be";
        }

        .w-e-icon-fullscreen_exit:before {
            content: "\e900";
        }

        .w-e-icon-fullscreen:before {
            content: "\e901";
        }

        .w-e-icon-split-line:before {
            content: "\ea0b";
        }

        .w-e-icon-checkbox-checked:before {
            content: "\ea52";
        }
    </style>
    <style>
        .w-e-toolbar {
            display: flex;
            padding: 0 6px;
            flex-wrap: wrap;
            position: relative;
            /* 单个菜单 */
        }

        .w-e-toolbar .w-e-menu {
            position: relative;
            display: flex;
            width: 40px;
            height: 40px;
            align-items: center;
            justify-content: center;
            text-align: center;
            cursor: pointer;
        }

        .w-e-toolbar .w-e-menu i {
            color: #999;
        }

        .w-e-toolbar .w-e-menu:hover {
            background-color: #F6F6F6;
        }

        .w-e-toolbar .w-e-menu:hover i {
            color: #333;
        }

        .w-e-toolbar .w-e-active i {
            color: #1e88e5;
        }

        .w-e-toolbar .w-e-active:hover i {
            color: #1e88e5;
        }
    </style>
    <style>
        .w-e-text-container {
            position: relative;
        }

        .w-e-text-container .w-e-progress {
            position: absolute;
            background-color: #1e88e5;
            top: 0;
            left: 0;
            height: 1px;
        }

        .w-e-text-container .placeholder {
            color: #D4D4D4;
            position: absolute;
            font-size: 11pt;
            line-height: 22px;
            left: 10px;
            top: 10px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            z-index: -1;
        }

        .w-e-text {
            padding: 0 10px;
            overflow-y: auto;
        }

        .w-e-text p,
        .w-e-text h1,
        .w-e-text h2,
        .w-e-text h3,
        .w-e-text h4,
        .w-e-text h5,
        .w-e-text table,
        .w-e-text pre {
            margin: 10px 0;
            line-height: 1.5;
        }

        .w-e-text ul,
        .w-e-text ol {
            margin: 10px 0 10px 20px;
        }

        .w-e-text blockquote {
            display: block;
            border-left: 8px solid #d0e5f2;
            padding: 5px 10px;
            margin: 10px 0;
            line-height: 1.4;
            font-size: 100%;
            background-color: #f1f1f1;
        }

        .w-e-text code {
            display: inline-block;
            background-color: #f1f1f1;
            border-radius: 3px;
            padding: 3px 5px;
            margin: 0 3px;
        }

        .w-e-text pre code {
            display: block;
        }

        .w-e-text table {
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }

        .w-e-text table td,
        .w-e-text table th {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            padding: 3px 5px;
            min-height: 30px;
        }

        .w-e-text table th {
            border-bottom: 2px solid #ccc;
            text-align: center;
            background-color: #f1f1f1;
        }

        .w-e-text:focus {
            outline: none;
        }

        .w-e-text img {
            cursor: pointer;
        }

        .w-e-text img:hover {
            box-shadow: 0 0 5px #333;
        }

        .w-e-text .w-e-todo {
            margin: 0 0 0 20px;
        }

        .w-e-text .w-e-todo li {
            list-style: none;
            font-size: 1em;
        }

        .w-e-text .w-e-todo li span:nth-child(1) {
            position: relative;
            left: -18px;
        }

        .w-e-text .w-e-todo li span:nth-child(1) input {
            position: absolute;
            top: 0.3em;
            margin-right: 3px;
        }

        .w-e-tooltip {
            position: absolute;
            display: flex;
            color: #f1f1f1;
            background-color: rgba(0, 0, 0, 0.75);
            box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.15);
            border-radius: 4px;
            padding: 4px 5px 6px;
            justify-content: center;
            align-items: center;
        }

        .w-e-tooltip-up::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border: 5px solid rgba(0, 0, 0, 0);
            border-top-color: rgba(0, 0, 0, 0.73);
        }

        .w-e-tooltip-down::after {
            content: "";
            position: absolute;
            bottom: 100%;
            left: 50%;
            margin-left: -5px;
            border: 5px solid rgba(0, 0, 0, 0);
            border-bottom-color: rgba(0, 0, 0, 0.73);
        }

        .w-e-tooltip-item-wrapper {
            cursor: pointer;
            font-size: 14px;
            margin: 0 5px;
        }

        .w-e-tooltip-item-wrapper:hover {
            color: #ccc;
            text-decoration: underline;
        }

        .w-e-menu-tooltip {
            position: absolute;
            display: flex;
            color: #f1f1f1;
            background-color: rgba(0, 0, 0, 0.75);
            box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.15);
            border-radius: 4px;
            padding: 4px 5px 6px;
            justify-content: center;
            align-items: center;
        }

        .w-e-menu-tooltip-up::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border: 5px solid rgba(0, 0, 0, 0);
            border-top-color: rgba(0, 0, 0, 0.73);
        }

        .w-e-menu-tooltip-item-wrapper {
            font-size: 14px;
            margin: 0 5px;
        }
    </style>
    <style>
        .w-e-menu .w-e-panel-container {
            position: absolute;
            top: 0;
            left: 50%;
            border: 1px solid #ccc;
            border-top: 0;
            box-shadow: 1px 1px 2px #ccc;
            color: #333;
            background-color: #fff;
            text-align: left;
            /* 为 emotion panel 定制的样式 */
            /* 上传图片、上传视频的 panel 定制样式 */
        }

        .w-e-menu .w-e-panel-container .w-e-panel-close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 5px;
            margin: 2px 5px 0 0;
            cursor: pointer;
            color: #999;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-close:hover {
            color: #333;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-title {
            list-style: none;
            display: flex;
            font-size: 14px;
            margin: 2px 10px 0 10px;
            border-bottom: 1px solid #f1f1f1;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-title .w-e-item {
            padding: 3px 5px;
            color: #999;
            cursor: pointer;
            margin: 0 3px;
            position: relative;
            top: 1px;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-title .w-e-active {
            color: #333;
            border-bottom: 1px solid #333;
            cursor: default;
            font-weight: 700;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content {
            padding: 10px 15px 10px 15px;
            font-size: 16px;
            /* 输入框的样式 */
            /* 按钮的样式 */
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content input:focus,
        .w-e-menu .w-e-panel-container .w-e-panel-tab-content textarea:focus,
        .w-e-menu .w-e-panel-container .w-e-panel-tab-content button:focus {
            outline: none;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content textarea {
            width: 100%;
            border: 1px solid #ccc;
            padding: 5px;
            margin-top: 10px;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content textarea:focus {
            border-color: #1e88e5;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content input[type=text] {
            border: none;
            border-bottom: 1px solid #ccc;
            font-size: 14px;
            height: 20px;
            color: #333;
            text-align: left;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content input[type=text].small {
            width: 30px;
            text-align: center;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content input[type=text].block {
            display: block;
            width: 100%;
            margin: 10px 0;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content input[type=text]:focus {
            border-bottom: 2px solid #1e88e5;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button {
            font-size: 14px;
            color: #1e88e5;
            border: none;
            padding: 5px 10px;
            background-color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.left {
            float: left;
            margin-right: 10px;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.right {
            float: right;
            margin-left: 10px;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.gray {
            color: #999;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.red {
            color: #c24f4a;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button:hover {
            background-color: #f1f1f1;
        }

        .w-e-menu .w-e-panel-container .w-e-panel-tab-content .w-e-button-container:after {
            content: "";
            display: table;
            clear: both;
        }

        .w-e-menu .w-e-panel-container .w-e-emoticon-container .w-e-item {
            cursor: pointer;
            font-size: 18px;
            padding: 0 3px;
            display: inline-block;
        }

        .w-e-menu .w-e-panel-container .w-e-up-img-container,
        .w-e-menu .w-e-panel-container .w-e-up-video-container {
            text-align: center;
        }

        .w-e-menu .w-e-panel-container .w-e-up-img-container .w-e-up-btn,
        .w-e-menu .w-e-panel-container .w-e-up-video-container .w-e-up-btn {
            display: inline-block;
            color: #999;
            cursor: pointer;
            font-size: 60px;
            line-height: 1;
        }

        .w-e-menu .w-e-panel-container .w-e-up-img-container .w-e-up-btn:hover,
        .w-e-menu .w-e-panel-container .w-e-up-video-container .w-e-up-btn:hover {
            color: #333;
        }
    </style>
    <style>
        .w-e-toolbar .w-e-droplist {
            position: absolute;
            left: 0;
            top: 0;
            background-color: #fff;
            border: 1px solid #f1f1f1;
            border-right-color: #ccc;
            border-bottom-color: #ccc;
        }

        .w-e-toolbar .w-e-droplist .w-e-dp-title {
            text-align: center;
            color: #999;
            line-height: 2;
            border-bottom: 1px solid #f1f1f1;
            font-size: 13px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list {
            list-style: none;
            line-height: 1;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list li.w-e-item {
            color: #333;
            padding: 5px 0;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list li.w-e-item:hover {
            background-color: #f1f1f1;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block {
            list-style: none;
            text-align: left;
            padding: 5px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block li.w-e-item {
            display: inline-block;
            padding: 3px 5px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block li.w-e-item:hover {
            background-color: #f1f1f1;
        }
    </style>
    <style>
        .w-e-text-container {
            overflow: hidden;
        }

        .w-e-img-drag-mask {
            position: absolute;
            z-index: 1;
            border: 1px dashed #ccc;
            box-sizing: border-box;
        }

        .w-e-img-drag-mask .w-e-img-drag-rb {
            position: absolute;
            right: -5px;
            bottom: -5px;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background: #ccc;
            cursor: se-resize;
        }

        .w-e-img-drag-mask .w-e-img-drag-show-size {
            min-width: 110px;
            height: 22px;
            line-height: 22px;
            font-size: 14px;
            color: #999;
            position: absolute;
            left: 0;
            top: 0;
            background-color: #999;
            color: #fff;
            border-radius: 2px;
            padding: 0 5px;
        }
    </style>
    <style>
        .w-e-table {
            display: flex;
        }

        .w-e-table .w-e-table-input {
            width: 40px;
            text-align: center !important;
            margin: 0 5px;
        }
    </style>
    <style>
        .w-e-full-screen-editor {
            position: fixed;
            width: 100% !important;
            height: 100% !important;
            left: 0;
            top: 0;
        }
    </style>
    <style>
        .w-e-content-mantle {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow-y: auto;
        }

        .w-e-content-mantle .w-e-content-preview {
            width: 100%;
            min-height: 100%;
            padding: 0 10px;
            line-height: 1.5;
        }

        .w-e-content-mantle .w-e-content-preview img {
            cursor: default;
        }

        .w-e-content-mantle .w-e-content-preview img:hover {
            box-shadow: none;
        }

        .w-e-menue-mantle {
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
        }
    </style>

    <style>
        .mainHeader {

            padding-top: 1px;
            padding-bottom: 1px;
            background-color: white !important;
            border-bottom: 5px solid #0b6cb8;
        }

        .toolbar {
            border: 1px solid #ccc;
        }

        .text {
            border: 1px solid #ccc;
            height: 500px;
        }
        #avatar {
            border-radius: 100%;
        }
    </style>

</head>

<body style="background-color: whitesmoke">

<%
    HttpSession httpSession = request.getSession();
    Userdata user_session = (Userdata) httpSession.getAttribute("user_session");
%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12" style="padding: 0">
            <nav class="navbar navbar-expand-lg navbar-light bg-light mainHeader">

                <div class="collapse navbar-collapse" id="navbarText">

                    <ul class="navbar-nav mr-auto"></ul>

                    <div class="avatar">
                        <img src="<%=user_session.getAvatar()%>" alt="" height="40px" width="40px" id="avatar">
                    </div>
                    <span class="navbar-nav">
                            <a class="nav-link navbar-item active">
                                您好, <%=user_session.getName()%> 欢迎访问~
                            </a>
                        </span>
                </div>
            </nav>

        </div>

    </div>

    <div class="row" style="min-height: 10px"></div>

    <div class="row">
        <div class="col-md-1">


        </div>

        <div class="col-md-2" style="padding-right: 0px">

            <div class="row">

                <div class="col-md-3"></div>

                <div class="col-md-9">
                    <div class="card">

                        <ul class="nav nav-pills nav-fill flex-column">
                            <li class="nav-item">
                                <a class="nav-link active list-group-item">发布知识点</a>
                            </li>
                        </ul>
                    </div>


                </div>
            </div>


        </div>

        <div class="col-md-6" style="padding-left: 0px">
            <div class="card">
                <div class="card-header" style="background-color: white">
                    <div class="row">
                        <div class="col-md-3" style="font-size: 18px">发布知识点</div>
                    </div>
                </div>

                <div class="card-body" style="min-height: 1000px">

                    <form action="EnterServlet" method="post">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="input-group mb-1 mt-2 ml-0 mr-1">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">标题</span>
                                    </div>
                                    <input id="titleInput" type="text" class="form-control" placeholder="请输入标题"
                                           style="margin-right: 5px" name="title">
                                </div>

                                <div class="input-group mb-1 mt-2 ml-0 mr-1">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">摘要</span>
                                    </div>
                                    <input id="abstractInput" type="text" class="form-control" placeholder="请输入摘要"
                                           style="margin-right: 5px" name="Abstract">
                                </div>

                                <div class="input-group mb-1 mt-2 ml-0 mr-1">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">分类</span>
                                    </div>
                                    <input id="categoriesInput" type="text" class="form-control" placeholder="请设置至少一个分类，如果多个，请使用英文逗号分隔"
                                           style="margin-right: 5px" name="category">
                                </div>

                            </div>

                        </div>


                        <div style="padding: 8px 0; color: #ccc"></div>

                        <div id="editor">
                            <div style="background-color:#FFF; border:1px solid #c9d8db; border-bottom:1px solid #EEE; z-index:10001;"
                                 class="w-e-toolbar" id="toolbar-elem43020064870014596">
                                <div class="w-e-menu" data-title="标题"><i class="w-e-icon-header"></i></div>
                                <div class="w-e-menu" data-title="加粗">
                                    <i class="w-e-icon-bold"></i>
                                </div>
                                <div class="w-e-menu" data-title="字号">
                                    <i class="w-e-icon-text-heigh"></i>
                                </div>
                                <div class="w-e-menu" data-title="字体">
                                    <i class="w-e-icon-font"></i>
                                </div>
                                <div class="w-e-menu" data-title="斜体">
                                    <i class="w-e-icon-italic"></i>
                                </div>
                                <div class="w-e-menu" data-title="下划线">
                                    <i class="w-e-icon-underline"></i>
                                </div>
                                <div class="w-e-menu" data-title="删除线">
                                    <i class="w-e-icon-strikethrough"></i>
                                </div>
                                <div class="w-e-menu" data-title="缩进">
                                    <i class="w-e-icon-indent-increase"></i>
                                </div>
                                <div class="w-e-menu" data-title="行高">
                                    <i class="w-e-icon-row-height"></i>
                                </div>
                                <div class="w-e-menu" data-title="文字颜色">
                                    <i class="w-e-icon-pencil2"></i>
                                </div>
                                <div class="w-e-menu" data-title="背景色">
                                    <i class="w-e-icon-paint-brush"></i>
                                </div>
                                <div class="w-e-menu" data-title="链接"><i class="w-e-icon-link"></i></div>
                                <div class="w-e-menu" data-title="序列">
                                    <i class="w-e-icon-list2"></i>
                                </div>
                                <div class="w-e-menu" data-title="待办事项">
                                    <i class="w-e-icon-checkbox-checked"></i>
                                </div>
                                <div class="w-e-menu" data-title="对齐"><i class="w-e-icon-paragraph-left"></i></div>
                                <div class="w-e-menu" data-title="引用">
                                    <i class="w-e-icon-quotes-left"></i>
                                </div>
                                <div class="w-e-menu" data-title="表情">
                                    <i class="w-e-icon-happy"></i>
                                </div>
                                <div class="w-e-menu" data-title="图片"><i class="w-e-icon-image"></i></div>
                                <div class="w-e-menu" data-title="视频">
                                    <i class="w-e-icon-play"></i>
                                </div>
                                <div class="w-e-menu" data-title="表格"><i class="w-e-icon-table2"></i></div>
                                <div class="w-e-menu" data-title="代码"><i class="w-e-icon-terminal"></i></div>
                                <div class="w-e-menu" data-title="分割线"><i class="w-e-icon-split-line"></i></div>
                                <div class="w-e-menu" data-title="撤销">
                                    <i class="w-e-icon-undo"></i>
                                </div>
                                <div class="w-e-menu" data-title="恢复">
                                    <i class="w-e-icon-redo"></i>
                                </div>
                                <div class="w-e-menu-tooltip w-e-menu-tooltip-up"
                                     style="visibility:hidden; z-index:10001;">
                                    <div class="w-e-menu-tooltip-item-wrapper">
                                        <div></div>
                                    </div>
                                </div>
                                <div class="w-e-menu" data-title="全屏">
                                    <i class="w-e-icon-fullscreen"></i>
                                </div>
                            </div>
                            <div style="border:1px solid #c9d8db; border-top:none; height:300px; z-index:10000;"
                                 class="w-e-text-container">
                            <textarea contenteditable="true" style="width:100%; height:100%;" class="w-e-text"
                                      id="text-elem41734206260716245" placeholder="请输入正文" name="content"></textarea>
                                <div class="w-e-img-drag-mask" style="display:none;">
                                    <div class="w-e-img-drag-show-size"></div>
                                    <div class="w-e-img-drag-rb"></div>
                                </div>
                            </div>
                        </div>


<%--                        <div class="row">--%>

<%--                            <div class="col-md-5">--%>
<%--                                <div class="input-group mb-3 mt-3 ml-0">--%>
<%--                                    <div class="input-group-prepend">--%>
<%--                                        <span class="input-group-text" id="inputGroup-sizing-default">知识点分类</span>--%>
<%--                                    </div>--%>
<%--                                    <input style="width: 100%" id="categoryInput" type="text" class="form-control" name="category" placeholder="请至少添加一个类别名，如果有个，请用英文逗号分隔">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="row" style="padding: 15px">

                            <div class="col-md-1"></div>
                            <div class="col-md-2 ml-0">
                                <button type="submit" class="btn btn-primary" id="publishBtn">发布</button>
                            </div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-light">返回</button>
                            </div>
                        </div>

                    </form>






                </div>

            </div>
        </div>

        <div class="col-md-2">
        </div>
    </div>

</div>

<!-- Code injected by live-server -->
<script type="text/javascript">
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }
            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    }
    else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script></body>

</html>
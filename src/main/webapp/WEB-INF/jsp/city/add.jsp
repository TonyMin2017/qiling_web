<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 2019/6/15
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有省的列表</title>
    <style>
        span{
            color:red;
            font-size: 36px;
        }
    </style>
    <%--bootstrap框架所有样式及库；--%>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <script src="/bootstrap/js/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1>添加城市 </h1>
            <span>${msg}</span>
        </div>
        <div class="panel-body">

            <form class="form-horizontal" action="/city/add.action" method="post">
                <div class="form-group form-group-lg">
                    <label class="col-sm-2 control-label" for="formGroupInputLarge">城市名称：</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" id="formGroupInputLarge" name="cname">
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 control-label" for="btn"> </label>
                    <div class="col-sm-10">

                        <button class="btn btn-primary btn-block btn-lg" id="btn">提交 保存</button>
                    </div>
                </div>
            </form>

        </div>

        <div class="panel-footer text-right">
            java1309
        </div>
    </div>
</div>

</body>
</html>

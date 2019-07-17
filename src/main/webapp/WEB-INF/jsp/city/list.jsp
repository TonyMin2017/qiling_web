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
    <title>所有城市的列表</title>
    <style>
        span{
            color:red;
            font-size: 24px;
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
            <h1>所有城市的列表</h1>
            <span id="msg"></span>
        </div>
        <div class="panel-body">

            <form  class="form-inline" id="searchFrm">
            <input type="hidden" id="pageIndex" name="pageIndex" />
            <input name="cityName" class="form-control" style="width: 200px;" id="cityName" placeholder="城市关键字" />
            <input name="provinceName" class="form-control" style="width: 200px;" id="provinceName" placeholder="省关键字。。。" />

            <a  href="javascript:searchCity(1)" class="btn btn-success">关键字查询</a>

            <a  href="javascript:addCity()" class="btn btn-success">新增城市</a>

            <a  href="javascript:deleteAll()" class="btn btn-danger">批量删除</a>

            </form>

            <table class="table table-striped table-bordered table-hover text-center">
                <tr>
                    <td><input type="checkbox"  id="all" />全选</td>

                    <td>城市ID</td>
                    <td>城市名称</td>
                    <td>所在省</td>
                    <td>操作</td>
                </tr>
                <tbody id="tb">

                </tbody>
            </table>

            <%--分页代码：--%>

            <nav aria-label="Page navigation">
                <ul class="pagination" id="pg">

                </ul>
            </nav>

        </div>

        <div class="panel-footer text-right">
            java1309
        </div>
    </div>



</div>




<%--模态框的代码 ；--%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加(修改)一个城市名称
                </h4>
            </div>
            <div class="modal-body">
                <!--放正文的地方； 不要用表单提交 ，也不要配置action! -->
                <form  id="myfrm" name="myFrm" class="form-horizontal">

                    <div class="form-group">
                        <label for="cname" class="col-md-4 control-label glyphicon glyphicon-user" >城市：</label>
                        <div class="col-md-6">
                            <%--隐藏域；--%>
                            <input  type="hidden" name="cid" id="cid" value="0" />
                            <input  class="form-control" name="cname" id="cname" placeholder="请输入城市名称。。。">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pid" class="col-md-4 control-label" >所在省：</label>
                        <div class="col-md-6">
                            <select id="pid"  name="pid"  class="form-control">

                            </select>
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-md-4 control-label">&nbsp;</label>
                        <div class="col-md-8">

                            <a href="javascript:saveCity()"  id="save" class="btn btn-success" style="font-size: 24px; text-shadow:black 5px 3px 3px">
                                 保存信息
                            </a>

                        </div>
                    </div>
                </form>


            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                 </button>
                 <button type="button" class="btn btn-primary">
                     提交更改
                 </button>-->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
<script>
    $(function () {
       loadAllcity(); //加载所有城市 ；


        //全选功能；
        $("#all").click(function () {
            $("[name='cids']").prop("checked",$("#all").is(":checked"));
        });


    });

    function loadAllcity() {
        //异步 加载所有城市 名称；
        $.get("/city/list.action",function (data) {
            var citys = "";
            $(data).each(function (i, v) {
                citys += "<tr>";
                citys += "<td> <input type='checkbox' name='cids'  value='"+v.cid+"'  />"+(i+1)+"</td>";
                citys += "<td>"+v.cid+"</td>";
                citys += "<td>"+v.cname+"</td>";
                citys += "<td>"+v.pname+"</td>";
                citys += "<td>";
                citys += "<a class='btn btn-success' href='javascript:updateCity("+v.cid+")'>修改</a>";
                citys += "<a class='btn btn-danger' href='javascript:deleteCity("+v.cid+")'>删除</a>";
                citys += "</td>";
                citys += "</tr>";
            });
            $("#tb").html(citys);
        },"json");
    }

    //删除一个城市 ；
    function deleteCity(cid) {

        //先调用 删除的接口；/city/delete.action?cid=
        $.get("/city/delete.action?cid="+cid,function (data) {
            // data:   {"errorCode":0,"errorMsg":"删除成功！"}
            $("#msg").text(data.errorMsg);
            loadAllcity(); //加载所有城市 ；
        },"json");

    }

    // 批量删除所有选中的城市 ；
    function deleteAll() {
        var arr = $("[name='cids']:checked");
        if(arr.length==0){
            alert("请至少选择一个要删除的数据！");
        }else{
            //表示有选中的项目： 真的开始异步调用 ：批量删除；
            var cids = new Array(); //定义一个数组；存储所有选中的cid;
            for (var i = 0; i < arr.length; i++) {
                //alert(arr[i].value);
                cids[i] = arr[i].value;
            }
            $.get("/city/deleteAll.action?cids="+cids,function (data) {
                $("#msg").text(data.errorMsg);  //显示 删除的结果；
                loadAllcity(); //加载所有城市 ；
            },"json");
        }
    }

    //添加城市 ；
    function addCity() {
        //重置表单信息；
        $("#cid").val("0"); //因为刚才执行了修改操作，所以cid有值，需要重置为0；
        document.forms[1].reset();   // myFrm : 表单的name;
        loadAllProvince(); //异步加载所有 省；下拉框；
        $("#myModal").modal("show");  //打开模态框 ；
    }

    //修改城市 ；
    function updateCity(cid) {
        //重置表单； document.forms[0].reset();

        $.get("/city/getCityByCid.action?cid="+cid,function (data) {  //data:当前城市信息；
            //通过异步调用后台 接口查询要修改的城市 的所有属性；

            $("#cid").val(data.cid); //隐藏域；
            $("#cname").val(data.cname); //文本域；
            //获取所有的省列表data2 ；赋值到下拉框中，但是有一个省是当前城市所在的省，所以要选中。
            $.get("/province/list.action",function (data2) {
                var ps = "";
                $(data2).each(function (i, v) {
                    if (data.pid==v.pid) {
                        //选中 当前 城市 所在省；
                        ps += "<option selected value='"+v.pid+"'>"+v.pname+"</option>"
                    }else{
                        ps += "<option value='"+v.pid+"'>"+v.pname+"</option>"
                    }
                });
                $("#pid").html(ps);
            },"json");

            //$("#pid").val(data.pid); //下拉框, 此行代码 不适用于下拉框，只适用文本框；

            $("#myModal").modal("show");  //打开模态框 ；

        },"json");
    }

    //异步加载所有 省；下拉框；
    function loadAllProvince() {
        $.get("/province/list.action",function (data) {
            var ps = "";
            $(data).each(function (i, v) {
                ps += "<option value='"+v.pid+"'>"+v.pname+"</option>"
            });
            $("#pid").html(ps);
        },"json");
    }


    //点击保存(新增 或 修改 )信息的时，需要执行的操作；
    function saveCity() {
        //异步 调用 后台 接口；
        // $("#cname").val() == document.getElementById("cname").value == document.myFrm.cname.value;
        $.post(
            "/city/save.action",
            $("#myfrm").serialize(), //所有参数传入到后台；
            function (data) {
                //显示 结果信息；
                $("#msg").text(data.errorMsg);

                // 关闭模态框；
                $("#myModal").modal("hide");

                loadAllcity(); //加载所有城市 ；

            },"json");
    }


    //按要求查询所有城市及所在省；
    function searchCity(pageIndex) {
        $("#pageIndex").val(pageIndex);
        $.get("/city/search.action",
            $("#searchFrm").serialize(),
            function (data) {
            var citys = "";
            $(data.rows).each(function (i, v) {
                citys += "<tr>";
                citys += "<td> <input type='checkbox' name='cids'  value='"+v.cid+"'  />"+(i+1)+"</td>";
                citys += "<td>"+v.cid+"</td>";
                citys += "<td>"+v.cname+"</td>";
                citys += "<td>"+v.pname+"</td>";
                citys += "<td>";
                citys += "<a class='btn btn-success' href='javascript:updateCity("+v.cid+")'>修改</a>";
                citys += "<a class='btn btn-danger' href='javascript:deleteCity("+v.cid+")'>删除</a>";
                citys += "</td>";
                citys += "</tr>";
            });
            $("#tb").html(citys);

            //加载分页标签：
            var pages = "";
            for (var i = 1; i <= data.pageTotals; i++) {
                pages += '<li><a href="javascript:searchCity('+i+')">'+i+'</a></li>';
            }
            $("#pg").html(pages);
        },"json");
    }
</script>


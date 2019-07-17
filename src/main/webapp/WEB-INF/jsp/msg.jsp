<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<html>
<head>
    <title>查看所有留言信息</title>
    <style type="text/css">
        .yb{
            border:0px blue dashed;
            width:180px;
            height:50px;
            line-height:50px;
            text-align:center;
            box-shadow: 5px 10px 5px #888888;
            border-radius:35px;
        }

    </style>
</head>
<!-- 引用bootstrap框架的核心样式； -->
<link type="text/css" rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">


<body style="margin: 50px">
<div class="progress progress-striped active">
    <div class="progress-bar progress-bar-success" role="progressbar"
         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
         style="width: 100%;">
        <span class="sr-only">100% 完成</span>
    </div>
</div>
<h3 class="text-center">在线留言：</h3>
<div class="progress progress-striped active">
    <div class="progress-bar progress-bar-success" role="progressbar"
         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
         style="width: 100%;">
        <span class="sr-only">100% 完成</span>
    </div>
</div>

<c:forEach items="${list}" var="m" varStatus="v">

  <div class="yb" style="border: 1px forestgreen solid; width: 100%; height:auto; margin-bottom: 10px;">
        <span>留言${v.index+1}：</span>

      <span>${m.msg}</span>

      <span>【by ${m.uname}】 (at: <fmt:formatDate value="${m.mdate}" pattern="yyyy-MM-dd HH:mm:ss" />)</span>
                <a role="button"  class="btn btn-success btn-sm"   href="#">
      <span class="badge pull-right">${fn:length(m.replyList)}</span>
      查看回复</a>
        <br/>
      <span id="${m.mid}" style="border: 1px green dashed; width: 80%; height: auto; display: none">

          <c:if test="${m.replyList!=null && fn:length(m.replyList)>0}">
              <c:forEach items="${m.replyList}" var="re" varStatus="vs">

              <span style="border: 1px green dashed; width: 70%; height: auto;">
                    回复${vs.index+1}：${re.rmsg}  【by ${re.rname}】 (at: <fmt:formatDate value="${re.rdate}" pattern="yyyy-MM-dd HH:mm:ss" />)
              </span>

                <br/>

              </c:forEach>

          </c:if>

           <c:if test="${m.replyList==null || fn:length(m.replyList) == 0}">
                    <span style="border: 1px green dashed; width: 70%; height: auto;">
                            无回复。
                    </span>
           </c:if>


            <form class="form-horizontal" role="form"  action="addReply.action"  method="post">
                <div class="form-group">
                    <div class="col-sm-2 text-right">用户：</div>
                    <div class="col-sm-10">
                        <input type="hidden" name="mid" value="${m.mid}"/>
                        <input type="text" name="rname" class="form-control" id="frstname" placeholder="请输入用户,默认为匿名用户！">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2  text-right">回复：</div>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="rmsg" rows="5"  >请输入回复内容：。</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success btn-lg" style="width: 100%">我也要回复此留言</button>
                    </div>
                </div>
            </form>
      </span>
  </div>

</c:forEach>




<div class="yb" style="border: 1px green solid; width:100%; height:auto; margin-top: 20px; padding: 30px; background-color: darkseagreen" >

    <form class="form-horizontal" role="form"  action="addMsg.action"  method="post">
        <div class="form-group">
            <div class="col-sm-2 text-right">用户：</div>
            <div class="col-sm-10">
                 <input type="text" name="uname" class="form-control" id="firstname" placeholder="请输入用户,不输为匿名用户！">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2  text-right">内容：</div>
            <div class="col-sm-10">
                 <textarea class="form-control" name="msg" rows="5"  >请输入留言内容：比如拥抱互联的伙食不错。天天有虾还有鸭。</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <button type="submit" class="btn btn-success btn-lg" style="width: 100%">我也要留言</button>
            </div>
        </div>
    </form>

</div>
</body>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
   $(function(){
       $("a").toggle(function(){
           $(this).next().next().show();
       },function(){
           $(this).next().next().hide();
       });
   });
</script>

</html>

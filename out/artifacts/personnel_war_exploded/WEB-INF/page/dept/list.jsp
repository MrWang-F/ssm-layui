<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>人事管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <script type="text/javascript" src="${ctx}/public/lib/layui_exts/excel.js"></script>
      <script type="text/javascript" src="${ctx}/public/lib/layui_exts/excel.min.js"></script>
      <style>

          #pagenum{

              height: 40px;
              width: 350px;
              position: absolute;
              left: 38%;
              border: #009688 2px solid;

              /*background-color: #690;*/

          }

          #pagenum ul {
              list-style: none;
              margin-left: 50px;
          }

          #pagenum li {
              display: inline;
              line-height: 40px;
              float:left
          }

          #pagenum ul li a {
              height: 30px;
              text-decoration: none;
              padding: 5px 5px;
              display: block;
              border:#009688  1px solid;
          }

          #pagenum a:hover {
              background-color:#009688;
          }
      </style>

  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row" style="" align="center">
          <form class="layui-form layui-col-md12 x-so" method="get" action="${ctx }/dept/list">
          <input type="text" name="content" style="width:50%;"  placeholder="请输入查找内容" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
<%--      <xblock>--%>
<%--&lt;%&ndash;        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <button class="layui-btn" onclick="x_admin_show('添加用户','${ctx}/dept/add')"><i class="layui-icon"></i>添加</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span class="x-right" style="line-height:40px">共有数据：88 条</span>&ndash;%&gt;--%>
<%--      </xblock>--%>
     
      
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>部门名称</th>
            <th>详细信息</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="dept" varStatus="stat">
     <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${dept.id}</td>
            <td>${dept.name }</td>
            <td>${dept.remark }</td>
            
           <!--  <td class="td-status">
              <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td> -->
            <td class="td-manage">
<%--              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">--%>
<%--                <i class="layui-icon">&#xe601;</i>--%>
<%--              </a>--%>
<%--              <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/dept/add?id=${dept.id}');" href="javascript:;">--%>
<%--                <i class="layui-icon">&#xe642;</i>--%>
<%--              </a>--%>

                <a title="编辑"  href="${ctx}/dept/add?id=${dept.id}">
                    <i class="layui-icon" >&#xe642;</i>
                </a>

              <a title="删除" onclick="member_del(this,'${dept.id }')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>

			</c:forEach>

        </tbody>
      </table>

<div id="pagenum">
        <ul class="pagination">
            <li><a href="${ctx }/dept/list?page=1&size=5" aria-label="Previous">首页</a></li>
            <li><a href="${ctx }/dept/list?page=${pageInfo.pageNum-1}&size=5">上一页</a></li>
            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                <li><a href="${ctx }/dept/list?page=${pageNumber}&size=5">${pageNumber}</a></li>
            </c:forEach>
            <li><a href="${ctx }/dept/list?page=${pageInfo.pageNum+1}&size=5">下一页</a></li>
            <li><a href="${ctx }/dept/list?page=${pageInfo.pages}&size=5" aria-label="Next">尾页</a></li>
        </ul>
</div>


    </div>
<%--    <script type="text/javascript" src="${ctx}/public/lib/layui_exts/excel.js"></script>--%>
<%--    <script type="text/javascript" src="${ctx}/public/lib/layui_exts/excel.min.js"></script>--%>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      layui.use('laypage', function(){
          var laypage = layui.laypage;
          <%--var num  = $.get("${ctx}/dept/count?id="+dept_id);--%>
          //执行一个laypage实例
          laypage.render({
              elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
              ,count: 50,//数据总数，从服务端得到
              limit:10
          });
      });


       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${ctx}/dept/delete?id="+id);
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();
    </script>
  </body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>员工列表</title>
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
        <a>
          <cite>员工列表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${ctx }/employee/list" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="get" action="${ctx }/employee/list">
          <!-- <input class="layui-input" placeholder="开始日" name="start" id="start">
          <input class="layui-input" placeholder="截止日" name="end" id="end"> -->
          <input type="text" name="content" style="width:50%;"  placeholder="请输入查找内容" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>姓名</th>
            <th>性别</th>
           <th>手机号码</th>
           <th>邮箱</th>
           <th>职位</th>
           <th>学历</th>
           <th>身份证号码</th>
           <th>部门</th>
           <th>联系地址</th>
           <th>建档日期</th>
         <!-- <th>状态</th> -->
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="emp" varStatus="stat">
     <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${emp.name }</td>
            <td>${emp.sex }</td>
            <td>${emp.phone }</td>
            <td>${emp.email }</td>
            <td>${emp.job.name }</td>
            <td>${emp.education }</td>
            <td>${emp.card_id }</td>
            <td>${emp.dept.name }</td>
            <td>${emp.address }</td>
            <td>${emp.create_date }</td>
            

            <td class="td-manage">

              <%-- <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/job/add?id=${dept.id }');" href="javascript:;"> --%>
              <a title="编辑"  href="${ctx}/employee/add?id=${emp.id }">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,'${emp.id}')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>



            </td>
          </tr>
				
			</c:forEach>
        
          
          
          
        </tbody>
      </table>

        <div id="pagenum">
            <ul class="pagination">
                <li><a href="${ctx }/employee/list?page=1&size=5" aria-label="Previous">首页</a></li>
                <li><a href="${ctx }/employee/list?page=${pageInfo.pageNum-1}&size=5">上一页</a></li>
                <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                    <li><a href="${ctx }/employee/list?page=${pageNumber}&size=5">${pageNumber}</a></li>
                </c:forEach>
                <li><a href="${ctx }/employee/list?page=${pageInfo.pageNum+1}&size=5">下一页</a></li>
                <li><a href="${ctx }/employee/list?page=${pageInfo.pages}&size=5" aria-label="Next">尾页</a></li>
            </ul>
        </div>

    </div>
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
              $.get("${ctx}/employee/delete?id="+id);
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
      })();</script>
  </body>

</html>
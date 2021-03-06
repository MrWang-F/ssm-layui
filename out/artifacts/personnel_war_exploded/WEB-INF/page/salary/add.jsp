<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加员工</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
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
</head>

<body>
<div class="x-body">
    <form class="layui-form" method="POST" id="empForm"  action="${ctx}/salary/add">
        <input type="hidden" name="id" id="id" value="${salary.id }" >
        <div class="layui-form-item" >
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${salary.name }">
            </div>

        </div>

        <div class="layui-form-item" >
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>出勤
            </label>
            <div class="layui-input-inline">
                <input type="text" id="card_id" name="card_id" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${salary.card_id }">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>加班工资
            </label>
            <div class="layui-input-inline">
                <input type="text" id="education" name="education" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${salary.email}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>基本工资
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${salary.education}">
            </div>
        </div>
                <div class="layui-form-item">
                    <label for="phone" class="layui-form-label">
                        <span class="x-red">*</span>月份
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="test3" name="address" required="" lay-verify="required"
                               autocomplete="off" class="layui-input" value="${salary.address }">
                    </div>
                </div>

        <div class="layui-form-item" >
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>职位
            </label>
            <div class="layui-input-inline" lay-filter="test1" >
                <select id="job_id" name="job_id" class="valid" >
                    <c:forEach items="${requestScope.job_list}" var="line" varStatus="stat">
                        <option value="${line.id}" <c:if test="${job.id == line.id }">selected</c:if>>${line.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>



        <div class="layui-form-item" >
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>部门
            </label>
            <div class="layui-input-inline" lay-filter="test2">
                <select id="dept_id" name="dept_id" class="valid">
                    <c:forEach items="${requestScope.dept_list}" var="line" varStatus="stat">
                        <option value="${line.id}" <c:if test="${dept.id == line.id }">selected</c:if>>${line.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>

        </div>
    </form>
</div>
<script type="text/javascript" src="layui.js"></script>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        form.render();
        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){

            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                document.getElementById('empForm').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);

            });
            return false;
        });


    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });
    });


    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>

</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>发布页</title>
    <style type="text/css">
        .myDiv {
            margin-top: 40px;
        }
    </style>
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
    <link href="${path}/static/css/user/jquery.slideBox.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${path}/static/css/user/show.css">
    <link rel="stylesheet" href="${path}/static/element/index.css">
    <script src="${path}/static/js/user/jquery-2.2.3.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/static/js/user/jquery.slideBox.min.js" type="text/javascript"></script>
    <script src="${path}/static/js/user/jquery.comment.js"></script>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>

<div id="app" style="margin: 20px">
    <el-form ref="ruleForm" :model="form" label-width="80px">
        <el-form-item label="标题">
            <el-input v-model="form.title" style="width: 450px"></el-input>
        </el-form-item>
        <el-form-item label="内容">
            <el-input v-model="form.content" type="textarea" style="width: 450px"></el-input>
        </el-form-item>
        <el-form-item label="状态">
            <el-radio-group v-model="form.status">
                <el-radio label="已找到"></el-radio>
                <el-radio label="未找到"></el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="地址">
            <el-input v-model="form.addr" style="width: 450px"></el-input>
        </el-form-item>
        <el-form-item label="时间">
            <el-date-picker
                    v-model="form.time"
                    type="date"
                    placeholder="选择日期">
            </el-date-picker>
        </el-form-item>
        <el-form-item label="手机号">
            <el-input v-model="form.phone" style="width: 450px"></el-input>
        </el-form-item>

        <el-form-item>
            <el-button type="primary" @click="submitForm">立即创建</el-button>
            <el-button @click="resetForm">重置</el-button>
        </el-form-item>
    </el-form>


</div>


<!-- 开发环境版本，包含了有帮助的命令行警告 -->
<script src="${path}/static/js/vue.js"></script>
<!-- import Vue before Element -->
<script src="${path}/static/element/lib-index.js"></script>
<script src="${path}/static/js/axios.min.js"></script>
<style>
    @import url("//unpkg.com/element-ui@2.15.6/lib/theme-chalk/index.css");
</style>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                form: {
                    username: '',
                    userid: '',
                    title: '',
                    content: '',
                    status: ''

                }
            }
        },
        methods: {
            submitForm() {
                const user = '<%=session.getAttribute("user")%>';
                const userId = user.substring(user.lastIndexOf("id") + 3, user.indexOf(","));
                const username = user.substring(user.lastIndexOf("userName") + 9, user.indexOf(",", 11));
                this.form.username = username;
                this.form.userid = userId;
                if (this.form.status == '已找到') {
                    this.form.status = 1
                } else {
                    this.form.status = 0
                }
                if (user != "null") {
                    axios.post('${path}/publish/create', this.form).then(res => {
                        window.location.href = '${path}/publish/myPublishPage'
                    })
                }else{
                    this.$message({
                        showClose: true,
                        message:"请先登录"
                    })
                }


            },
            resetForm() {
                this.form = {}
            }
        }
    })
</script>
</body>
</html>



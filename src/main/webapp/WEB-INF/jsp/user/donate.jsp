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
    <title>${title}</title>
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
        <el-form-item label="我想说">
            <el-input v-model="form.say" style="width: 450px"></el-input>
        </el-form-item>
        <el-form-item v-if="title == 'money'" label="金额/￥">
            <el-slider
                    v-model="form.money"
                    show-input
            :min="10"
            :max="1000"
            style="width: 60%">
            </el-slider>
        </el-form-item>
        <el-form-item v-if="title == 'goods'" label="物品">
            <el-input v-model="form.goods" style="width: 450px"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
            <el-input v-model="form.email" style="width: 450px"></el-input>
        </el-form-item>
        </el-form-item>

        <el-form-item>
            <el-button type="primary" @click="submitForm">捐赠</el-button>
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
        created(){
            this.getTitle()
        },
        data() {
            return {
                form: {
                    username: '',
                    userid: '',
                    say:'',
                    money: 0,
                    goods: '',
                    email: ''

                },
                title:''
            }
        },
        methods: {
            submitForm() {
                const user = '<%=session.getAttribute("user")%>';
                const userId = user.substring(user.lastIndexOf("id") + 3, user.indexOf(","));
                const username = user.substring(user.lastIndexOf("userName") + 9, user.indexOf(",", 11));
                this.form.username = username;
                this.form.userid = userId;
                if (user != "null") {
                    axios.post('${path}/donate/create', this.form).then(res => {
                        this.$message({
                            message: '恭喜你，捐赠成功',
                            type: 'success'
                        });
                        setTimeout(function (){
                            window.location.href = '${path}/user/index'
                        },1000)
                    })
                }else{
                    this.$message("请先登录")
                }


            },
            resetForm() {
                this.form = {}
            },
            getTitle(){
                const title = '<%=session.getAttribute("title")%>';
                this.title = title;
            }
        }
    })
</script>
</body>
</html>



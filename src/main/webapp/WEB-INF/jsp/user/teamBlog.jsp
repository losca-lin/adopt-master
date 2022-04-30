<%-- Created by IntelliJ IDEA. Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>团队博客</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="UTF-8"/>
    <meta name="keywords" content=""/>
    <style type="text/css">


        .myfont {
            font-size: 10px;
            color: red;
        }

        .blog-full-wthree {
            background: rgb(255 255 255 / 37%);
        }
    </style>
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link
            rel="stylesheet"
            href="${path}/static/bootstrap/css/bootstrap.css"
            type="text/css"
            media="all"
    />
    <!-- Owl-Carousel-CSS -->
    <link
            rel="stylesheet"
            href="${path}/static/css/user/blog.css"
            type="text/css"
            media="all"
    />
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div id="app">
    <div>
        <el-carousel :interval="4000" indicator-position="outside" style="
    width: 80%;
    margin:50px">
            <el-carousel-item v-for="item in tableData" :key="item.id">
                <h2 class="medium" style="font-weight: bold">标题：{{ item.title }}</h2>
                <h3 class="medium">事件：{{ item.event }}</h3>
                <h3 class="medium">地点：{{ item.address }}</h3>
                <h3 class="medium">人物：{{ item.peoples }}</h3>
                <h3 class="medium">时间：{{ item.actionTime }}</h3>
            </el-carousel-item>
        </el-carousel>
    </div>
    <div class="publishCard">
        <el-card class="box-card" v-for="(item2,index2) in tableData2" :key="index2">
            <div>
                <h2 class="medium" style="font-weight: bold">标题：{{ item2.title }}</h2>

                <h3 class="medium">内容：{{ item2.content }}</h3>
                <h3 class="medium">状态：{{ item2.status==0?'丢失':'找到' }}</h3>
                <h3 class="medium">地址：{{ item2.addr }}</h3>
                <h3 class="medium">时间：{{ item2.time }}</h3>
                <h3 class="medium">手机号：{{ item2.phone }}</h3>
                <h3 class="medium">用户名：{{ item2.username }}</h3>
            </div>
        </el-card>
    </div>

</div>
<%--<jsp:include page="slider.jsp"></jsp:include>--%>


<!-- 开发环境版本，包含了有帮助的命令行警告 -->
<script src="${path}/static/js/vue.js"></script>
<!-- import Vue before Element -->
<script src="${path}/static/element/lib-index.js"></script>
<script src="${path}/static/js/axios.min.js"></script>
<style>
    @import url("//unpkg.com/element-ui@2.15.6/lib/theme-chalk/index.css");

    .text {
        font-size: 14px;
    }

    .publishCard {
        display: flex;
        flex-wrap: wrap;
    }

    .box-card {
        width: 33.33%;
        margin-left: 50px;
        margin-top: 10px;
    }

    .el-carousel__item h2, h3 {
        color: #030303;
        font-size: 24px;
        padding-left: 10px;

    }

    .el-carousel__item:nth-child(2n) {
        background-color: #f3d5ff;
    }

    .el-carousel__item:nth-child(2n+1) {
        background-color: #d3dce6;
    }

    .item {
        margin-bottom: 18px;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both
    }

    .box-card {
        width: 480px;
    }

    .demo-table-expand {
        font-size: 0;
    }

    .demo-table-expand label {
        width: 90px;
        color: #99a9bf;
    }

    .demo-table-expand .el-form-item {
        margin-right: 0;
        margin-bottom: 0;
        width: 50%;
    }
</style>
<script>


    new Vue({
        el: '#app',
        data() {
            return {
                tableData: [],
                tableData2: []

            }
        },
        created() {
            this.getAll()
        },
        methods: {
            getAll() {
                axios.get("${path}/blog/getAll").then(res => {
                    console.log(res)
                    this.tableData = res.data.data
                })
                axios.get("${path}/admin/getAllPublish").then(res => {
                    console.log(res)
                    this.tableData2 = res.data.data
                })
            },

        }
    })
</script>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的发布</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8"/>
    <meta name="keywords" content=""/>
    <style type="text/css">
        /*#blog {*/
        /*    !*background: url(/static/images/login/bg3.jpg) no-repeat center fixed;*!*/
        /*    !*background-size: cover;*!*/
        /*    !*-webkit-background-size: cover;*!*/
        /*    !*-moz-background-size: cover;*!*/
        /*    !*-o-background-size: cover;*!*/
        /*    !*-ms-background-size: cover;*!*/
        /*    !*position: relative;*!*/
        /*}*/

        .myfont {
            font-size: 10px;
            color: red;
        }
    </style>
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/style.css" type="text/css" media="all"/>

</head>
<body>
<jsp:include page="navigation.jsp"/>
<!-- blog -->
<div class="blog" id="blog">
    <div class="container">
        <h3 class="agile-title">我的发布</h3>
        <div id="app">
            <el-table
                    :data="publishData"
                    style="width: 100%">
                <el-table-column type="expand">
                    <template slot-scope="props">
                        <el-form label-position="left" inline class="demo-table-expand">

                            <el-form-item label="内容" style="margin: 20px">
                                <span>{{ props.row.content }}</span>
                            </el-form-item>
                        </el-form>
                    </template>
                </el-table-column>
                <el-table-column
                        label="编号"
                        prop="id">
                </el-table-column>
                <el-table-column
                        label="标题"
                        prop="title">
                </el-table-column>
                <el-table-column
                        label="时间"
                        prop="time">
                </el-table-column>
                <el-table-column
                        label="地点"
                        prop="addr">
                </el-table-column>
                <el-table-column
                        label="状态"
                >
                    <template slot-scope="scope">
                        <el-tag
                                :type="scope.row.status== 0?'danger':'success'"
                        >{{ scope.row.status==0?"丢失":"找到" }}
                        </el-tag>
                    </template>

                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">

                        <el-button
                                type="text"
                                @click="handleUpdate(scope.$index, scope.row)"
                                icon="el-icon-edit"
                        >修改
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>

            <el-dialog title="详情" :visible.sync="editVisible" width="50%">
                <el-form ref="form" :model="form" label-width="70px">

                    <el-form-item label="标题">
                        <el-input v-model="form.title"></el-input>
                    </el-form-item>
                    <el-form-item label="内容">
                        <el-input type='textarea' v-model="form.content"></el-input>
                    </el-form-item>

                    <el-form-item label="状态">
                        <template slot-scope="scope">
                            <el-select v-model="form.status" placeholder="请选择">
                                <el-option
                                        v-for="(name,index) in options"
                                        :key="index"
                                        :label="name[index]"
                                        :value="index">
                                </el-option>

                            </el-select>
                        </template>
                    </el-form-item>


                </el-form>
                <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveEdit">确 定</el-button>
            </span>
            </el-dialog>

        </div>

    </div>
</div>

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
                publishData: [],
                editVisible: false,
                form: {},
                options: [
                    {0: '丢失'},
                    {1: '找到'},
                ]

            }
        },
        created() {
            this.getPublishData()
        },
        methods: {
            getPublishData() {
                const user = '<%=session.getAttribute("user")%>';
                const userId = user.substring(user.lastIndexOf("id") + 3, user.indexOf(","));
                if (userId != 'nu' && userId != '') {
                    axios.get("${path}/publish/getPublishData", {
                        params: {userId: userId}
                    }).then(res => {
                        console.log(res)
                        this.publishData = res.data.data;
                    })
                } else {
                    this.$message(
                        {
                            showClose: true,
                            message: "用户暂未登录"
                        }
                    )
                }
            },
            handleUpdate(index, row) {
                this.editVisible = true;
                this.form = row;
            },
            saveEdit() {
                axios.post("${path}/admin/updatePublishById", this.form).then(res => {
                    this.editVisible = false;
                    this.getAll();
                })
            }

        }
    })
</script>

</body>
</html>

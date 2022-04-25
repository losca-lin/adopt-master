<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8"/>
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${path}/static/css/admin/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${path}/static/css/admin/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/static/css/admin/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${path}/static/css/admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/static/css/admin/boot-crm.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${path}/static/element/index.css">
    <style>
        .panel-heading {
            background-color: #337ab7;
            border-color: #2e6da4;
            font-size: 14px;
            padding-left: 20px;
            height: 36px;
            line-height: 36px;
            color: white;
            position: relative;
            cursor: pointer;
        }

        /*转成手形图标*/
        .panel-heading span {
            position: absolute;
            right: 10px;
            top: 12px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">流浪猫狗管理系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="/admin/developing">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user ">
                    <li>
                        <input type="hidden" id="currentAdminId" value="${admin.id}">
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-user fa-fw"></i>
                        管理员：${admin.adminName}</a>
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${path}/admin/logout">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <jsp:include page="/admin/nav"/>
    </nav>
    <div id="app" style="margin-left: 250px;margin-top: 20px;">
        <el-table
                :data="tableData"
                style="width: 100%"
                >
            <el-table-column
                    prop="id"
                    label="编号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="用户姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="title"
                    label="标题">
            </el-table-column>
            <el-table-column
                    prop="content"
                    label="内容">
            </el-table-column>
            <el-table-column label="状态">
                <template slot-scope="scope">
                    <el-tag
                            :type="scope.row.status== 0?'danger':'success'"
                    >{{ scope.row.status==0?"丢失":"找到" }}
                    </el-tag>
                </template>
            </el-table-column>

            <el-table-column label="操作" width="180" align="center">
                <template slot-scope="scope">

                    <el-button
                            type="text"
                            @click="handleDel(scope.$index, scope.row)"
                    >删除
                    </el-button>

                    <el-button
                            type="text"
                            @click="handleUpdate(scope.$index, scope.row)"
                    >修改
                    </el-button>


                </template>
            </el-table-column>
        </el-table>

        <!-- 编辑弹出框 -->
        <el-dialog title="详情" :visible.sync="editVisible" width="30%">
            <el-form ref="form" :model="form" label-width="70px">
                <el-form-item label="用户名">
                    <el-input v-model="form.username"></el-input>
                </el-form-item>
                <el-form-item label="标题">
                    <el-input v-model="form.title"></el-input>
                </el-form-item>
                <el-form-item label="内容">
                    <el-input type='textarea' v-model="form.content" ></el-input>
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
        created() {
            this.getAll()
        },
        data() {
            return {
                tableData: [],
                editVisible: false,
                form:{},
                options:[
                    {0:'丢失'},
                    {1:'找到'},
                ]

            }
        },
        methods: {
            getAll() {
                axios.get('${path}/admin/getAllPublish').then(res => {
                    console.log(res)
                    if (res.data.code == 200) {
                        this.tableData = res.data.data
                    }
                })
            },
            handleDel(index,row){
                axios.get("${path}/admin/delPublishById",{
                    params:{id:row.id}
                }).then(res=>{
                    this.$message("删除成功");
                    this.getAll()
                })
            },
            handleUpdate(index,row){
                this.form = row
                this.editVisible = true
            },
            saveEdit(){
                axios.post("${path}/admin/updatePublishById",this.form).then(res=>{
                       this.editVisible = false;
                       this.getAll();
                })
            }
        }
    })
</script>
</body>
</html>
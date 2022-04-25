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
        <div class="wy-filter">
            <el-input v-model="query.value" size="small" placeholder="请输入品牌或者类型" style="width: 250px"></el-input>
            <el-button type="success" size="small" plain icon="el-icon-search" @click="find">查询</el-button>
            <el-button style="float:right" type="primary" size="small" plain icon="el-icon-plus"
                       @click="add"></el-button>
        </div>
        <el-table
                :data="tableData.list"
                style="width: 100%"
                :row-class-name="tableRowClassName"
        >
            <el-table-column type="expand">
                <template slot-scope="scope">
                    <div v-html="scope.row.describe" style="margin-left: 10px"></div>
                </template>
            </el-table-column>
            <el-table-column
                    prop="id"
                    label="编号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="type"
                    label="类型"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="brand"
                    label="品牌">
            </el-table-column>

            <el-table-column label="链接">
                <template slot-scope="scope">
                    <el-link type="primary" :href="scope.row.link">点击链接</el-link>
                </template>

            </el-table-column>
            <el-table-column label="商品图片" align="center">
                <template slot-scope="scope">
                    <el-image
                            class="table-td-thumb"
                            fit="contain"
                            style="width: 100px; height: 100px"
                            :src="'${path}/static/images/ad/' + scope.row.pic"
                            :preview-src-list="['${path}/static/images/ad/' + scope.row.pic]"
                    ></el-image>
                </template>
            </el-table-column>

            </el-table-column>

            <el-table-column label="操作" width="180" align="center">
                <template slot-scope="scope">

                    <el-button
                            type="text"
                            @click="handleDel(scope.$index, scope.row)"
                            icon="el-icon-delete"
                    >删除
                    </el-button>

                    <el-button
                            type="text"
                            @click="handleUpdate(scope.$index, scope.row)"
                            icon="el-icon-edit"
                    >修改
                    </el-button>


                </template>
            </el-table-column>
        </el-table>
        <el-pagination
                style="margin-top: 10px;"
                background
                :current-page.sync="query.pageNum"
                :page-count="tableData.pages"
                layout="prev,pager,next"
                @current-change="getAll"></el-pagination>

        <!-- 编辑弹出框 -->
        <el-dialog title="详情" :visible.sync="editVisible" width="30%">
            <el-form ref="form" :model="form" label-width="70px">
                <el-form-item label="品牌">
                    <el-input v-model="form.brand" disabled></el-input>
                </el-form-item>
                <el-form-item label="描述">
                    <el-input v-model="form.describe" type='textarea'></el-input>
                </el-form-item>
                <el-form-item label="链接">
                    <el-input v-model="form.link"></el-input>
                </el-form-item>
                <el-form-item label="商品图片">
                    <el-upload v-model="form.file" action="#" list-type="picture-card" :auto-upload="false"
                               :multiple="false" :on-change="changeIcon" :on-remove="removeIcon" :limit="1">
                        <i slot="default" class="el-icon-plus"></i>
                    </el-upload>
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

    .wy-filter {
        margin: 20px;
    }

    .el-table .warning-row {
        background: oldlace;
    }
    input[type=file] {
        display: none;
    }

    .el-table .success-row {
        background: #f0f9eb;
    }
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
                query: {
                    value: '',
                    pageNum: 1,
                    pageSize: 5
                },
                editVisible: false,
                addVisible: false,
                form: {
                    brand:'',
                    describe:'',
                    link:'',
                    file:null
                },
                addForm: {},

            }
        },
        methods: {
            changeIcon(file) {
                this.form.file = file.raw
            },
            removeIcon() {
                this.form.file = null
            },
            tableRowClassName({row, rowIndex}) {
                if (rowIndex === 1) {
                    return 'warning-row';
                } else if (rowIndex === 3) {
                    return 'success-row';
                }
                return '';
            },
            getAll() {
                axios.get('${path}/ad/allAds', {
                    params: this.query
                }).then(res => {
                    console.log(res)
                    if (res.data.code == 200) {
                        this.tableData = res.data.data
                    }
                })
            },
            handleDel(index, row) {
                axios.get("${path}/ad/delAd", {
                    params: {id: row.id}
                }).then(res => {
                    this.$message("删除成功");
                    this.getAll()
                })
            },
            handleUpdate(index, row) {
                this.form = row
                this.editVisible = true
            },
            saveEdit() {
                const data = new FormData();
                for(const key in this.form){
                    data.append(key,this.form[key])
                }
                axios.post("${path}/ad/updateAd", data).then(res => {
                    this.getAll();
                    this.editVisible = false;
                })
            },
            find() {
                this.getAll()
            },
            add() {
                this.addVisible = true
            },
            addEdit() {
                axios.post("${path}/admin/addMoneyById", this.addForm).then(res => {
                    this.addVisible = false;
                    this.getAll();
                })
            },
            downExcel() {

            }
        }
    })
</script>

</body>
</html>
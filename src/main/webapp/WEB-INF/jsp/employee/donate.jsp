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
    <jsp:include page="/employee/nav" />
    <div id="app" style="margin-left: 250px;margin-top: 20px;">
        <div class="wy-filter">
            <el-input v-model="query.value" size="small" placeholder="请输入姓名" style="width: 250px"></el-input>
            <el-button type="success" size="small" plain icon="el-icon-search" @click="find">查询</el-button>
            <el-button style="float:right" type="primary" size="small" plain icon="el-icon-plus"
                       @click="add"></el-button>

        </div>
        <el-table
                :data="tableData.list"
                style="width: 100%"
                :row-class-name="tableRowClassName"
        >
            <el-table-column
                    prop="id"
                    label="编号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="用户名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="money"
                    label="捐款">
            </el-table-column>
            <el-table-column
                    label="捐物">
                <template slot-scope="scope">
                    <span v-if="scope.row.goods == ''">暂未捐</span>
                    <span v-else>{{scope.row.goods}}</span>
                </template>
            </el-table-column>
            <el-table-column label="邮箱" prop="email">

            </el-table-column>
            <el-table-column label="想说" prop="say">

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
                <el-form-item label="时间">
                    <el-date-picker
                            v-model="form.time"
                            type="date"
                            placeholder="选择日期"
                    >
                    </el-date-picker>
                </el-form-item>
                <el-form-item label="支出类别">
                    <el-input v-model="form.zhichuleibie"></el-input>
                </el-form-item>
                <el-form-item label="金额">
                    <el-input v-model="form.jine"></el-input>
                </el-form-item>
                <el-form-item label="描述">
                    <el-input type='textarea' v-model="form.miaoshu"></el-input>
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
                    pageSize: 8
                },
                editVisible: false,
                addVisible: false,
                form: {},
                addForm: {}

            }
        },
        methods: {
            tableRowClassName({row, rowIndex}) {
                if (rowIndex === 1) {
                    return 'warning-row';
                } else if (rowIndex === 3) {
                    return 'success-row';
                }
                return '';
            },
            getAll() {
                axios.get('${path}/donate/getAll', {
                    params: this.query
                }).then(res => {
                    console.log(res)
                    if (res.data.code == 200) {
                        this.tableData = res.data.data
                    }
                })
            },
            handleDel(index, row) {
                axios.get("${path}/admin/deleteMoneyById", {
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
                axios.post("${path}/admin/updateMoneyById", this.form).then(res => {
                    this.editVisible = false;
                    this.getAll();
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

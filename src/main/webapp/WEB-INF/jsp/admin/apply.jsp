<%-- Created by IntelliJ IDEA. User: 24255 Date: 2022/3/22 Time: 23:49 To change
this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link
      href="${path}/static/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- MetisMenu CSS -->
    <link href="${path}/static/css/admin/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link
      href="${path}/static/css/admin/dataTables.bootstrap.css"
      rel="stylesheet"
    />
    <!-- Custom CSS -->
    <link href="${path}/static/css/admin/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <!-- <link
      href="${path}/static/css/admin/font-awesome.min.css"
      rel="stylesheet"
      type="text/css"
    /> -->
    <link
      href="${path}/static/css/admin/boot-crm.css"
      rel="stylesheet"
      type="text/css"
    />
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
      } /*转成手形图标*/
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
      <nav
        class="navbar navbar-default navbar-static-top"
        role="navigation"
        style="margin-bottom: 0"
      >
        <div class="navbar-header">
          <a class="navbar-brand" href="">流浪猫狗管理系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
          <!-- 消息通知 end -->
          <!-- 用户信息和系统设置 start -->
          <li class="dropdown">
            <a
              class="dropdown-toggle"
              data-toggle="dropdown"
              href="/admin/developing"
            >
              <i class="fa fa-user fa-fw"></i>
              <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li>
                <input type="hidden" id="currentAdminId" value="${admin.id}" />
              </li>
              <li>
                <a href="/admin/developing"
                  ><i class="fa fa-user fa-fw"></i>
                  管理员：${admin.adminName}</a
                >
              </li>
              <li>
                <a href="/admin/developing"
                  ><i class="fa fa-gear fa-fw"></i> 系统设置</a
                >
              </li>
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
        <!-- 左侧显示列表部分 start-->
        <jsp:include page="/admin/nav" />
      </nav>
      <div id="app" style="margin-left: 250px;margin-top: 20px;">
        <div class="wy-filter">
          <el-select v-model="query.value" placeholder="请选择">
            <el-option
                    v-for="(name,index) in options2"
                    :key="index"
                    :label="name[index]"
                    :value="index">
            </el-option>

          </el-select>
          <el-button type="success" size="small" plain icon="el-icon-search" @click="find" style="height: 40px">查询</el-button>
          <el-button style="float:right" type="primary" size="small" plain icon="el-icon-plus" @click="add"
                     style="float: right"></el-button>
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
                  prop="name"
                  label="姓名"
                  width="180">
          </el-table-column>

          <el-table-column
                  prop="email"
                  label="邮箱"
                  width="180">
          </el-table-column>

          <el-table-column
                  prop="age"
                  label="年龄"
                  width="180">
          </el-table-column>

          <el-table-column label="电话" prop="telephone"> </el-table-column>
          <el-table-column label="信息" prop="message"> </el-table-column>
          <el-table-column label="申请时间" prop="applyTime"> </el-table-column>
          <el-table-column label="状态">
            <template slot-scope="scope">
              <span v-if="scope.row.state == 1">已处理</span>
              <span v-else>未处理</span>
            </template>

          </el-table-column>

          <el-table-column label="操作" width="300" align="center">
            <template slot-scope="scope">

              <el-button
                      type="text"
                      @click="handleAnswer(scope.$index, scope.row)"
                      icon="el-icon-message"
              >回复
              </el-button>


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
            <el-form-item label="姓名">
              <el-input
                      v-model="form.name"
                      disabled
              >
              </el-input>
            </el-form-item>
            <el-form-item label="邮箱" disabled>
              <el-input v-model="form.email" disabled=""></el-input>
            </el-form-item>
            <el-form-item label="信息">
              <el-input type="textarea" v-model="form.message"></el-input>
            </el-form-item>
            <el-form-item label="状态">
              <template slot-scope="scope">
                <el-select v-model="form.state" placeholder="请选择">
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

        <!-- 编辑回复 -->
        <el-dialog title="回复" :visible.sync="replyVisible" width="30%">
          <el-form :model="replyForm" label-width="70px">
            <el-form-item label="姓名">
              <el-input
                      v-model="replyForm.name"
                      disabled
              >
              </el-input>
            </el-form-item>
            <el-form-item label="邮箱" disabled>
              <el-input v-model="replyForm.email" disabled=""></el-input>
            </el-form-item>
            <el-form-item label="回复内容">
              <el-input type="textarea" v-model="replyForm.content"></el-input>
            </el-form-item>


          </el-form>
          <span slot="footer" class="dialog-footer">
                <el-button @click="replyVisible = false">取 消</el-button>
                <el-button type="primary" @click="replyEdit">确 定</el-button>
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

      input[type=file] {
        display: none;
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
            replyVisible: false,
            form: {},
            replyForm: {},
            file: null,
            options:[
              {0:"未处理"},
              {1:"已处理"},
            ],
            options2:[
              {0:"未处理"},
              {1:"已处理"},
              {2:"全部"},
            ]

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
            axios.get('${path}/apply/allApply', {
              params: this.query
            }).then(res => {
              console.log(res)
              if (res.data.code == 200) {
                this.tableData = res.data.data
              }
            })
          },
          handleAnswer(index,row){
            this.replyForm = row
            this.replyVisible = true
          },
          handleDel(index, row) {
            axios.get("${path}/apply/delete", {
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
            axios.post("${path}/apply/update", this.form).then(res => {
              this.editVisible = false;
              this.getAll();
            })
          },
          find() {
            this.getAll()
          },
          replyEdit(){
            const formData = new FormData();
            for(const key in this.replyForm){
              formData.append(key,this.replyForm[key])
            }
            axios.post("${path}/reply/reply", formData).then(res => {
              this.replyVisible = false;
              this.getAll();
              this.$message({
                type:"success",
                message:"发送成功"
              })
            })
          }

        }
      })
    </script>

  </body>
</html>

<%-- Created by IntelliJ IDEA. Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%> <%@ page
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
        <jsp:include page="/admin/nav" />
      </nav>
      <!-- 数据显示-->
      <div
        id="main"
        style="width: 600px; height: 600px; margin-left: 300px"
      ></div>
    </div>
    <%--登录失效，跳转至登录--%>
    <div
      class="modal fade"
      id="notlogin"
      tabindex="-1"
      role="dialog"
      aria-labelledby="myModalLabe"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
            <h4 class="modal-title">登录失效</h4>
          </div>
          <div class="modal-body">
            <p>请先 <a href="/admin/login">登录</a>！</p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-default"
              data-dismiss="modal"
              aria-label="Close"
            >
              关闭
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- 引入js文件 -->
    <!-- jQuery -->
    <!-- jQuery -->
    <script src="${path}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/static/js/echarts.min.js"></script>
    <script src="${path}/static/js/axios.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

    <!-- 编写js代码 -->
    <script type="text/javascript">
      axios.get("${path}/admin/getData").then((res) => {
        if (res.data.code == 200) {
          // 基于准备好的dom，初始化echarts实例
          var myChart = echarts.init(document.getElementById("main"));
          let xData = [];
          let yData = [];
          res.data.data.forEach((item) => {
            xData.push(item.name);
            yData.push(item.count);
          });
          // 指定图表的配置项和数据
          var option = {
            title: {
              text: "数据显示",
            },
            tooltip: {},
            legend: {
              data: ["数量"],
            },
            xAxis: {
              data: xData,
              axisLabel: {
                interval: 0,
                rotate: 15,
              },
            },
            yAxis: {},
            series: [
              {
                name: "死亡数量",
                type: "bar",
                data: yData,
              },
            ],
          };

          // 使用刚指定的配置项和数据显示图表。
          myChart.setOption(option);
        }
      });
    </script>
  </body>
</html>

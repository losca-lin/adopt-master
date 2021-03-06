<%--
  Created by IntelliJ IDEA.
  User: Losca
  Date: 2022/4/19
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            href="/employee/developing"
    >
      <i class="fa fa-user fa-fw"></i>
      <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu dropdown-user">
      <li>
        <a href="${path}/employee/logout">
          <i class="fa fa-sign-out fa-fw"></i>退出登录
        </a>
      </li>
    </ul>
  </li>
  <!-- 用户信息和系统设置结束 -->
</ul>
<!-- 左侧显示列表部分 start-->
<div class="navbar-default sidebar" role="navigation">
  <div class="sidebar-nav navbar-collapse">
    <!-- 教学管理  折叠的分组列表 -->
    <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
      <h4 class="panel-title">
        后台管理 <span class="fa fa-chevron-up right"></span>
      </h4>
    </div>
    <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
      <ul class="list-group">
        <li class="list-group-item my_font">
          <a href="${path}/employee/user">
            <i class="fa fa-flash fa-fw"></i> 用户信息
          </a>
        </li>


        <li class="list-group-item my_font">
          <a href="${path}/employee/pet">
            <i class="fa fa-sitemap fa-fw"></i> 宠物管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/employee/adopt">
            <i class="fa fa-sitemap fa-fw"></i> 领养管理
          </a>
        </li>




        <li class="list-group-item my_font">
          <a href="${path}/employee/agree">
            <i class="fa fa-sitemap fa-fw"></i> 同意领养列表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/visit/visitPage">
            <i class="fa fa-sitemap fa-fw"></i> 回访列表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/employee/disAgree">
            <i class="fa fa-sitemap fa-fw"></i> 不同意领养列表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/employee/showPage">
            <i class="fa fa-sitemap fa-fw"></i> 数据图表
          </a>
        </li>

        <%--<li class="list-group-item my_font">--%>
        <%--  <a href="${path}/employee/applyShow">--%>
        <%--    <i class="fa fa-sitemap fa-fw"></i> 支出图表--%>
        <%--  </a>--%>
        <%--</li>--%>
        <li class="list-group-item my_font">
          <a href="${path}/employee/publishPage">
            <i class="fa fa-sitemap fa-fw"></i> 发布管理
          </a>
        </li>

        <li class="list-group-item my_font">
          <a href="${path}/ad/adAdminPage">
            <i class="fa fa-sitemap fa-fw"></i> 广告管理
          </a>
        </li>
      </ul>
    </div>
  </div>
</div><!-- 左侧显示列表部分 end-->
</nav>
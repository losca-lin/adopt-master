<%--
  Created by IntelliJ IDEA.
  User: Losca
  Date: 2022/4/19
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          <a href="${path}/admin/user">
            <i class="fa fa-flash fa-fw"></i> 用户信息
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/admin">
            <i class="fa fa-flash fa-fw"></i> 管理员信息
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/moneyPage">
            <i class="fa fa-sitemap fa-fw"></i> 支出管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/pet">
            <i class="fa fa-sitemap fa-fw"></i> 宠物管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/adopt">
            <i class="fa fa-sitemap fa-fw"></i> 领养管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/comment">
            <i class="fa fa-sitemap fa-fw"></i> 评论管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/blog">
            <i class="fa fa-sitemap fa-fw"></i> 公告管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/apply">
            <i class="fa fa-sitemap fa-fw"></i> 志愿者申请
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/agree">
            <i class="fa fa-sitemap fa-fw"></i> 同意领养列表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/disAgree">
            <i class="fa fa-sitemap fa-fw"></i> 不同意领养列表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/showPage">
            <i class="fa fa-sitemap fa-fw"></i> 数据图表
          </a>
        </li>

        <li class="list-group-item my_font">
          <a href="${path}/admin/applyShow">
            <i class="fa fa-sitemap fa-fw"></i> 支出图表
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/admin/publishPage">
            <i class="fa fa-sitemap fa-fw"></i> 发布管理
          </a>
        </li>
        <li class="list-group-item my_font">
          <a href="${path}/donate/adminDonatePage">
            <i class="fa fa-sitemap fa-fw"></i> 捐款捐物
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
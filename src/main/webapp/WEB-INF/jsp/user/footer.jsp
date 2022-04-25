<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- Created by
IntelliJ IDEA. Date: 2022/3/22 Time: 23:49 To change this template use File |
Settings | File Templates. --%> <%@ page contentType="text/html;charset=UTF-8"
language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><sitemesh:write property='title'/></title>
    <sitemesh:write property="head" />

    <link
      rel="stylesheet"
      href="${path}/static/css/user/mystyle.css"
      type="text/css"
      media="all"
    />
    <style>
      .footer-img .img {
        height: 255px;
        background: url(/static/images/home/fb_image.jpg) no-repeat;
        background-size: cover;
      }

      .move-top {
        width: 34px;
        height: 34px;
        background: url(/static/images/home/move-top1.png) no-repeat;
        display: inline-block;
        position: fixed;
        bottom: 4%;
        right: 2%;
        z-index: 0;
      }
    </style>
  </head>
  <body>
    <div class="footer-img">
      <div class="img"></div>
    </div>
    <div class="footer-w3ls py-4">
      <div class="container py-xl-5 py-lg-3">
        <div class="row agileits_w3layouts_footer_grids">
          <div class="col-lg-4 agileits_w3layouts_footer_grid">
            <h3>电话</h3>
            <ul>
              <li><span>Office Phone :</span> (+123) XXXXXXXXXXX</li>
              <li><span>Fax :</span> (+123) 123 456 455</li>
            </ul>
          </div>
          <div class="col-lg-4 agileits_w3layouts_footer_grid my-lg-0 my-5">
            <h3>地址</h3>
            <p>
              xxxxxxxxxx
              <i>xx街道</i>
            </p>
          </div>
          <div class="col-lg-4 agileits_w3layouts_footer_grid">
            <h3>邮箱</h3>
            <ul>
              <li>
                <span>Email :</span>
                <a href="#">1111111@126.com</a>
              </li>
              <li>
                <span>Email :</span>
                <a href="#">XXXXXX@lv.cn</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- //footer -->
    <!-- copyright -->
    <div class="wthree_copy_right">
      <div class="container">
        <p>
          Copyright &copy; 2022.XXXXXXXXXXXXXXXXXXXXX<a
            target="_blank"
            href="#"
          ></a>
        </p>
      </div>
    </div>
    <!-- //copyright -->
    <!-- //footer -->
    <!-- move top icon -->
    <a href="javascript:scroll(0,0)" class="move-top text-center" id="btn"></a>
  </body>
</html>

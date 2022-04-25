<%-- Created by IntelliJ IDEA.Date: 2022/3/22
Time: 23:49 To change
this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>团队展示</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />

    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link
      rel="stylesheet"
      href="${path}/static/bootstrap/css/bootstrap.css"
      type="text/css"
      media="all"
    />
    
    <link
      rel="stylesheet"
      href="${path}/static/css/user/font-awesome.css"
      type="text/css"
      media="all"
    />
    <style>
      button#save_apply_btn {
      background-color: #f7c7ff;
      height: 30px;
      width: 60px;
      margin-top: 20px;
      margin-left: 348px;
    }
    .col-sm-9{
    border: 1px solid;
    box-shadow: 2px 2px 2px rgb(0 0 0);
    margin-left: 150px;
    }

    /*--Contact--*/

.contact-left h4,
.contact-left h5 {
  text-align: left;
}

.phone {
  margin: 25px 0;
}

.address h4,
.phone h4,
.email h4 {
  margin-bottom: 10px;
  color: #00cdc1;
  font-weight: 600;
  font-size: 20px;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.address h4 i,
.phone h4 i,
.email h4 i {
  color: #000;
  padding-right: 0.8em;
}

.email p a {
  color: #999;
}

.email p a:hover {
  color: #000;
}

.contact input[type='text'],
.contact input[type='email'] {
  width: 47%;
  padding: 0.8em;
  background: transparent;
  border: none;
  border-bottom: 1px solid #000;
  margin: 1em 1em 1em 0;
  color: #000;
  outline: none;
  letter-spacing: 1px;
}

.contact textarea {
  width: 96.3%;
  border: none;
  border-bottom: 1px solid #000;
  resize: none;
  padding: 0.8em;
  height: 12em;
  margin-top: 1em;
  letter-spacing: 1px;
  outline: none;
}

.contact input[type='submit'] {
  background: #ff3535;
  padding: 12px 50px;
  outline: none;
  margin-top: 1em;
  color: #fff;
  border: none;
  letter-spacing: 1px;
  font-size: 16px;
}

.contact input[type='submit']:hover {
  background: #000;
}
    </style>
  </head>
  <body>
    <jsp:include page="navigation.jsp"></jsp:include>
   
    <div class="contact" id="contact">
    <div class="container">
        <div class="col-md-9 col-sm-9 contact-right">
            <form id="save_apply_form" >
                <input type="text" id="name" name="name" placeholder="你的名字" >
                <input type="text" id="email" name="email" placeholder="你的邮件号" >
                <input type="text" id="age" name="age" placeholder="你的年龄">
                <input type="text" id="telephone" name="telephone" placeholder="你的电话">
                <textarea name="message" id="message" placeholder=你想当志愿者的理由"></textarea>
            </form>
            <button type="button" id="save_apply_btn">提交</button>
        </div>
        
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

    <!-- //team -->
    <!-- js -->
    <script src="${path}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Necessary-JavaScript-File-For-Bootstrap -->
    <!-- //js -->
    <script type="text/javascript">
      //总的数据 当前的页面

      var totalRecord, currentPage;

      $(function () {
        to_page(1);
      });
      function to_page(pn) {
        $.ajax({
          url: "${path}/admin/admins",
          data: "pn=" + pn,
          type: "GET",
          success: function (result) {
            //1、解析并显示员工数据
            build_admins_table(result);
            //3、解析显示分页条数据
            build_page_nav(result);
          },
        });
      }

      function build_admins_table(result) {
        //清空table表格
        $(".team-agileinfo").empty();
        //index：下标 user：单个对象
        var admins = result.extend.pageInfo.list;
        $.each(admins, function (index, admin) {
          var pic = null;
          var adminNameTd = null;
          var remarkTd = null;
          if (index % 2 != 0) {
            pic = $("<div></div>")
              .addClass("team-grid-right aliquam")
              .append(
                $("<img/>")
                  .addClass("img-responsive")
                  .attr("src", "/static/images/admin/" + admin.pic)
              );
            adminNameTd = $("<div></div>")
              .addClass("team-grid-left non")
              .append($("<h4></h4>"))
              .append(admin.adminName);
            remarkTd = $("<p></p>").append(admin.remark);
            adminNameTd.append(remarkTd);
          } else {
            pic = $("<div></div>")
              .addClass("team-grid-right")
              .append(
                $("<img/>")
                  .addClass("img-responsive")
                  .attr("src", "/static/images/admin/" + admin.pic)
              );
            adminNameTd = $("<div></div>")
              .addClass("team-grid-left")
              .append($("<h4></h4>"))
              .append(admin.adminName);
            remarkTd = $("<p></p>").append(admin.remark);
            adminNameTd.append(remarkTd);
          }
          $("<div></div>")
            .addClass("col-md-6 team-grid w3-agileits")
            .append(pic)
            .append(adminNameTd)
            .appendTo(".team-agileinfo");
        });
      }

      //解析显示分页条，点击分页要能去下一页....
      function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append(
          $("<a></a>").append("首页").attr("href", "#")
        );
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
          firstPageLi.addClass("disabled");
          prePageLi.addClass("disabled");
        } else {
          //为元素添加点击翻页的事件
          firstPageLi.click(function () {
            to_page(1);
          });
          prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum - 1);
          });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append(
          $("<a></a>").append("末页").attr("href", "#")
        );
        if (result.extend.pageInfo.hasNextPage == false) {
          nextPageLi.addClass("disabled");
          lastPageLi.addClass("disabled");
        } else {
          nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum + 1);
          });
          lastPageLi.click(function () {
            to_page(result.extend.pageInfo.pages);
          });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
          var numLi = $("<li></li>").append($("<a></a>").append(item));
          if (result.extend.pageInfo.pageNum == item) {
            numLi.addClass("active");
          }
          numLi.click(function () {
            to_page(item);
          });
          ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
      }

        $("#save_apply_btn").click(function () {
          console.log($("#save_apply_form").serialize());
          $.ajax({
            url: "${path}/apply/create",
            type: "POST",
            data: $("#save_apply_form").serialize(),
            success: function (result) {
              alert("你的申请已经被提交");
              window.location.reload();
            },
            error: function (result) {
              alert("你提交的信息有错，请认真填写！");
              window.location.reload();
            },
          });
        });
    </script>
  </body>
</html>

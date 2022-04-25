<%-- Created by IntelliJ IDEA.Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>宠物知识</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />

    <!-- css files -->
    <link
      rel="stylesheet"
      href="${path}/static/bootstrap/css/bootstrap.css"
      type="text/css"
      media="all"
    />
    <!-- Owl-Carousel-CSS -->
    <link
      rel="stylesheet"
      href="${path}/static/css/user/style.css"
      type="text/css"
      media="all"
    />
    <link
      href="${path}/static/css/user/simplelightbox.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <style>
      .about-wel p {
        font-size: 20px;
      }
    </style>
  </head>
  <body>
    <jsp:include page="navigation.jsp"></jsp:include>
    <!-- welcome -->
    <div class="about" id="about">
      <div class="container">
        <h3 class="agile-title">欢迎</h3>
        <div class="about-top w3ls-agile">
          <div class="col-md-6 red">
            <img
              class="img-responsive"
              src="/static/images/about/ab.jpg"
              alt=""
            />
          </div>
          <div class="col-md-6 come">
            <div class="about-wel">
              <h5>
                一些关于如何
                <span>养宠物的建议</span>
              </h5>
              <p>
                养宠物不仅仅是照顾他们那么简单，也是一份责任，你的世界里有很多人很多事，可在他的世界里只有你一个人，所以养宠物也是需要一定的条件，不然的话他带给你的麻烦会多于带给你的乐趣……
              </p>
              <ul>
                <li>
                  <i class="glyphicon glyphicon-ok"></i>新手养狗注意事项？
                </li>
                <li><i class="glyphicon glyphicon-ok"></i>一、观察及喂食</li>
                <li>
                  <i class="glyphicon glyphicon-ok"></i>二、定点屎尿及疫苗问题
                </li>
                <li><i class="glyphicon glyphicon-ok"></i>三、日常清洁护理</li>
              </ul>
            </div>
            <div class="button-styles">
              <a href="#cat" data-toggle="modal" data-target="#Catbtn"
                >养猫须知</a
              >
              <a href="#dog" data-toggle="modal" data-target="#Dogbtn"
                >养狗须知</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery -->
    <!-- <div id="gallery" class="gallery">
    <div class="container">
        <h3 class="agile-title">Gallery</h3>
    </div>
    <div class="agileinfo-gallery-row">
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/c1.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/c1.jpg" alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/d1.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/d1.jpg" alt="" title="Dog Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/c2.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/c2.jpg" alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/d2.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/d2.jpg" alt="" title="Dog Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/c3.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/c3.jpg" alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/d3.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/d3.jpg" alt="" title="Dog Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/c4.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/c4.jpg" alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/static/images/about/d4.jpg" class="imghvr-hinge-right figure">
                <img src="/static/images/about/d4.jpg" alt="" title="Dog Life Image" />
            </a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div> -->

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Modal5 -->
    <div class="modal fade" id="Catbtn" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
            <div class="modal-info">
              <h4>Cat Life</h4>
              <img
                src="/static/images/about/c.png"
                alt=" "
                class="img-responsive"
              />
              <p class="para-agileits-w3layouts">
                我们不能一直将小猫放在家里面养，我们需要时不时的将小猫带出去溜溜,然后，我们在养小猫的时候，还需要多陪小猫玩耍。
                我们在养小猫的时候，还需要多打理打理它的毛发。
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal5 -->
    <div class="modal fade" id="Dogbtn" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
            <div class="modal-info">
              <h4>Dog Life</h4>
              <img
                src="/static/images/about/d.png"
                alt=" "
                class="img-responsive"
              />
              <p class="para-agileits-w3layouts">
                喂食的时间要准，尽量按照在原主人家的习惯喂养，不要喂它们过多的甜食、咸食和刺激性强的食品。
                刚来的宝宝，主人要亲自喂食，时日积久，便能和爱犬建立起深厚的感情，加深相互信任的程度，
                主人的另一个重要任务是要帮助小家伙克服离开母亲的痛苦，尽快适应新环境。
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- //Gallery -->
    <!-- js -->
    <script src="${path}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Necessary-JavaScript-File-For-Bootstrap -->
    <!-- //js -->

    <!-- simple-lightbox -->
    <script src="${path}/static/js/user/simple-lightbox.min.js"></script>
    <script>
      $(function () {
        var gallery = $(".agileinfo-gallery-row a").simpleLightbox({
          navText: ["&lsaquo;", "&rsaquo;"],
        });
      });
    </script>

    <!-- Light-box css -->
    <!-- //simple-lightbox -->
  </body>
</html>

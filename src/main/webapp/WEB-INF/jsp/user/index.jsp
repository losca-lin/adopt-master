<%-- Created by IntelliJ IDEA. Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>首页</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <!-- <link
      rel="stylesheet"
      href="${path}/static/bootstrap/css/bootstrap.min.css"
      type="text/css"
      media="all"
    /> -->
    <!-- Bootstrap-Core-CSS -->
    <!-- <link
      rel="stylesheet"
      href="${path}/static/css/user/font-awesome.css"
      type="text/css"
      media="all"
    /> -->
    <!-- Font-Awesome-Icons-CSS -->
    <!-- <link
      rel="stylesheet"
      href="${path}/static/css/user/owl.carousel.css"
      type="text/css"
      media="all"
    /> -->
    <!-- Owl-Carousel-CSS -->
    <link
      rel="stylesheet"
      href="${path}/static/css/user/icons.css"
      type="text/css"
      media="all"
    />
    <link
      rel="stylesheet"
      href="${path}/static/css/user/mystyle.css"
      type="text/css"
      media="all"
    />
  </head>
  <body>
    <jsp:include page="navigation.jsp"/>

    <section class="about-area pt-150 pb-150">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="about-us-content">
              <div class="section-title">
                <p class="style-para">Our Introduction</p>
                <img src="/static/images/home/shape-blue.png" alt="" />
                <h1>救助流浪宠物</h1>
              </div>
              <p>
                流浪猫狗救助网站，基于流浪动物收容场所在线上建设网站，目的是为了更好的传递救助信息和管理流浪动物信息，只为营救更多的流浪动物，让流浪动物们有一个美好的归宿，人间有爱，处处春天。本网站提供了宠物救助、领养、论坛走失发布等综合服务，不仅节约救助宠物的管理成本，而且打破了传统流浪动物收容站的各种限制，关注近年来流浪猫狗的热点问题，从科学化、信息化、人性化的角度，构建一个流浪猫狗救助的网站。
              </p>
              <h5>
                <span><i class="fas fa-check"></i></span
                >在这里您可以申请领养小宠物
              </h5>
              <h5>
                <span><i class="fas fa-check"></i></span
                >在这里您可以申请参加救助宠物活动
              </h5>
              <h5>
                <span><i class="fas fa-check"></i></span
                >在这里您可以学到养宠知识
              </h5>
              <!-- <a href="#" class="main-btn about-btn">Discover More</a> -->
            </div>
          </div>
          <div class="col-lg-6">
            <div class="about-us-image">
              <img src="/static/images/home/home-1.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- //服务 -->

    <!-- //活动 -->
    <section class="activities-area pb-150">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="activities-img">
              <img src="/static/images/home/home-1-shape-image-2.png" alt="" />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="activities-content">
              <div class="section-title">
                <p class="style-para">Our Activities</p>
                <img src="/static/images/home/shape-blue.png" alt="" />
                <h1>爱心活动</h1>
              </div>
              <p>
                每一个生命都是平等的，每一个生命都值得被尊重和关爱。无家可归的动物们四处流浪，在天桥下，在垃圾桶旁，在城市的犄角旮旯里……我们能为它们做些什么呢？
              </p>
              <div class="activities-content-box">
                <div class="single-activites-content">
                  <div class="activities-logo-content">
                    <h4><i class="fas fa-dog"></i> 点滴爱心，汇聚成海</h4>
                    <span>让我们伸出手,留下一份爱心,保留一条生命.</span>
                  </div>
                  <div class="activities-logo-content">
                    <h4><i class="fas fa-paw"></i> 因为有你，所以有家</h4>
                    <span>爱护每一只动物.给流浪动物一个温暖的家.</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="testimonial-area pb-150">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="testimonial-carousel-active">
              <div class="single-testimonial-containt">
                <div class="section-title">
                  <p class="style-para">Our Actions</p>
                  <img src="/static/images/home/shape-blue.png" alt="" />
                  <h1>救助方式</h1>
                </div>
                <span><i class="fa fa-quote-right"></i></span>
                <p>
                  对于有爱心的人来说，也许时间和精力不允许你直接参加动物救助行动，那么也可以通过其他的方式来帮助流浪猫：1、关注流浪动物话题，了解科学救助的知识。2、主动宣传动物福利理念，向身边的每一个人宣传人道对待流浪动物。3、见到虐待动物的行为上前制止，你的一句话也许可以挽救一个生命。4、推荐朋友到领养中心领养一只被救助的动物，而不要去购买。5、为动物救助组织捐助，你捐助的粮食和玩具会帮助许多有需要的生命。
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="testimonial-area-img">
              <img src="/static/images/home/cat_1.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="price-area pb-150">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 offset-lg-3 text-center mb-60">
            <div class="section-title">
              <p class="style-para">Bring Your Pet</p>
              <img src="/static/images/home/shape-blue.png" alt="" />
              <h1>把它们带回家吧</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="single-price-content">
              <div class="pricing-bg">
                <img src="/static/images/home/blog-8.jpg" alt="" />
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-price-content">
              <div class="pricing-bg">
                <img src="/static/images/home/blog-5.jpg" alt="" />
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-price-content">
              <div class="pricing-bg">
                <img src="/static/images/home/blog-11.jpg" alt="" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--//banner-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- footer -->

    <!-- js 非得用2.0版本得jQuery-->
    <script src="${path}/static/js/user/jquery-2.2.3.min.js"></script>
    <script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Necessary-JavaScript-File-For-Bootstrap -->
    <!-- //js -->

    <!-- Banner Slider -->

    <!-- //Banner Slider -->
  </body>
</html>

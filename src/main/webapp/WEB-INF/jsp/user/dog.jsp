<%-- Created by IntelliJ IDEA.Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>养狗知识</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${path}/static/about/css/normalize.css"
    />
    <!--CSS RESET-->
    <link
      rel="stylesheet"
      type="text/css"
      href="${path}/static/about/css/htmleaf-demo.css"
    />
    <link rel="stylesheet" href="${path}/static/about/css/style.css" />

    <style>
      body {
        background-image: url(${path}/static/about/img/dogbg.jpg);
        background-repeat: no-repeat;
        background-size: cover;
        /* filter: blur(2px); */
      }
      .scene {
        margin: -1% 5% 5% 50%;
      }
      .page_front {
        padding: 10px 0 0;
      }
      .htmleaf-header {
        position: relative;
      }
      .htmleaf-header img {
        position: absolute;
        top: -19px;
        left: 20px;
        width: 155px;
        height: 150px;
      }
      .page p {
        margin-top: 20px;
      }
    </style>
    <jsp:include page="navigation.jsp"></jsp:include>
  </head>

  <body>
    <div
      class="bd"
      style="
        background-image: url(${path}/static/about/img/dog_bg.jpg);
        background-repeat: no-repeat;
        background-size: cover;
      "
    >
      <div class="scene">
        <article class="book">
          <section class="page active">
            <div class="front">
              <header class="htmleaf-header">
                <img src="${path}/static/about/img/dog_f.png" alt="" />
                <h1>
                  养狗须知
                  <span>关于养狗的注意事项，铲屎官必须要知道！</span>
                </h1>
              </header>
              <h1>点击即可快速查看</h1>
              <p class="page_front">
                科学饲养狗狗很重要，特别是对于刚加入铲屎官行列的新手来说。狗狗饲养有什么注意事项呢？
              </p>

              <p class="page_front">
                新手养狗前需要初步了解犬的品种、外貌、生理特点、生活习性、性格特点、保健知识等，并且新手养狗可以从幼犬养起，可以挑选3个月龄左右刚刚断奶的幼犬。
              </p>
            </div>
            <div class="back">
              <h1>一、饮食</h1>
              <div style="float: left">
                <img
                  src="${path}/static/about/img/dog1.jpg"
                  alt=""
                  style="height: 166px; width: 245px; margin-right: 20px"
                />
              </div>
              <p>饲养狗狗在饮食上要注意这4样东西不能给狗狗吃。</p>
              <p>
                (1）巧克力：这类食物中对狗狗来说是致命的，里面含有可可碱成份，如果服用会使狗狗脑中血流量减少，损害它们的心脏和中枢神经系统。
              </p>
              <p>
                （2）洋葱：含有正丙基二硫化物的成分，会破坏狗狗体内的血红蛋白，改变其本身自有的结构。狗狗吃了会出现呕吐，尿血等现象。
              </p>
              <p>
                （3）葡萄：狗狗在吃了葡萄之后会出现呕吐、腹泻、昏睡、脱水及食欲不振的情况，有些狗狗会出现肾衰竭的现象。
              </p>
              <p>
                （4）鸡骨头和碎骨头：不要给狗狗吃了鸡肉之后给狗狗吃鸡骨头，碎骨头也不要，这些极易刺穿狗狗喉咙，割破食道和肠胃。
              </p>
            </div>
          </section>
          <section class="page">
            <div class="front">
              <h1>二、疫苗</h1>
              <div>
                <img
                  src="${path}/static/about/img/dog2.jpg"
                  alt=""
                  style="height: 200px; width: 380px; margin-left: 130px"
                />
              </div>
              <p>
                一定要给狗狗打疫苗，不要抱有侥幸心理。狗狗有可能会感染各种各样的病毒，打疫苗是为了更好地预防病毒。这样不仅可以提高狗狗的抵抗力，免疫力，同时也是对别人的负责。
              </p>
              <p>
                狗狗打疫苗是为了体内有足够的抗体，可以预防狗狗患病毒性疾病。首先，在狗狗45日龄左右，身体处于完全健康的状态下可以带去宠物医院进行疫苗接种，首次免疫需要接种三针联苗和一针狂犬疫苗，前三针需要间隔21天一次，狂犬疫苗在狗狗三月龄后接种。其次，给狗狗接种疫苗前，不要带狗狗外出或洗澡，避免诱发疾病。
              </p>
            </div>
            <div class="back">
              <h1>三、洗澡</h1>
              <img
                src="${path}/static/about/img/dog3.jpg"
                alt=""
                style="height: 200px; width: 360px; margin-left: 130px"
              />
              <p>
                主人爱干净，勤洗澡，通常也会给自己心爱的狗狗勤洗澡。但对于狗狗来说勤洗澡并不是一件好事！频繁洗澡只会伤害它们的皮肤，从而产生一些皮肤问题。
              </p>
              <p>
                要注意幼小期刚到新家、刚打完疫苗的狗狗都不能洗澡，狗狗会很容易生病。狗狗的沐浴露不要和人的混用，要选用专门的，温和的沐浴露。不宜频繁地给狗狗洗澡，可以根据季节、狗狗生活的环境等进行调节，一般天气冷的时候，两周或者一个月一次，天气热的时候一周一次即可。洗完澡的狗狗务必吹干，不要自然风干，狗狗会容易生病。
              </p>
            </div>
          </section>
          <section class="page">
            <div class="front">
              <h1>四、驱虫</h1>
              <div style="float: right">
                <img
                  src="${path}/static/about/img/dog4.jpg"
                  alt=""
                  style="height: 230px; width: 200px; margin-left: 15px"
                />
              </div>
              <p>
                狗狗是人类最亲密的伙伴，定期给狗狗驱虫能让我们的生活更加健康。驱虫大致分为体内和体外两种，驱虫的时间不要和打疫苗的时间撞了，驱完虫后的七天内不要给狗狗洗澡。还有平时遛狗最好不要去灌木丛、草地、泥潭等地方，容易有寄生虫。
              </p>
              <p>
                对于幼犬来说，在满6周龄（断乳后）就可以进行体外驱虫，而体内驱虫则是在狗狗满8周龄的时候进行。如果在这期间发现狗狗有寄生虫的感染，切记一定要用对驱虫药。
                另外体内驱虫和疫苗接种需要相隔一段时间，大致5-7天，而且都是需要在狗狗健康的状态下进行。
              </p>
            </div>
            <div class="back">
              <h1>写在最后</h1>
              <p>
                建议训练狗狗从小抓起，训练狗狗定时、定点、定量吃饭，不论主人多忙，喂食时间不能随意改变，喂食量也不能时多时少；主人培养狗狗定点排便，避免随意排便的麻烦，狗狗如果服从命令，立即用食物、抚摸和柔声夸奖来奖励它。
              </p>
              <p>
                领养宠物成为一种时尚的时候，你可能还没有意识到，你在享受宠物带给你的欢乐时，还需要履行一份义务，对你的宠物负责。宠物也是有生命的，它在地球上同人类一样享受生存的权利。随着宠物热的出现，越来越多的跟宠物有关的社会问题随之出现，如宠物噪音，宠物排泄物的气味污染，遗弃宠物等等。要解决这些问题，首先得从提高宠物主人的责任感和培养公德心开始。
              </p>
              <p>
                1、不要随便扔宠物的排泄物。将宠物的排泄物带回家或者处理掉是最基本的公德。
              </p>
              <p>2、外出时要给宠物带好项圈、牵引带。</p>
              <p>
                3、不要遗弃或者虐待动物。动物也是有生命的，领养了它就应该对它负责任，虐待和遗弃动物都是不人道的行为，是对生命的漠视。
              </p>
            </div>
          </section>
        </article>
      </div>
    </div>

    <!-- <jsp:include page="footer.jsp"></jsp:include> -->

    <script
      src="${path}/static/about/js/jquery-1.11.0.min.js"
      type="text/javascript"
    ></script>

    <script>
      var currentPage = 0;

      $(".book")
        .on("click", ".active", nextPage)
        .on("click", ".flipped", prevPage);

      $(".book").hammer().on("swipeleft", nextPage);
      $(".book").hammer().on("swiperight", prevPage);

      function prevPage() {
        $(".flipped")
          .last()
          .removeClass("flipped")
          .addClass("active")
          .siblings(".page")
          .removeClass("active");
      }
      function nextPage() {
        $(".active")
          .removeClass("active")
          .addClass("flipped")
          .next(".page")
          .addClass("active")
          .siblings();
      }
    </script>
  </body>
</html>

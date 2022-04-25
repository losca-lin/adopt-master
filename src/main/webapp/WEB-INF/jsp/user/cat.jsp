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
    <title>养猫知识</title>

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
        background-image: url(${path}/static/about/img/book_bg_1.jpg);
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
        top: -30px;
        left: -3px;
        width: 128px;
        height: 148px;
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
        background-image: url(${path}/static/about/img/book_bg_1.jpg);
        background-repeat: no-repeat;
        background-size: cover;
      "
    >
      <div class="scene">
        <article class="book">
          <section class="page active">
            <div class="front">
              <header class="htmleaf-header">
                <img src="${path}/static/about/img/front.png" alt="" />
                <h1>
                  养猫须知
                  <span>关于养猫的七个注意事项，铲屎官必须要知道！</span>
                </h1>
              </header>
              <h1>点击即可快速查看</h1>
              <p class="page_front">
                养猫首先要做好心理准备
                既然养猫就要做好陪伴它一辈子的打算，不要抛弃你的猫，要爱护它，毕竟到了你的家里你就是它唯一的依靠了。
              </p>

              <p class="page_front">
                现在大多数人家里都会有只宠物，养猫的、养狗的、养鱼的、养鸟的等等，有些甚至还养蜥蜴和蛇之类的有一定危险系数的宠物，不过最常见的就是猫猫和狗狗了。今天我们就来说说养猫，都说有了猫就是人生赢家，不管你平时是温柔的人，还是高冷的人，或是神经大条的人，只要养了猫，你都是猫的奴隶，一回到家只要猫没在视野内，就有不安感，一定要到处找它找出来。下班后，通常早早回家，守着猫，一回家开门，它奔到门口迎接的样子，太治愈了，觉得自己不再是孤单一人。
              </p>

              <p class="page_front">
                猫咪可爱又呆萌，在家中饲养也比较方便。既然都爱养猫，那么就一起来看看你是否还有一些工作没有做到位。
              </p>
            </div>
            <div class="back">
              <h1>一、关于猫咪驱虫</h1>
              <div style="float: left">
                <img
                  src="${path}/static/about/img/page1.jpg"
                  alt=""
                  style="height: 166px; width: 245px; margin-right: 20px"
                />
              </div>
              <p>
                猫咪体内寄生虫会通过母体传染给幼猫，如果给猫咪吃生肉也会出现感染寄生虫的情况，因此需要定期给猫咪进行体内驱虫，否则会导致猫咪出现腹泻、胃肠道疾病、营养不良等情况。另外主人平时外出会将某些寄生虫虫卵带回家，从而导致猫咪感染寄生虫，因此需要定期进行体外驱虫，防止猫咪感染寄生虫从而引发皮肤病。
              </p>
              <p>
                猫咪一般2个月的话就可以进行驱虫了。体内体外最好分开做，效果好一些。体内驱虫每3个月一次，体外驱虫每月一次。
                但是猫咪驱虫要根据猫咪的生活习惯决定驱虫时间，如果猫咪生活环境非常干净卫生，也不怎么外出，吃生肉少，那么可以选择3~6个月做一次驱虫，根据实际情况而定。
              </p>
            </div>
          </section>
          <section class="page">
            <div class="front">
              <h1>二、关于猫咪疫苗</h1>
              <div style="float: right">
                <img
                  src="${path}/static/about/img/page2.jpg"
                  alt=""
                  style="height: 192px; width: 248px; margin-left: 20px"
                />
              </div>
              <p>
                为什么要给猫咪打疫苗？相信很多新手铲屎官都会有这样的疑问。其实作为家长，我们的最终目的还是希望自己的爱猫可以健健康康的，但是猫咪和人一样，会因为各种各样病毒的入侵而生病，有的疾病甚至会导致猫咪死亡。
                幸运的是，如今我们可以通过给猫咪接种疫苗来预防这些病毒，虽然不是100%可预防，但接种疫苗后可以有效降低猫咪患病的概率，因此为了猫咪的健康，铲屎官们非常有必要带猫咪去接种疫苗。
              </p>
              <p>
                1、猫咪打疫苗年龄必须满56天以上，而且买回来后要养一个星期以上，身体健康，完全没有不适才可以打。
              </p>
              <p>
                2、猫咪一般是打3针猫三联+1针狂犬疫苗，打完第一针疫苗后间隔21天打第二针，然后再间隔21天打第三针，接着是间隔7天，最后再打狂犬疫苗。
              </p>
              <p>
                3、猫咪打完疫苗后，可能会出现一些呕吐拉稀等情况，铲屎官可以给它喂食一些宠物益生菌调理一下。
              </p>
            </div>
            <div class="back">
              <h1>三、关于猫咪绝育</h1>
              <p>
                猫咪绝育的好处
                1、减少猫咪生理疾病的发生。公猫降低患上睪丸肿瘤、摄护腺肥大的几率，母猫则可以避免卵巢囊肿，子宫蓄脓，子宫肌瘤等问题。
                2、绝育后的猫咪不会感染通过性行为传播的疾病。
                3、公猫不会到处撒尿，攻击性也会降低；母猫则不会乱吵乱叫。
              </p>
              <p>
                猫咪的性成熟一般在6个月左右，猫咪的最佳绝育时间是在6-8个月大的时候，在第一次发情前做手术是最好的，可以减少很多生理疾病问题。
                这里另外提醒一下，猫咪一般是先驱虫，再打疫苗，最后做绝育，这个才是正确的顺序不要忘记了哦。
              </p>
              <p>
                手术前准备
                1、航空箱或者是猫包，一来能确保呼吸顺畅，二来，防止它因疼痛跑掉。
                2、保暖物品、尿垫，在航空箱内事先铺好保暖的垫子，因为打了麻药的猫咪体温，普遍都会比较低，当药效过去后才会恢复。尿垫的准备是因为打了麻药的猫咪很容易大小便失禁。
                3、伊莉莎白圈，防止猫咪用舌头去舔伤口。
                4、消炎药，做完手术后，要对猫咪进行消炎，这个时候就需要给它们吃上消炎药，让伤口快点消炎。
                5、碘酒，杀菌用的，每天对着伤口喷两到三次。
                6、开放式猫砂盆：猫咪术后带着伊丽莎白圈，很不方便，不推荐全封闭式猫砂盆。
                注意：1、手术前8个小时不能让猫咪吃东西、喝水，让它保持空腹的状态，这样能有效地避免手术时发生呕吐等问题。
                2、手术前一星期不宜帮猫咪洗澡，避免感冒。
              </p>
            </div>
          </section>
          <section class="page">
            <div class="front">
              <h1>四、关于猫咪排便</h1>
              <div style="float: left">
                <img
                  src="${path}/static/about/img/page4.jpg"
                  alt=""
                  style="height: 250px; width: 207px; margin-right: 20px"
                />
              </div>
              <p>
                对于猫咪来说，简单、宽敞的猫砂盆无疑是它们最喜欢的厕所～猫咪拉屎的时候不喜欢被打扰，所以厕所的隐蔽性也要考虑，建议使用封闭式结构的猫砂盆，有效封锁臭味的同时给予猫咪更多私密性
              </p>
              <p>
                上厕所对于猫咪来说是一件大事，它不像狗狗那么随便，它对上厕所的环境是比较挑剔的，宠主最好给它选择一款宽敞、气味小、粉末小、结团性好的猫砂，可以减少猫咪的呼吸道刺激和清洁卫生。
              </p>
            </div>
            <div class="back">
              <h1>五、关于猫咪洗澡问题</h1>
              <p>
                猫咪经常呆在家里，是不怎么脏的，不需要经常洗澡，而且猫咪也会自己舔毛来清理毛发。对于刚出生3个月之内的小猫是不能洗澡的，身体脏的话，可以用，毛巾擦拭一下。
              </p>
              <p>
                当作好驱虫和疫苗后，再洗澡比较好。猫咪可以一两个月洗一次澡，看生活环境干不干净而定。洗澡时最好用猫咪专用的沐浴露，为避免猫咪的耳朵进水可以用棉花塞住，洗完澡后一定要给猫咪吹干，不吹干真的非常容易感冒！
              </p>
              <div style="margin: 10px 30px 0">
                <img
                  src="${path}/static/about/img/page5_1.jpg"
                  alt=""
                  style="
                    height: 200px;
                    width: 400px;
                    margin-left: 70px;
                    margin-top: 10px;
                  "
                />
              </div>
            </div>
          </section>
          <section class="page">
            <div class="front">
              <h1>六、关于跟猫咪的互动</h1>
              <div style="float: right">
                <img
                  src="${path}/static/about/img/page6.jpg"
                  alt=""
                  style="height: 268px; width: 200px; margin-left: 15px"
                />
              </div>
              <p>
                虽然猫咪不像狗狗那样和人类互动，但它也是需要主人的陪伴和玩耍的，不然很容易有抑郁问题，平常可以多陪猫咪玩一玩，比如躲猫猫、逗猫棒、激光笔、乒乓球等等，都能让猫咪有好心情，还能保证猫咪每日有足够的运动量。
              </p>
              <p>
                要想猫咪学会握手、击拳、坐下等指令，宠主可以给它做点训练，当猫咪做得好时奖励它一些猫咪零食或给予它抚摸，这些鼓励行为都能让猫咪感到开心。
              </p>
            </div>
            <div class="back">
              <h1>写在最后</h1>
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

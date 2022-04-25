<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="${path}/static/css/user/slider.css"
      type="text/css"
      media="all"
    />
  </head>
  <body>
    <!--最大的div，是为了做为一个轮播图所需元素的容器-->
    <div id="main">
      <!--轮播图片区   在取名时，因为各有所长(分别取名slide1-5)，有共有特性(banner-slide)，所以，取多个类名-->
      <div id="banner">
        <!--图1-->
        <a href="">
          <div class="banner-slide slide1 slide-active"></div>
        </a>
        <!--图2-->
        <a href="">
          <div class="banner-slide slide2"></div>
        </a>
        <!--图3-->
        <a href="">
          <div class="banner-slide slide3"></div>
        </a>
        <!--图4-->
        <a href="">
          <div class="banner-slide slide4"></div>
        </a>
        <!--图5-->
        <a href="">
          <div class="banner-slide slide5"></div>
        </a>
      </div>
      <!--
                    移动数字绑定图片
                    必然的是，和图片数量是对等的
                -->
      <div class="dots">
        <ul id="dots">
          <li class="li1"></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <!--
                            上、下一张按钮
                        -->
      <div id="left-right">
        <div class="move" id="prev">&lsaquo;</div>
        <div class="move" id="next">&rsaquo;</div>
      </div>
    </div>
    <script>
      //因为之前使用了很多的id，所以我们为了方便得到
      //所需的document.getElementById();,做一个封装函数（我是网上看来觉得挺好的)
      function byid(id) {
        return typeof id === "string" ? document.getElementById(id) : id;
        //	相当于 return if(typeof(id)==='string'){
        //		document.getElementById(id);
        //	}else{
        //		id;
        //	}
      }
      //接下来开始轮播图脚本了。
      //为了使得函数很多变量能互相使用，所以我们需要在wai
      //定义好全局变量。
      //len的设定   ：  由于长度上的计算很少，而且图片和数字移动数量相同，只需设置一个
      // index的设定：  设置记数变量，因为数字从0开始计算。
      var main = byid("main"),
        pics = byid("banner").getElementsByTagName("div"),
        dots = byid("dots").getElementsByTagName("li"),
        prev = byid("prev"),
        next = byid("next"),
        len = pics.length,
        index = 0,
        timer = null; //timer是为了进行定时器的设置挺与开
      //定时器的关注
      function solide() {
        //轮播定时器（是整个容器即main）：移入鼠标停止，和移出继续轮播
        //先来个划入清除定时器
        banner.onmouseover = function () {
          if (timer) {
            //即timer不为null，为真
            clearInterval(timer); //清除setinterval，并且此时timer又为false，不过，随着循环（即师表
            //移开banner，循环继续又变回 setinterval。
          }
        };
        //再写一个划出继续启动定时器
        banner.onmouseout = function () {
          timer = setInterval(function () {
            index++;
            if (index >= len) {
              index = 0;
            } //注意因为index表示的是图片的标号，最大为4！！
            //有了index就可以进行轮播了，可是我们没有执行图片变化的番薯
            //设置一个，在全局作用域中。
            changImg();
          }, 3000); //setInterval为延时不停息的执行
        };
        banner.onmouseout(); //这样子直接运行function，可以不用在鼠标移出才进行，进入页面同时就开始轮播
        //接下来我们开始数字下标绑定图片移动；
        for (var j = 0; j < len; j++) {
          //在开始前，我们需要知道，函数是可以独立作用域之外的。
          dots[j].index = j; //为所以dots属性添加id，分别为0，1，2，3，4。
          //不太推荐使用这样，毕竟id名字取数字开头不好，不太合规矩。
          dots[j].onclick = function () {
            index = this.index; //(引用id的是dots,及dots的id);
            changImg();
          };
        }
        //然后是上、下一张
        prev.onclick = function () {
          index--;
          if (index < 0) {
            index = len - 1;
          }
          changImg();
        };
        next.onclick = function () {
          index++;
          if (index >= len) {
            index = 0;
          }
          changImg();
        };
      }
      solide(); //提前写上，开始方法，才有轮播效果
      //图片自动切换
      function changImg() {
        for (var i = 0; i < len; i++) {
          pics[i].style.display = "none";
          dots[i].className = "";
        }
        pics[index].style.display = "block";
        dots[index].className = "li1";
      }
    </script>
  </body>
</html>

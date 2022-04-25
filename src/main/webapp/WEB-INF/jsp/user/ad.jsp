<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="navigation.jsp"></jsp:include>
<%-- Created by IntelliJ IDEA.Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>广告</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/user/adstyle.css"/>
</head>

<body>
<article class="htmleaf-container">
    <div class="container">
        <c:forEach items="${ads}" var="ad">
            <div class="column">
                <div class="post-module">
                    <div class="thumbnail">
                        <img src="${path}/static/images/ad/${ad.pic}"/>
                    </div>
                    <div class="post-content">
                        <div class="category">${ad.type}</div>
                        <h1 class="title">${ad.brand}</h1>
                        <p class="description">
                                ${ad.describe}
                        </p>
                        <div class="post-meta">
                            <a href="${ad.link}">链接</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</article>


<script
        src="${path}/static/about/js/jquery-1.11.0.min.js"
        type="text/javascript"
></script>
<script type="text/javascript">
    $(window).load(function () {
        $(".post-module").hover(function () {
            $(this).find(".description").stop().animate(
                {
                    height: "toggle",
                    opacity: "toggle",
                },
                300
            );
        });
    });
</script>
</body>
</html>

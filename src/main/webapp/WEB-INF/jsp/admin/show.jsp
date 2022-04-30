<%-- Created by IntelliJ IDEA. Date: 2022/3/22 Time: 23:49 To change this
template use File | Settings | File Templates. --%>
<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link
            href="${path}/static/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <!-- MetisMenu CSS -->
    <link href="${path}/static/css/admin/metisMenu.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link
            href="${path}/static/css/admin/dataTables.bootstrap.css"
            rel="stylesheet"
    />
    <!-- Custom CSS -->
    <link href="${path}/static/css/admin/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link
            href="${path}/static/css/admin/font-awesome.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <link
            href="${path}/static/css/admin/boot-crm.css"
            rel="stylesheet"
            type="text/css"
    />
    <style>
        .panel-heading {
            background-color: #337ab7;
            border-color: #2e6da4;
            font-size: 14px;
            padding-left: 20px;
            height: 36px;
            line-height: 36px;
            color: white;
            position: relative;
            cursor: pointer;
        }

        /*转成手形图标*/
        .panel-heading span {
            position: absolute;
            right: 10px;
            top: 12px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <jsp:include page="/admin/nav"/>

    <div class="tableTop" style="display: flex;margin-left:300px">
        <div class="tableTopItem"style="height: 200px;width: 200px;">
            今日利润:${dataList.profit}元
        </div>
        <div class="tableTopItem"style="height: 200px;width: 200px;">用户数:${dataList.userCount}</div>
        <div class="tableTopItem"style="height: 200px;width: 200px;">宠物数:${dataList.petCount}</div>
    </div>
    <!-- 数据显示-->
    <div class="tableContainer">
        <div
                id="main"
                style="width: 600px; height: 600px; margin-left: 250px"
        ></div>

        <div
                id="main2"
                style="width: 600px; height: 600px; margin-left: 250px"
        ></div>

        <div
                id="main3"
                style="width: 800px; height: 600px; margin-left: 250px"
        ></div>
    </div>
</div>
<%--登录失效，跳转至登录--%>
<div
        class="modal fade"
        id="notlogin"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myModalLabe"
>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">登录失效</h4>
            </div>
            <div class="modal-body">
                <p>请先 <a href="/admin/login">登录</a>！</p>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<!-- jQuery -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<script src="${path}/static/js/echarts.min.js"></script>
<script src="${path}/static/js/axios.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<style>
    .tableContainer{
        display: flex;
        flex-wrap: wrap;
    }
    .tableTopItem{
        margin-left: 20px;
        background: rgb(84,112,198);
        text-align: center;
        padding-top: 100px;
    }
</style>

<!-- 编写js代码 -->
<script type="text/javascript">
    axios.get("${path}/zhiliao/getTable").then((res) => {
        if (res.data.code == 200) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById("main"));
            let xData = [];
            let yData = [];
            res.data.data.forEach((item) => {
                xData.push(item.name);
                yData.push(item.rate);
            });
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: "病死率显示",
                },
                tooltip: {},
                legend: {
                    data: ["数量"],
                },
                xAxis: {
                    data: xData,
                    axisLabel: {
                        interval: 0,
                        rotate: 15,
                    },
                },
                yAxis: {},
                series: [
                    {
                        name: "死亡率",
                        type: "bar",
                        data: yData,
                    },
                ],
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
</script>
<!-- 编写js代码 -->
<script type="text/javascript">
    axios.get("${path}/admin/getApplyData").then((res) => {
        if (res.data.code == 200) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById("main2"));
            let xData = [];
            let zhiData = [];
            let shouData = [];
            res.data.data.forEach((item) => {
                xData.push(item.time);
                zhiData.push(item.zhijine);
                shouData.push(item.shoujine);
            });
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '收支统计'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {},
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: xData
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                series: [
                    {
                        name: '支出',
                        type: 'line',
                        data: zhiData,
                        markPoint: {
                            data: [
                                { type: 'max', name: 'Max' },
                                { type: 'min', name: 'Min' }
                            ]
                        },
                        markLine: {
                            data: [{ type: 'average', name: 'Avg' }]
                        }
                    },
                    {
                        name: '收入',
                        type: 'line',
                        data: shouData,
                        markPoint: {
                            data: [{ name: '周最低', value: -2, xAxis: 1, yAxis: -1.5 }]
                        },
                        markLine: {
                            data: [
                                { type: 'average', name: 'Avg' },
                                [
                                    {
                                        symbol: 'none',
                                        x: '90%',
                                        yAxis: 'max'
                                    },
                                    {
                                        symbol: 'circle',
                                        label: {
                                            position: 'start',
                                            formatter: 'Max'
                                        },
                                        type: 'max',
                                        name: '最高点'
                                    }
                                ]
                            ]
                        }
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
</script>
<!-- 编写js代码 -->
<script type="text/javascript">
    axios.get("${path}/pet/getTable").then((res) => {
        console.log(res)
        if (res.data.code == 200) {
            var chartDom = document.getElementById('main3');
            var myChart = echarts.init(chartDom);
            var option;
            const forms = res.data.data

            option = {
                title: {
                    text: '宠物种类统计',
                    left: 'center'
                },
                legend: {
                    top: 'bottom'
                },
                toolbox: {
                    show: true,
                    feature: {
                        // mark: { show: true },
                        restore: { show: true },
                        saveAsImage: { show: true }
                    }
                },
                series: [
                    {
                        name: 'Nightingale Chart',
                        type: 'pie',
                        radius: [50, 250],
                        center: ['50%', '50%'],
                        roseType: 'area',
                        itemStyle: {
                            borderRadius: 8
                        },
                        data: forms
                    }
                ]
            };

            option && myChart.setOption(option);

        }
    });
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Jihyun Ahn
  Date: 11/9/2021
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/common/templateCss.jsp" %>
<html>
<head>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/template/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/main/bootstrap.bundle.min.js"></script>


    <!-- Pie chart -->
    <script src="${pageContext.request.contextPath}/js/budget/budget.js"></script>
<%--    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_charts/echarts/light/pies/pie_basic.js"></script>--%>

    <!-- Bar -->
    <script src="${pageContext.request.contextPath}/js/budget/bars.js"></script>
<%--    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_charts/echarts/light/bars/bars_stacked_clustered.js"></script>--%>

    <title>Budget</title>

</head>
<body>
    <!-- Main Content -->
    <div class="content-wrapper">
        <!-- Page header -->
        <div class="page-header page-header-light">
            <div class="page-header-content header-elements-md-inline">
                <div class="page-title d-flex">
                    <h5><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Budget</span></h5>
                    <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
                </div>
            </div>
        </div>
        <!-- /page header -->

        <!-- Content area -->
        <div class="content">
            <div class="row">
                <div class="col-md">
                    <div class="card">
                        <div class="card-header header-elements-inline">
                            <h5 class="card-title">Basic pie chart</h5>
                            <div class="header-elements">
                                <div class="list-icons">
                                    <a class="list-icons-item" data-action="collapse"></a>
                                    <a class="list-icons-item" data-action="reload"></a>
                                </div>
                            </div>
                        </div>

                        <!-- Pie chart and budget -->
                        <div class="card-body">
                            <div class="row">
                                <!-- Pie chart -->
                                <div class="col-sm-7">
                                    <div class="chart-container">
                                        <div class="chart has-fixed-height" id="pie_basic"></div>
                                    </div>
                                </div>
                                <!-- /Pie chart -->

                                <!-- Budget setting -->
                                <div class="col-sm-5 .ml-md-auto">
                                    <div class="text-center">
                                        <h5 class="mt-2 mb-3">Budget &nbsp;&nbsp; <button type="button" class="btn btn-outline bg-slate-600 text-slate-600 border-slate-600 btn-icon rounded-round"><i class="mi-settings"></i></button></h5>
                                        <ul class="pricing-table-list list-unstyled mb-3">
                                            <li><strong>Needs</strong> (${budgetNeeds}%) &nbsp;&nbsp;
                                                Current: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${totalNeeds}" type = "currency"/>&nbsp;&nbsp;
                                                Budget: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${plannedNeeds}" type = "currency"/>
                                            </li>
                                            <li><strong>Wants</strong> (${budgetWants}%) &nbsp;&nbsp;
                                                Current: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${totalWants}" type = "currency"/>&nbsp;&nbsp;
                                                Budget: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${plannedWants}" type = "currency"/>
                                            </li>
                                            <li><strong>Savings</strong> (${budgetSavings}%) &nbsp;&nbsp;
                                                Current: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${totalSavings}" type = "currency"/>&nbsp;&nbsp;
                                                Budget: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${plannedSavings}" type = "currency"/>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Budget setting -->
                            </div>
                        </div>
                        <!-- /Pie chart and budget -->
                    </div>
                </div>
            </div>

            <!-- Stacked clustered bar -->
            <div class="card">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">Bar chart</h5>
                    <div class="header-elements">
                        <div class="list-icons">
                            <a class="list-icons-item" data-action="collapse"></a>
                            <a class="list-icons-item" data-action="reload"></a>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="chart-container">
                        <div class="chart has-fixed-height" id="bars_stacked_clustered" style="height: 450px;"></div>
                    </div>
                </div>
            </div>
            <!-- /stacked clustered bar -->
        </div>
        <!-- /Content area -->
    </div>
    <!-- /Main Content -->
</body>
</html>

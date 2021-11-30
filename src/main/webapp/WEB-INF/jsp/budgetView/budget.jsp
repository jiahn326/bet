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

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/notifications/bootbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/components_modals.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/form_inputs.js"></script>

    <script src="${pageContext.request.contextPath}/js/budget/budget.js"></script>

    <!-- Pie chart -->
    <script src="${pageContext.request.contextPath}/js/budget/charts.js"></script>

    <!-- Bar -->
    <script src="${pageContext.request.contextPath}/js/budget/bars.js"></script>

    <script type="text/javascript">
        getValues(${totalWants}, ${totalNeeds}, ${totalSavings});
        getBarValues(${totalWants}, ${totalNeeds}, ${totalSavings}, ${plannedWants}, ${plannedNeeds}, ${plannedSavings});
    </script>

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
                                        <h5 class="mt-2 mb-3">Budget &nbsp;&nbsp;

                                            <button type="button" class="btn btn-outline bg-slate-600 text-slate-600 border-slate-600 btn-icon rounded-round" data-toggle="modal" data-target="#modal_form_horizontal"><i class="mi-settings"></i></button></h5>

                                        <ul class="pricing-table-list list-unstyled mb-3">
                                            <li><strong>Wants</strong> (${budgetWants}%) &nbsp;&nbsp;
                                                Current: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${totalWants}" type = "currency"/>&nbsp;&nbsp;
                                                Budget: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${plannedWants}" type = "currency"/>
                                            </li>
                                            <li><strong>Needs</strong> (${budgetNeeds}%) &nbsp;&nbsp;
                                                Current: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${totalNeeds}" type = "currency"/>&nbsp;&nbsp;
                                                Budget: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "${plannedNeeds}" type = "currency"/>
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

            <!-- Horizontal form modal -->
            <div id="modal_form_horizontal" class="modal fade" tabindex="-1" style="display: none;" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Goals</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- New Goal Input -->
                        <form action="#" class="form-horizontal">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Wants</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control rounded-round col-sm-2" value="${budgetWants}" placeholder="Enter new percentage">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Needs</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control rounded-round col-sm-2" value="${budgetNeeds}" placeholder="Enter new needs">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Savings</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control rounded-round col-sm-2" value="${budgetSavings}" placeholder="Enter new savings">
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn bg-slate">Save</button>
                                <button type="button" class="btn btn-outline" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                        <!-- /New Goal Input -->
                    </div>
                </div>
            </div>
            <!-- /vertical form modal -->
        </div>
        <!-- /Content area -->
    </div>
    <!-- /Main Content -->
</body>
</html>

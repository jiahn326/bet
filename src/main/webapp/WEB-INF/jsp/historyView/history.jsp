<%--
  Created by IntelliJ IDEA.
  User: Jihyun Ahn
  Date: 10/27/2021
  Time: 3:19 PM
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

    <!-- Table -->
    <script src="${pageContext.request.contextPath}/js/table/inputPage.js"></script>
    <script src="${pageContext.request.contextPath}/js/table/pageListBox.js"></script>
    <script src="${pageContext.request.contextPath}/js/table/dataTable.js"></script>
    <script src="${pageContext.request.contextPath}/js/history/history.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/datatables_basic.js"></script>

    <!-- Modal -->
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/notifications/bootbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/components_modals.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/inputmask.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/autosize.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/formatter.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/typeahead/handlebars.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/passy.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/form_controls_extended.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/validation/validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/switch.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/form_validation.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/core/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/daygrid/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/timegrid/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/interaction/main.min.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/user_pages_profile_tabbed.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_charts/echarts/light/bars/tornado_negative_stack.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_charts/pages/profile/light/balance_stats.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_charts/pages/profile/light/available_hours.js"></script>

    <title>Account</title>

    <style>

        .paginate_input {
            text-align: center;
            width: 70px;
            display: inline;
            padding: .4375rem .875rem;
            font-size: .8125rem;
            font-weight: 400;
            line-height: 1.5385;
            color: #333;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ddd;
            border-radius: .1875rem;
            box-shadow: 0 0 0 0 transparent;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }

        .alert {
            display: none;
            position: fixed;
            top: 85%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            z-index: 9999;
        }

        #domainTable tbody tr {
            cursor: pointer;
        }

        table.modalTable > thead {
            font-size: 12px;
            background-color: gainsboro;;
        }

        .table-bordered-0 {
            table-layout: fixed;
        }

        td{
            text-overflow: ellipsis;
            overflow-x: hidden;
        }

        #domainTable tr:hover{
            background: lightgrey;
        }

        #cancelButton{
            background: darkgray;
        }

        .card {
            float: left;
            width: 100%;
        }
    </style>
</head>
<body>
<!-- Table area Start-->
<div class="content-wrapper">
    <!-- Page header -->
    <div class="page-header page-header-light">
        <div class="page-header-content header-elements-md-inline">
            <div class="page-title d-flex">
                <h5><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Account</span></h5>
                <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
            </div>
        </div>
    </div>
    <!-- /page header -->

    <div class="content">
        <!-- Overview Card -->
        <div class="card border-left-3 border-left-success rounded-left-0">
            <!-- card header -->
            <div class="card-header header-elements-inline">
                <h5 class="card-title">Overview &nbsp;</h5>
<%--                <span class="badge ml-md-3 mr-md-auto"> &nbsp; </span>--%>

                <div class="header-elements">
                    <div class="list-icons">
                        <a class="list-icons-item" data-action="collapse"></a>
                    </div>
                </div>
            </div>
            <!-- /card header -->

            <div class="card-body">
                <!-- available balance -->
                <div class="d-sm-flex align-item-sm-center flex-sm-nowrap">
                    <div>
                        <h4 style="font-weight: bold"> &nbsp; </h4>
                    </div>

                    <div class="text-sm-right mb-0 mt-3 mt-sm-0 ml-auto">
                        <h5>Available Balance: <h3 class="pricing-table-price"><span class="mr-1">$</span>${currentBalance}</h3></h5>
                    </div>
                </div>
                <!-- /available balance -->

                <!-- total deposit and income -->
                <div class="d-sm-flex align-item-sm-center flex-sm-nowrap">
                    <ul class="list list-unstyled mb-0">
                        <li>Total Income of the Month: <span class="font-weight-semibold"><fmt:setLocale value = "en_US"/>
                        <fmt:formatNumber value = "${monthlyIncome}" type = "currency"/></span></li>

                    </ul>
                </div>
                <div class="d-sm-flex align-item-sm-center flex-sm-nowrap">
                    <ul class="list list-unstyled mb-0 mb-auto">
                        <li>Total Expense of the Month: <span class="font-weight-semibold"><fmt:setLocale value = "en_US"/>
                        <fmt:formatNumber value = "${monthlyExpense}" type = "currency"/></span></li>
                    </ul>
                </div>
                <!-- /total deposit and income -->
            </div>
        </div>
        <!-- Overview Card -->

        <!-- History Table Card -->
        <div class="card" style="height: 820px">
            <!-- card header -->
            <div class="card-header header-elements-inline font-size-base">
                <h5 class="card-title">Overview &nbsp;</h5>

<%--                <span class="badge ml-md-3 mr-md-auto"> &nbsp; </span>--%>

                <!-- reload the search input -->
                <div class="header-elements">

                    <div class="list-icons">
                        <a class="list-icons-item" data-action="reload" onclick="location.href='/refresh'"></a>
                    </div>
                </div>
                <!-- /reload the search input -->
            </div>
            <!-- /card header -->

            <!-- Drop box Start -->
            <div class="form-group row font-size-xs" style="margin-left: 10px;">
                <!-- search 'All' -->
                <select class="form-control font-size-xs" aria-hidden="true" style="width: 150px; margin-left: 10px;" name="entryType" id="entryType">
                    <option value="all">All</option>
                    <option value="description">Description</option>
                    <option value="transaction">Transaction</option>
                    <option value="category">Category</option>
                </select>
                <!-- /search 'All' -->

                <!-- search input -->
                <div class="col-lg-1" style="margin-left: -5px;">
                    <div class="input-group" style="width: 400px;">
                        <input type="text" class="form-control border-right-0 font-size-xs" placeholder="Search..." name="keyword" id="keyword">
                        <span class="input-group-append">
                            <button class="btn border font-size-xs" type="button" value = "searchButton" onclick="location.href='/searchHistory'"><i class="icon-search4"></i></button>
                        </span>
                    </div>
                </div>
                <!-- /search input -->

                <!-- New button -->
                <button class="btn btn-outline bg-slate-600 text-slate-600 border-slate-600 font-size-xs" type="button" data-toggle="modal" data-target="#modal" id="newButton" onclick="openModal('add');" style="margin-left: auto; margin-right: 50px;">
                    New
                </button>
                <!-- /New button -->


            </div>
            <!-- /Drop box Start -->

            <!-- History table -->
            <table class="table-bordered-0 table-sm datatable-pagination table-striped table-hover" style="font-size: 12px" id="historyTable">
                <thead>
                <tr style="background-color: #4DB6AC; color: white">
                    <th>Date</th>
                    <th>Description</th>
                    <th>Amount</th>
                    <th>Transaction</th>
                    <th>Category</th>
<%--                    <th>Entry ID</th>--%>
                    <th class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${entryList}" var="entry" varStatus="status">
                        <tr>
                            <td>${entry.dateTime}</td>
                            <td>${entry.description}</td>
                            <td>
                                ${entry.sign}
                                <fmt:setLocale value = "en_US"/>
                                <fmt:formatNumber value = "${entry.amount}" type = "currency"/>
                            </td>
                            <c:choose>
                                <c:when test="${entry.transaction eq 'income'}">
                                    <td><span class="badge badge-primary">income</span></td>
                                </c:when>
                                <c:when test="${entry.transaction eq 'expense'}">
                                    <td><span class="badge badge-danger">expense</span></td>
                                </c:when>
                            </c:choose>

                            <c:choose>
                                <c:when test="${entry.category eq 'wants'}">
                                    <td><span class="badge badge-light badge-striped badge-striped-left border-left-danger">Wants</span></td>
                                </c:when>
                                <c:when test="${entry.category eq 'needs'}">
                                    <td><span class="badge badge-light badge-striped badge-striped-left border-left-warning">Needs</span></td>
                                </c:when>
                                <c:when test="${entry.category eq 'savings'}">
                                    <td><span class="badge badge-light badge-striped badge-striped-left border-left-info">Savings</span></td>
                                </c:when>
                            </c:choose>
                            <td class="text-center">
                                <div class="list-icons">
                                    <button type="button" class="btn btn-outline bg-primary text-primary-800 btn-icon ml-2" data-toggle="modal" data-target="#modal" id="detailButton" onclick="openModal('detail', ${entry.number});" ><i class="icon-pencil"></i></button>
                                    <button type="button" class="btn btn-outline bg-danger text-danger-800 btn-icon ml-2" id="deleteButton" onclick="deleteConfirm(${entry.number}); location.href='/refresh'" ><i class="icon-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tr>
                <%--<ul class="list-group">
                <c:forEach var="entry" items="${entryList}">
                    <li class="list-group-item list-group-item-action">${entry}</li>
                </c:forEach>
                </ul--%>
                </tbody>
            </table>
            <!-- /History table -->

            <!-- Modal Start -->
            <div id="modal" class="modal fade" tabindex="-1" style="display: none; height: 1000px;" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <!-- Modal header -->
                        <div class="modal-header">
                            <h3 class="modal-title"><strong>BET</strong></h3>
                            <button type="button" class="close" data-dismiss="modal" style="color: black">×</button>
                        </div>
                        <!-- /Modal header -->

                        <!-- Modal content -->
                        <form action="/history/info" class="form-horizontal" id="insert_form">
<%--                            <input type="hidden" id="wordSeq" name="wordSeq">--%>
                            <div class="modal-body">
                                <!-- EntryID -->
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-form-label col-sm-3">Entry ID</label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <input type="text" id="entryID" name="entryID" placeholder="Write Entry ID (ex. 2)" class="form-control">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <!-- /EntryID -->
                                <!-- Date -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Date</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="dateTime" name="dateTime" placeholder="MM/DD/YYYY" class="form-control">
                                    </div>
                                </div>
                                <!-- /Date -->
                                <!-- Description -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="description" name="description" placeholder="Write description (ex. Coffee)" class="form-control">
                                    </div>
                                </div>
                                <!-- /Description -->
                                <!-- Amount -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Amount</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="amount" name="amount" placeholder="Write amount (ex. 4.89)" class="form-control">
                                    </div>
                                </div>
                                <!-- /Amount -->
                                <!-- Transaction -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Transaction</label>
<%--                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Transaction</button>--%>
                                    <select class="form-control font-size-xs" style="width: 150px; margin-left: 10px;" aria-hidden="true" id="transaction" name="transaction">
                                        <option value="none">Select...</option>
                                        <option value="expense">Expense</option>
                                        <option value="income">Income</option>
                                    </select>
                                </div>
                                <!-- /Transaction -->

                                <!-- Category -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Category</label>
                                    <select class="form-control font-size-xs" aria-hidden="true" style="width: 150px; margin-left: 10px;" id="category" name="category">
                                        <option value="none">Select...</option>
                                        <option value="wants">Wants</option>
                                        <option value="needs">Needs</option>
                                        <option value="savings">Saving</option>
                                    </select>
                                </div>
                                <!-- /Category -->
                            </div>
                        </form>
                        <!-- /Modal content -->

                        <!-- Button -->
                        <div class="modal-footer">
                            <button type="button" id="saveButton" class="btn bg-teal" onclick="saveConfirm(); location.href='/refresh'">Save</button>
                            <button type="button" id="updateButton" class="btn bg-teal" onclick="updateConfirm();">Edit Save</button>
<%--                            <button type="button" id="deleteEntry" class="btn bg-teal" onclick="deleteConfirm();">Delete</button>--%>
                            <button type="button" id="cancelButton" class="btn btn-outline" data-dismiss="modal">Close</button>
                        </div>
                        <!-- /Button -->
                    </div>
                </div>
            </div>
            <!-- /Modal End -->
        </div>
        <!-- History Table Card -->
    </div>
</div>
<!-- Table area End-->
</body>
</html>

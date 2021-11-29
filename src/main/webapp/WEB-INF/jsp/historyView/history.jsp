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

    <title>History</title>

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
            height: 820px;
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
                <h5><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">History</span></h5>
                <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
            </div>
        </div>
    </div>
    <!-- /page header -->

    <div class="content">
        <div class="card">
            <!-- card header -->
            <div class="card-header header-elements-inline font-size-base">
                <!-- reload the search input -->
                <div class="header-elements">
                    <div class="list-icons">
                        <a class="list-icons-item" data-action="reload" onclick="resetSearch();"></a>
                    </div>
                </div>
                <!-- /reload the search input -->
            </div>
            <!-- /card header -->

            <!-- Drop box Start -->
            <div class="form-group row font-size-xs" style="margin-left: 10px;">
                <!-- search 'All' -->
                <select class="form-control font-size-xs" aria-hidden="true" style="width: 150px; margin-left: 10px;" name="searchType" id="searchType">
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
										<button class="btn border font-size-xs" type="button" onclick="searchHistory();" id="searchButton"><i class="icon-search4"></i></button>
									</span>
                    </div>
                </div>
                <!-- /search input -->
                <button class="btn btn-outline bg-slate-600 text-slate-600 border-slate-600 font-size-xs" type="button" data-toggle="modal" data-target="#modal" id="newButton" onclick="openModal('add');" style="margin-left: auto; margin-right: 50px;">
                    New
                </button>
            </div>
            <!-- /Drop box Start -->

            <!-- History table -->
            <table class="table-bordered-0 table-sm datatable-pagination table-striped table-hover" style="font-size: 12px">
                <thead>
                <tr style="background-color: #4DB6AC; color: white">
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Description</th>
                    <th>Transaction</th>
                    <th>Category</th>
                    <th class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${entryList}" var="entry" varStatus="status">
                        <tr>
                            <td>${entry.dateTime}</td>
                            <td>
                                <fmt:setLocale value = "en_US"/>
                                <fmt:formatNumber value = "${entry.amount}" type = "currency"/>
                            </td>
                            <td>${entry.description}</td>
                            <td>${entry.transaction}</td>
                            <td>${entry.category}</td>
                            <td class="text-center">
                                <div class="list-icons">
                                    <button type="button" class="btn btn-outline bg-primary text-primary-800 btn-icon ml-2" data-toggle="modal" data-target="#modal" id="detailButton" onclick="openModal('detail');" ><i class="icon-search4"></i></button>
                                    <button type="button" class="btn btn-outline bg-danger text-danger-800 btn-icon ml-2" data-toggle="modal" data-target="#modal" id="deleteButton" onclick="openModal('detail');" ><i class="icon-trash"></i></button>
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
                        <form action="/history/info" class="form-horizontal" id="create">
<%--                            <input type="hidden" id="wordSeq" name="wordSeq">--%>
                            <div class="modal-body">
                                <!-- Date -->
                                <div class="form-group row" >
                                    <label class="col-form-label col-sm-3">Date</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="dateTime" name="dateTime" placeholder="MM/DD/YYYY" class="form-control">
                                    </div>
                                </div>
                                <!-- /Date -->
                                <!-- Amount -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Amount</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="amount" name="amount" placeholder="Write amount (ex. 420)" class="form-control">
                                    </div>
                                </div>
                                <!-- /Amount -->
                                <!-- Description -->
                                <div class="form-group row" >
                                    <label class="col-form-label col-sm-3">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="description" name="description" placeholder="Write description" class="form-control">
                                    </div>
                                </div>
                                <!-- /Description -->
                                <!-- Transaction -->
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">Transaction</label>
<%--                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Transaction</button>--%>
                                    <select class="form-control font-size-xs" style="width: 150px; margin-left: 10px;" aria-hidden="true" id="transaction" name="transaction">
                                        <option value="none">Select...</option>
                                        <option value="expense">Expense</option>
                                        <option value="investments">Investments</option>
                                        <option value="income">Income</option>
                                        <option value="savings">Saving</option>
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
                            <!-- Button -->
                             <div class="modal-footer">
                                <button type="submit" id="saveButton" class="btn bg-teal" onclick="saveConfirm();">Save</button>
                                <button type="button" id="updateButton" class="btn bg-teal" onclick="updateConfirm();">Edit</button>
                                <button type="button" id="cancelButton" class="btn btn-outline" data-dismiss="modal">Close</button>
                             </div>
                        </form>
                        <!-- /Modal content -->


                        <!-- /Button -->
                    </div>
                </div>
            </div>
            <!-- /Modal End -->
        </div>
    </div>
</div>
<!-- Table area End-->
</body>
</html>

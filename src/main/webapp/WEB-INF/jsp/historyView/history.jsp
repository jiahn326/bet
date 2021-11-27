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
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/components_modals.js"></script>

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
    <div class="content">
        <div class="card">
            <!-- card header -->
            <div class="card-header header-elements-inline font-size-base">
                <!-- title of the page -->
                <h5 class="card-title font-size-lg"><strong>History</strong></h5>
                <!-- /title of the page -->

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
                                    <button type="button" class="btn btn-outline bg-danger text-danger-800 btn-icon ml-2" data-toggle="modal" data-target="#modal" id="detailButton" onclick="openModal('detail');" ><i class="icon-trash"></i></button>
<%--                                    <a href="#" class="badge badge-flat border-primary text-primary-600 badge-icon" data-toggle="modal" data-target="#modal" id="detailButton" onclick="openModal('detail');" ><i class="icon-search4"></i></a>--%>
<%--                                    <a href="#" class="badge badge-flat border-danger text-danger-600 badge-icon"><i class="icon-trash"></i></a>--%>
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
                            <h3 class="modal-title"><strong>Add History</strong></h3>
                            <button type="button" class="close" data-dismiss="modal" style="color: black">×</button>
                        </div>
                        <!-- /Modal header -->

                        <!-- Modal content -->
                        <form action="${pageContext.request.contextPath}/create" class="form-horizontal" id="create">
<%--                            <input type="hidden" id="wordSeq" name="wordSeq">--%>
                            <div class="modal-body">
                                <!-- Date -->
                                <div class="form-group row" id="date">
                                    <label class="col-form-label col-sm-3">Date</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="dateTime" placeholder="MM/DD/YYYY" class="form-control">
                                    </div>
                                </div>
                                <!-- /Date -->
                                <!-- Amount -->
                                <div class="form-group row" id="amount">
                                    <label class="col-form-label col-sm-3">Amount</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="amount" placeholder="Write amount (ex. 420)" class="form-control">
                                    </div>
                                </div>
                                <!-- /Amount -->
                                <!-- Description -->
                                <div class="form-group row" id="description">
                                    <label class="col-form-label col-sm-3">Description</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="description" placeholder="Write description" class="form-control">
                                    </div>
                                </div>
                                <!-- /Description -->
                                <!-- Transaction -->
                                <div class="form-group row" id="transaction">
                                    <label class="col-form-label col-sm-3">Transaction</label>
<%--                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Transaction</button>--%>
                                    <select class="form-control font-size-xs" style="width: 150px; margin-left: 10px;" aria-hidden="true" name="transaction">
                                        <option value="none">Select...</option>
                                        <option value="expense">Expense</option>
                                        <option value="investments">Investments</option>
                                        <option value="income">Income</option>
                                        <option value="savings">Saving</option>
                                    </select>
                                </div>
<%--                                <div class="btn-group" id="transaction">--%>
<%--                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Select transaction</button>--%>
<%--                                    <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-73px, 36px, 0px);">--%>
<%--                                        <a href="#" class="dropdown-item"> Action</a>--%>
<%--                                        <a href="#" class="dropdown-item"> Another action</a>--%>
<%--                                        <a href="#" class="dropdown-item"> One more action</a>--%>
<%--                                        <div class="dropdown-divider"></div>--%>
<%--                                        <a href="#" class="dropdown-item"><i class="icon-gear"></i> Separated line</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>


<%--                                <div class="form-group row" id="transaction">--%>
<%--                                    <label class="col-form-label col-sm-3">Transaction</label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <input type="text" name="transcationInput" placeholder="Write Transaction" class="form-control">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <!-- /Transaction -->

                                <!-- Category -->
                                <div class="form-group row" id="category">
                                    <label class="col-form-label col-sm-3">Category</label>
                                    <select class="form-control font-size-xs" aria-hidden="true" style="width: 150px; margin-left: 10px;" name="category">
                                        <option value="none">Select...</option>
                                        <option value="wants">Wants</option>
                                        <option value="needs">Needs</option>
                                        <option value="savings">Saving</option>
                                    </select>
                                </div>
<%--                                <div class="form-group row" id="category">--%>
<%--                                    <label class="col-form-label col-sm-3">Category</label>--%>
<%--                                    <div class="col-sm-9">--%>
<%--                                        <input type="text" name="categoryInput" placeholder="Write Category" class="form-control">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <!-- /Category -->
                            </div>
                        </form>
                        <!-- /Modal content -->

                        <!-- Button -->
                        <div class="modal-footer">
                            <button type="submit" id="saveButton" class="btn bg-teal" onclick="saveConfirm();">Save</button>
                            <button type="button" id="updateButton" class="btn bg-teal" onclick="updateConfirm();">Edit</button>
                            <button type="button" id="cancelButton" class="btn btn-outline" data-dismiss="modal">Close</button>
                        </div>
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

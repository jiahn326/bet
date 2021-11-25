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
    <script src="${pageContext.request.contextPath}/js/table/inputPage.js"></script>
    <script src="${pageContext.request.contextPath}/js/table/pageListBox.js"></script>
    <script src="${pageContext.request.contextPath}/js/table/dataTable.js"></script>
    <script src="${pageContext.request.contextPath}/js/history/history.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/datatables_basic.js"></script>

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
<%--                    <option value="date">Date</option>--%>
                    <option value="description">Description</option>
                    <option value="type">Type</option>
                    <option value="category">Category</option>
                </select>
                <!-- /search 'All' -->

                <!-- search input -->
                <div class="col-lg-1" style="margin-left: -5px;">
                    <div class="input-group" style="width: 400px;">
                        <input type="text" class="form-control border-right-0 font-size-xs" placeholder="" name="keyword" id="keyword">
                        <span class="input-group-append">
										<button class="btn border font-size-xs" type="button" onclick="searchDomain();" id="searchButton"><i class="icon-search4"></i></button>
									</span>
                    </div>
                </div>
                <!-- /search input -->
                <button class="btn btn-outline bg-slate-600 text-slate-600 border-slate-600 font-size-xs" type="button" data-toggle="modal" data-target="#modal" id="newButton" onclick="openModal('add');" style="margin-left: auto; margin-right: 30px;">New</button>
            </div>
            <!-- /Drop box Start -->

            <!-- History table -->
            <table action="historyView/history" class="table-bordered-0 table-sm datatable-pagination table-striped table-hover" id="historyView/history" style="font-size: 15px">
                <thead>
                <tr style="background-color: #4DB6AC; color: white">
                    <th>Date</th>
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
                            <td>${entry.description}</td>
                            <td>${entry.transaction}</td>
                            <td>${entry.category}</td>
                        </tr>
                    </c:forEach>
                    <td>11/23/2021</td>
                    <td>Testing</td>
                    <td>testing</td>
                    <td><span class="badge badge-light">Saving</span></td>
                    <td class="text-center">
                        <div class="list-icons">
                            <a href="#" class="badge badge-flat border-primary text-primary-600 badge-icon"><i class="icon-search4"></i></a>
                            <a href="#" class="badge badge-flat border-danger text-danger-600 badge-icon"><i class="icon-trash"></i></a>
                        </div>
                    </td>
                </tr>
                <%--<ul class="list-group">
                <c:forEach var="entry" items="${entryList}">
                    <li class="list-group-item list-group-item-action">${entry}</li>
                </c:forEach>
                </ul--%>>
                </tbody>
            </table>
            <!-- /History table -->
        </div>
    </div>
</div>
<!-- Table area End-->
</body>
</html>

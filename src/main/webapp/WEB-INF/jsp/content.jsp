<%--
  Created by IntelliJ IDEA.
  User: Jihyun Ahn
  Date: 10/27/2021
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/common/templateCss.jsp" %>

<head>
    <title>Content</title>
</head>
<body>
    <div class="d-flex flex-column flex-1">
        <%@ include file="/WEB-INF/jsp/common/templateHeader.jsp" %>
<%--        <c:import url="/WEB-INF/jsp/common/templateHeader.jsp" />--%>

        <c:set var="firstUrl" value="${pageContext.request.contextPath}/historyView/history" />
        <!-- Page content -->
        <div class="page-content">
            <%@ include file="/WEB-INF/jsp/common/templateSidebar.jsp" %>
<%--            <c:import url="/WEB-INF/jsp/common/templateSidebar.jsp" />--%>
            <iframe name="contentMain" id="contentMain" src="${firstUrl}" width="100%" frameborder="0"></iframe>
        </div>
        <!-- /page content -->
    </div>
</body>
</html>

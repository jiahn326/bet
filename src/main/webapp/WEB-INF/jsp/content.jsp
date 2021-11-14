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
<body class="">
<!-- Main header -->
<%@ include file="/WEB-INF/jsp/common/templateHeader.jsp" %>
<%--<c:import url="/WEB-INF/jsp/common/templateHeader.jsp"/>--%>
<!-- /Main header -->

<%--<c:set var="firstUrl" value="${pageContext.request.contextPath}/history/info" />--%>

<!-- page content -->
<div class="page-content">
<%--    <c:import url="/WEB-INF/jsp/common/templateSidebar.jsp" />--%>
<%--    <iframe name="contentMain" id="contentMain" src="${firstUrl}" width="100%" frameborder="0"></iframe>--%>
    <%@ include file="/WEB-INF/jsp/common/templateSidebar.jsp" %>
    <%--            <c:import url="/WEB-INF/jsp/common/templateSidebar.jsp" />--%>
    <iframe name="contentMain" id="contentMain" src="${pageContext.request.contextPath}/history/info" width="100%" frameborder="0"></iframe>
</div>
<!-- /page content -->
</body>
</html>

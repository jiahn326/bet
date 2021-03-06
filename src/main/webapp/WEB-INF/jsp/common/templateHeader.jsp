<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/common/templateCss.jsp"%>

<style>
.navbar-brand img {
	height: 25px;
	display: block;
}
</style>

<!-- Main nav bar -->
<div class="navbar navbar-expand-md navbar-dark">
    <div class="navbar-brand">
        <a href="#" class="d-inline-block">
            <img src="${pageContext.request.contextPath}/images/BET_LOGO_IMG_TEXT.png" alt="" style="height: 25px">
        </a>
    </div>

    <div class="d-md-none">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
            <i class="icon-tree5"></i>
        </button>
        <button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
            <i class="icon-paragraph-justify3"></i>
        </button>
    </div>

    <div class="collapse navbar-collapse" id="navbar-mobile">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
                    <i class="icon-paragraph-justify3"></i>
                </a>
            </li>
        </ul>

        <span class="badge ml-md-3 mr-md-auto"> &nbsp; </span>

        <ul class="navbar-nav">
            <li class="nav-item dropdown dropdown-user">
                <a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
                    <img src="${pageContext.request.contextPath}/template/global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34" alt="">
                    <span>${userName}</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
<%--                    <div class="dropdown-divider"></div>--%>
                    <a href="#" class="dropdown-item" onclick="changeMenu('${pageContext.request.contextPath}/user/info',this)"><i class="icon-cog5"></i> Account settings</a>
                    <a href="#" class="dropdown-item" onclick="location.href='/logout'"><i class="icon-switch2"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- /Main nav bar-->

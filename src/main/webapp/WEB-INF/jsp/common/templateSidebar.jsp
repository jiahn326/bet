<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/common/templateCss.jsp"%>

<style>
    .sidebar{
        height: 100%;
    }
</style>

<!-- Main sidebar -->
<div class="sidebar sidebar-dark sidebar-main sidebar-expand-md">
    <!-- change page when user click the sidebar -->
    <script>
        function changeMenu(menuUrl, selectItem){
            // to active the submenus
            var second = document.getElementsByClassName('second');
            for(var i=0; i < second.length; i++) {
                $($('.second')[i]).removeClass('active');
            }
            $(selectItem).addClass('active');
            $("#contentMain").attr("src",menuUrl);
        }
    </script>
    <!-- /change page when user click the sidebar -->

    <!-- Sidebar mobile toggler -->
    <div class="sidebar-mobile-toggler text-center">
        <a href="#" class="sidebar-mobile-main-toggle">
            <i class="icon-arrow-left8"></i>
        </a>
        Navigation
        <a href="#" class="sidebar-mobile-expand">
            <i class="icon-screen-full"></i>
            <i class="icon-screen-normal"></i>
        </a>
    </div>
    <!-- /sidebar mobile toggler -->
    <!-- Sidebar content -->
    <div class="sidebar-content">

        <!-- User menu -->
        <div class="sidebar-user">
            <div class="card-body">
                <div class="media">
                    <!-- Emoji -->
                    <div class="card-body bg-indigo-400 text-center card-img-top" style="background-color: #263238; background-size: contain;">
                        <div class="card-img-actions d-inline-block mb-3">
                            <c:choose>
                                <c:when test="${emoji eq 'supersmile'}">
                                    <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/images/BET_EMOJI_SUPERSMILE.png" width="170" height="170" alt="">
                                </c:when>
                                <c:when test="${emoji eq 'smile'}">
                                    <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/images/BET_EMOJI_SMILE.png" width="170" height="170" alt="">
                                </c:when>
                                <c:when test="${emoji eq 'sad'}">
                                    <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/images/BET_EMOJI_SAD.png" width="170" height="170" alt="">
                                </c:when>
                                <c:when test="${emoji eq 'angry'}">
                                    <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/images/BET_EMOJI_ANGRY.png" width="170" height="170" alt="">
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /user menu -->

        <!-- Main navigation -->
        <div class="card card-sidebar-mobile">
            <ul class="nav nav-sidebar">
                <li class="nav-item nav-item-submenu">
                    <!-- Main -->
                    <%--                        <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li>--%>
                    <li class="nav-item" style="display: block;">
                        <a href="#" class="nav-link active second" onclick="changeMenu('${pageContext.request.contextPath}/history/info',this)">
                            <i class="icon-file-text3"></i>
                            <span>
                                        Account
                                    </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link second" onclick="changeMenu('${pageContext.request.contextPath}/budget/info',this)">
                            <i class="icon-piggy-bank"></i>
                            <span>
                                            Budget
                                        </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link second" onclick="changeMenu('${pageContext.request.contextPath}/chart/info',this)">
                            <i class="icon-stats-bars"></i>
                            <span>
                                        Chart
                                    </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link second" onclick="changeMenu('${pageContext.request.contextPath}/calendar/info',this)">
                            <i class="icon-calendar2"></i>
                            <span>
                                        Calendar
                                    </span>
                        </a>
                    </li>
                    <!-- /Main -->
                </li>
            </ul>
        </div>
        <!-- /Main navigation -->

    </div>
    <!-- /Sidebar content -->
</div>
<!-- /main sidebar -->

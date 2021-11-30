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
<%--                    <div class="mr-3">--%>
<%--                        <a href="#"><img src="${pageContext.request.contextPath}/images/BET_EMOJI_SUPERSMILE.png" width="200" height="auto" class="rounded-circle" alt=""></a>--%>
<%--                    </div>--%>

                    <div class="card-body bg-indigo-400 text-center card-img-top" style="background-color: #263238; background-size: contain;">
                        <div class="card-img-actions d-inline-block mb-3">
                            <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/images/BET_EMOJI_SUPERSMILE.png" width="170" height="170" alt="">
<%--                            <div class="card-img-actions-overlay rounded-circle">--%>
<%--                                <a href="#" class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round">--%>
<%--                                    <i class="icon-plus3"></i>--%>
<%--                                </a>--%>
<%--                                <a href="user_pages_profile.html" class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round ml-2">--%>
<%--                                    <i class="icon-link"></i>--%>
<%--                                </a>--%>
<%--                            </div>--%>
                        </div>

<%--                        <h6 class="font-weight-semibold mb-0">Victoria Davidson</h6>--%>
<%--                        <span class="d-block opacity-75">Head of UX</span>--%>
                    </div>

                    <!-- Emoji -->
<%--                    <div class="card" id="emojiStatus">--%>
<%--                        <div class="card-img-actions">--%>
<%--                            <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/images/BET_EMOJI_SUPERSMILE.png" align="center" width="100" height="auto" alt="">--%>
<%--                        </div>--%>

<%--                        <h5 class="card-title">Current Status: </h5>--%>
<%--                    </div>--%>

<%--                    <div class="media-body">--%>
<%--                        <div class="media-title font-weight-semibold">Jihyun Ahn</div>--%>
<%--                        <div class="font-size-xs opacity-50">--%>
<%--                            <i class="icon-pin font-size-sm"></i> &nbsp;Bridgeport, CT--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="ml-3 align-self-center">--%>
<%--                        <a href="#" class="text-white"><i class="icon-cog3"></i></a>--%>
<%--                    </div>--%>
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
                    <li class="nav-item">
                        <a href="#" class="nav-link second" onclick="changeMenu('${pageContext.request.contextPath}/budget/info',this)">
                            <i class="icon-piggy-bank"></i>
                            <span>
                                        Budget
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

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
            /* Block current page on button click */
            // $('#block-page').on('click', function() {
            //     $.blockUI({
            //         message: '<i class="icon-spinner4 spinner"></i>',
            //         timeout: 300,
            //         overlayCSS: {
            //             backgroundColor: '#1b2024',
            //             opacity: 0.8,
            //             cursor: 'wait'
            //         },
            //         css: {
            //             border: 0,
            //             color: '#fff',
            //             padding: 0,
            //             backgroundColor: 'transparent'
            //         }
            //     });
            // });

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
                    <div class="mr-3">
                        <a href="#"><img src="${pageContext.request.contextPath}/template/global_assets/images/placeholders/placeholder.jpg" width="38" height="38" class="rounded-circle" alt=""></a>
                    </div>

                    <div class="media-body">
                        <div class="media-title font-weight-semibold">Jihyun Ahn</div>
                        <div class="font-size-xs opacity-50">
                            <i class="icon-pin font-size-sm"></i> &nbsp;Bridgeport, CT
                        </div>
                    </div>

                    <div class="ml-3 align-self-center">
                        <a href="#" class="text-white"><i class="icon-cog3"></i></a>
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
                                    History
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
            </ul>
        </div>
        <!-- /Main navigation -->

    </div>
    <!-- /Sidebar content -->
</div>
<!-- /main sidebar -->

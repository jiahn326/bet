<%--
  Created by IntelliJ IDEA.
  User: Jihyun Ahn
  Date: 11/9/2021
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/common/templateCss.jsp" %>
<html>
<head>
    <title>Calender</title>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/core/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/daygrid/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/timegrid/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/ui/fullcalendar/interaction/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/fullcalendar_styling.js"></script>
</head>
<body>
<div class="content-wrapper">
    <div style="position:fixed;
            z-index: 2; /* above everything else */
            top:0; left:0; bottom:0; right:0;
            background:rgba(0,0,0,.5);">
        For next update
    </div>
    <!-- Page header -->
    <div class="page-header page-header-light">
        <div class="page-header-content header-elements-md-inline">
            <div class="page-title d-flex">
                <h5><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Calendar</span></h5>
                <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
            </div>
        </div>
    </div>
    <!-- /page header -->

    <div class="content">
        <!-- Event colors -->
        <div class="card card-img-actions" style="position: relative">
            <div class="card-header header-elements-inline">
                <h5 class="card-title">Event colors</h5>
                <div class="header-elements">
                    <div class="list-icons">
                        <a class="list-icons-item" data-action="collapse"></a>
                        <a class="list-icons-item" data-action="reload"></a>
                        <a class="list-icons-item" data-action="remove"></a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="fullcalendar-event-colors"></div>
            </div>
        </div>

        <!-- Block -->
        <div class="card-img-actions-overlay" style="position: relative">
            <h4>For the next update...</h4>
        </div>
        <!-- /Block -->
        <div class="card">
            <div class="card-header header-elements-inline">
                <h5 class="card-title">Calender</h5>
                <div class="header-elements">
                    <div class="list-icons">
                        <a class="list-icons-item" data-action="collapse"></a>
                        <a class="list-icons-item" data-action="reload"></a>
                        <a class="list-icons-item" data-action="remove"></a>
                    </div>
                </div>
            </div>

            <div class="card-body">
    <%--
               <p class="mb-3">FullCalendar allows you to change the color of all events on the calendar using the <code>eventColor</code> option. Also you can change text, border and background colors for events in a specific Event Source with <code>event source</code> options (backgroundColor, color, textColor and borderColor) and for individual events with <code>color</code> option, which sets an event's background and border color. Example below demonstrates event colors based on a day of the week.</p>
    --%>



                <div class="fullcalendar-event-colors fc fc-ltr fc-unthemed" style="">
                    <div class="fc-toolbar fc-header-toolbar">
                        <div class="fc-left">
                            <div class="fc-button-group">
                                <button type="button" class="fc-prev-button fc-button fc-button-primary" aria-label="prev">
                                    <span class="fc-icon fc-icon-chevron-left">
                                    </span></button>
                                <button type="button" class="fc-next-button fc-button fc-button-primary" aria-label="next">
                                    <span class="fc-icon fc-icon-chevron-right">
                                    </span></button>
                            </div>
                            <button type="button" class="fc-today-button fc-button fc-button-primary">today</button>
                        </div><div class="fc-center"><h2>November 2014</h2></div><div class="fc-right"><div class="fc-button-group"><button type="button" class="fc-dayGridWeek-button fc-button fc-button-primary">month</button><button type="button" class="fc-dayGridWeek-button fc-button fc-button-primary">week</button><button type="button" class="fc-dayGridDay-button fc-button fc-button-primary">day</button></div></div></div><div class="fc-view-container"><div class="fc-view fc-dayGridMonth-view fc-dayGrid-view" style=""><table class=""><thead class="fc-head"><tr><td class="fc-head-container fc-widget-header"><div class="fc-row fc-widget-header" style="border-right-width: 1px; margin-right: 16px;"><table class=""><thead><tr><th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th><th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th><th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th><th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th><th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th><th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th><th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th></tr></thead></table></div></td></tr></thead><tbody class="fc-body"><tr><td class="fc-widget-content"><div class="fc-scroller fc-day-grid-container" style="overflow: hidden scroll; height: 409px;"><div class="fc-day-grid"><div class="fc-row fc-week fc-widget-content" style=""><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-other-month fc-past" data-date="2014-10-26"></td><td class="fc-day fc-widget-content fc-mon fc-other-month fc-past" data-date="2014-10-27"></td><td class="fc-day fc-widget-content fc-tue fc-other-month fc-past" data-date="2014-10-28"></td><td class="fc-day fc-widget-content fc-wed fc-other-month fc-past" data-date="2014-10-29"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-past" data-date="2014-10-30"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-past" data-date="2014-10-31"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2014-11-01"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-other-month fc-past" data-date="2014-10-26"><span class="fc-day-number">26</span></td><td class="fc-day-top fc-mon fc-other-month fc-past" data-date="2014-10-27"><span class="fc-day-number">27</span></td><td class="fc-day-top fc-tue fc-other-month fc-past" data-date="2014-10-28"><span class="fc-day-number">28</span></td><td class="fc-day-top fc-wed fc-other-month fc-past" data-date="2014-10-29"><span class="fc-day-number">29</span></td><td class="fc-day-top fc-thu fc-other-month fc-past" data-date="2014-10-30"><span class="fc-day-number">30</span></td><td class="fc-day-top fc-fri fc-other-month fc-past" data-date="2014-10-31"><span class="fc-day-number">31</span></td><td class="fc-day-top fc-sat fc-past" data-date="2014-11-01"><span class="fc-day-number">1</span></td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable" style="background-color:#EF5350;border-color:#EF5350"><div class="fc-content"> <span class="fc-title">All Day Event</span></div><div class="fc-resizer fc-end-resizer"></div></a></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style=""><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2014-11-02"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2014-11-03"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2014-11-04"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2014-11-05"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2014-11-06"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2014-11-07"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2014-11-08"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2014-11-02"><span class="fc-day-number">2</span></td><td class="fc-day-top fc-mon fc-past" data-date="2014-11-03"><span class="fc-day-number">3</span></td><td class="fc-day-top fc-tue fc-past" data-date="2014-11-04"><span class="fc-day-number">4</span></td><td class="fc-day-top fc-wed fc-past" data-date="2014-11-05"><span class="fc-day-number">5</span></td><td class="fc-day-top fc-thu fc-past" data-date="2014-11-06"><span class="fc-day-number">6</span></td><td class="fc-day-top fc-fri fc-past" data-date="2014-11-07"><span class="fc-day-number">7</span></td><td class="fc-day-top fc-sat fc-past" data-date="2014-11-08"><span class="fc-day-number">8</span></td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td class="fc-event-container" colspan="2"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-not-end fc-draggable" style="background-color:#26A69A;border-color:#26A69A"><div class="fc-content"> <span class="fc-title">Long Event</span></div></a></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content"><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2014-11-09"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2014-11-10"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2014-11-11"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2014-11-12"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2014-11-13"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2014-11-14"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2014-11-15"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2014-11-09"><span class="fc-day-number">9</span></td><td class="fc-day-top fc-mon fc-past" data-date="2014-11-10"><span class="fc-day-number">10</span></td><td class="fc-day-top fc-tue fc-past" data-date="2014-11-11"><span class="fc-day-number">11</span></td><td class="fc-day-top fc-wed fc-past" data-date="2014-11-12"><span class="fc-day-number">12</span></td><td class="fc-day-top fc-thu fc-past" data-date="2014-11-13"><span class="fc-day-number">13</span></td><td class="fc-day-top fc-fri fc-past" data-date="2014-11-14"><span class="fc-day-number">14</span></td><td class="fc-day-top fc-sat fc-past" data-date="2014-11-15"><span class="fc-day-number">15</span></td></tr></thead><tbody><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end fc-draggable fc-resizable" style="background-color:#26A69A;border-color:#26A69A"><div class="fc-content"> <span class="fc-title">Long Event</span></div><div class="fc-resizer fc-end-resizer"></div></a></td><td rowspan="6"></td><td class="fc-event-container" colspan="2"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"> <span class="fc-title">Conference</span></div><div class="fc-resizer fc-end-resizer"></div></a></td><td class="fc-event-container" rowspan="6"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">7a</span> <span class="fc-title">Birthday Party</span></div></a></td><td rowspan="6"></td><td rowspan="6"></td></tr><tr><td class="fc-event-container" rowspan="5"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#26A69A;border-color:#26A69A"><div class="fc-content"><span class="fc-time">4p</span> <span class="fc-title">Repeating Event</span></div></a></td><td rowspan="5"></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">10:30a</span> <span class="fc-title">Meeting</span></div></a></td></tr><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">12p</span> <span class="fc-title">Lunch</span></div></a></td></tr><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">2:30p</span> <span class="fc-title">Meeting</span></div></a></td></tr><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">5:30p</span> <span class="fc-title">Happy Hour</span></div></a></td></tr><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#546E7A;border-color:#546E7A"><div class="fc-content"><span class="fc-time">8p</span> <span class="fc-title">Dinner</span></div></a></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style=""><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2014-11-16"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2014-11-17"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2014-11-18"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2014-11-19"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2014-11-20"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2014-11-21"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2014-11-22"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2014-11-16"><span class="fc-day-number">16</span></td><td class="fc-day-top fc-mon fc-past" data-date="2014-11-17"><span class="fc-day-number">17</span></td><td class="fc-day-top fc-tue fc-past" data-date="2014-11-18"><span class="fc-day-number">18</span></td><td class="fc-day-top fc-wed fc-past" data-date="2014-11-19"><span class="fc-day-number">19</span></td><td class="fc-day-top fc-thu fc-past" data-date="2014-11-20"><span class="fc-day-number">20</span></td><td class="fc-day-top fc-fri fc-past" data-date="2014-11-21"><span class="fc-day-number">21</span></td><td class="fc-day-top fc-sat fc-past" data-date="2014-11-22"><span class="fc-day-number">22</span></td></tr></thead><tbody><tr><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable" style="background-color:#5C6BC0;border-color:#5C6BC0"><div class="fc-content"><span class="fc-time">4p</span> <span class="fc-title">Repeating Event</span></div></a></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style=""><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2014-11-23"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2014-11-24"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2014-11-25"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2014-11-26"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2014-11-27"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2014-11-28"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2014-11-29"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2014-11-23"><span class="fc-day-number">23</span></td><td class="fc-day-top fc-mon fc-past" data-date="2014-11-24"><span class="fc-day-number">24</span></td><td class="fc-day-top fc-tue fc-past" data-date="2014-11-25"><span class="fc-day-number">25</span></td><td class="fc-day-top fc-wed fc-past" data-date="2014-11-26"><span class="fc-day-number">26</span></td><td class="fc-day-top fc-thu fc-past" data-date="2014-11-27"><span class="fc-day-number">27</span></td><td class="fc-day-top fc-fri fc-past" data-date="2014-11-28"><span class="fc-day-number">28</span></td><td class="fc-day-top fc-sat fc-past" data-date="2014-11-29"><span class="fc-day-number">29</span></td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable fc-resizable" href="http://google.com/" style="background-color:#FF7043;border-color:#FF7043"><div class="fc-content"> <span class="fc-title">Click for Google</span></div><div class="fc-resizer fc-end-resizer"></div></a></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style=""><div class="fc-bg"><table class=""><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2014-11-30"></td><td class="fc-day fc-widget-content fc-mon fc-other-month fc-past" data-date="2014-12-01"></td><td class="fc-day fc-widget-content fc-tue fc-other-month fc-past" data-date="2014-12-02"></td><td class="fc-day fc-widget-content fc-wed fc-other-month fc-past" data-date="2014-12-03"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-past" data-date="2014-12-04"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-past" data-date="2014-12-05"></td><td class="fc-day fc-widget-content fc-sat fc-other-month fc-past" data-date="2014-12-06"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-top fc-sun fc-past" data-date="2014-11-30"><span class="fc-day-number">30</span></td><td class="fc-day-top fc-mon fc-other-month fc-past" data-date="2014-12-01"><span class="fc-day-number">1</span></td><td class="fc-day-top fc-tue fc-other-month fc-past" data-date="2014-12-02"><span class="fc-day-number">2</span></td><td class="fc-day-top fc-wed fc-other-month fc-past" data-date="2014-12-03"><span class="fc-day-number">3</span></td><td class="fc-day-top fc-thu fc-other-month fc-past" data-date="2014-12-04"><span class="fc-day-number">4</span></td><td class="fc-day-top fc-fri fc-other-month fc-past" data-date="2014-12-05"><span class="fc-day-number">5</span></td><td class="fc-day-top fc-sat fc-other-month fc-past" data-date="2014-12-06"><span class="fc-day-number">6</span></td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div></div></div></td></tr></tbody></table></div></div></div>
            </div>
        </div>
        <!-- /event colors -->
    </div>
</div>
</body>
</html>

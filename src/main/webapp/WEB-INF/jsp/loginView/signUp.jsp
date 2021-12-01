<%--
  Created by IntelliJ IDEA.
  User: Jihyun Ahn
  Date: 10/25/2021
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%@ include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@ include file="/WEB-INF/jsp/common/templateCss.jsp" %>


    <title>SignUp Page</title>

    <!-- Theme JS files -->
    <script src="${pageContext.request.contextPath}/template/assets/js/app.js"></script>

    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/login.js"></script>

    <link href="${pageContext.request.contextPath}/template/assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">

    <!-- /theme JS files -->
</head>
<body>

<!-- Main header -->
<%@ include file="/WEB-INF/jsp/common/templateHeader.jsp" %>
<!-- /Main header -->

<!-- Page content -->
<div class="page-content">

    <!-- Main content -->
    <div class="content-wrapper">

        <!-- Content area -->
        <div class="content d-flex justify-content-center align-items-center">

            <!-- Registration form -- ID AND ACTION ADDED TO CONNECT FORM TO JAVA FILE-->
            <form id="signUp" action="signUp" class="flex-fill">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="card mb-0">
                            <div class="card-body">
                                <div class="text-center mb-3">
                                    <i class="icon-plus3 icon-2x text-success border-success border-3 rounded-round p-3 mb-3 mt-1"></i>
                                    <h5 class="mb-0">Create account</h5>
                                    <span class="d-block text-muted">All fields are required</span>
                                </div>

                                <div class="form-group form-group-feedback form-group-feedback-right">
                                    <input type="text" class="form-control" name="username" placeholder="Create Username">
                                    <div class="form-control-feedback">
                                        <i class="icon-user-plus text-muted"></i>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="text" class="form-control" name="firstname" placeholder="First name">
                                            <div class="form-control-feedback">
                                                <i class="icon-user-check text-muted"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="text" class="form-control" name="lastname" placeholder="Last name">
                                            <div class="form-control-feedback">
                                                <i class="icon-user-check text-muted"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="password" class="form-control" name="password" placeholder="Create password">
                                            <div class="form-control-feedback">
                                                <i class="icon-user-lock text-muted"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="password" class="form-control" name="repeatpassword" placeholder="Repeat password">
                                            <div class="form-control-feedback">
                                                <i class="icon-user-lock text-muted"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="email" class="form-control" name="email" placeholder="Your email">
                                            <div class="form-control-feedback">
                                                <i class="icon-mention text-muted"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group form-group-feedback form-group-feedback-right">
                                            <input type="email" class="form-control" name="repeatemail" placeholder="Repeat email">
                                            <div class="form-control-feedback">
                                                <i class="icon-mention text-muted"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

<%--                                <div class="form-group">--%>
<%--                                    <div class="form-check">--%>
<%--                                        <label class="form-check-label">--%>
<%--                                            <input type="checkbox" class="form-input-styled" checked data-fouc>--%>
<%--                                            Send me <a href="#">test account settings</a>--%>
<%--                                        </label>--%>
<%--                                    </div>--%>

<%--                                    <div class="form-check">--%>
<%--                                        <label class="form-check-label">--%>
<%--                                            <input type="checkbox" class="form-input-styled" checked data-fouc>--%>
<%--                                            Subscribe to monthly newsletter--%>
<%--                                        </label>--%>
<%--                                    </div>--%>

<%--                                    <div class="form-check">--%>
<%--                                        <label class="form-check-label">--%>
<%--                                            <input type="checkbox" class="form-input-styled" data-fouc>--%>
<%--                                            Accept <a href="#">terms of service</a>--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <!-- Remember user email&password -->
                                <div class="form-group d-flex align-items-center">
                                    <div class="form-check mb-0">
                                        <label class="form-check-label">
                                            <input type="checkbox" name="remember" class="form-input-styled" checked data-fouc>
                                            Remember me
                                        </label>
                                    </div>

                                    <%--                            <a href="login_password_recover.html" class="ml-auto">Forgot password?</a>--%>
                                </div>
                                <!-- /Remember user email&password -->

                                <button type="submit" class="btn bg-teal-400 btn-labeled btn-labeled-right"><b><i class="icon-plus3"></i></b> Create account</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- /registration form -->

        </div>
        <!-- /content area -->
    </div>
    <!-- /Main content -->
</div>
<!-- /Page content -->

</body>
</html>

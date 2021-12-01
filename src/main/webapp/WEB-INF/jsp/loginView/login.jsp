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
    <title>Login Page</title>

    <!-- Theme JS files -->
    <script src="${pageContext.request.contextPath}/template/global_assets/js/plugins/forms/styling/uniform.min.js"></script>

    <script src="${pageContext.request.contextPath}/template/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/template/global_assets/js/demo_pages/login.js"></script>
    <!-- /theme JS files -->

    <style>
        .form-control-feedback{
            display: inline-block;
            vertical-align: -0.25em;
        }
    </style>
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

            <!-- Login form -->
            <form id = "login" action = "login" class="login-form">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="text-center mb-3">
                            <i class="icon-reading icon-2x text-slate-300 border-slate-300 border-3 rounded-round p-3 mb-3 mt-1"></i>
                            <h5 class="mb-0">Login to your account</h5>
                            <span class="d-block text-muted">Your credentials</span>
                        </div>

                        <!-- User email -->
                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input type="username" value="${username}" class="form-control" name="username" placeholder="Username">
                            <div class="form-control-feedback" >
                                <i class="icon-user text-muted"></i>
                            </div>
<%--                            <input type="text" value="${ usrId }" class="form-control" name="userId" id="id" aria-describedby="id" placeholder="아이디">--%>
                        </div>
                        <!-- User email -->

                        <!-- User password -->
                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input type="password" value="${password}" class="form-control" name="password" placeholder="Password">
                            <div class="form-control-feedback">
                                <i class="icon-lock2 text-muted"></i>
                            </div>
<%--                            <input type="password" class="form-control" name="userPwd" id="password" placeholder="비밀번호">--%>
                        </div>
                        <!-- /User password -->

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

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Sign in <i class="icon-circle-right2 ml-2"></i></button>
                        </div>

                        <!-- Form Group -->
<%--                        <div class="form-group">--%>
<%--                            <button id="login_btn" class="btn btn-primary text-uppercase" onclick="loginConfirm();" style="background-color: #324148!important;">Login</button>--%>
<%--                            &lt;%&ndash; <span class="d-inline-block ml-4">--%>
<%--                                 아직 회원이 아니신가요?  <a href="${pageContext.request.contextPath}/signup" style="color:324148;">&nbsp;&nbsp;&nbsp;회원가입</a>--%>
<%--                            </span> &ndash;%&gt;--%>
<%--                        </div>--%>
                        <!-- /form group -->

                        <div class="form-group text-center text-muted content-divider">
                            <span class="px-2">Don't have an account?</span>
                        </div>

                        <div class="form-group">
                            <a href="#" class="btn btn-light btn-block" onclick="location.href='/signUpButton'">Sign up</a>
                        </div>

<%--                        <span class="form-text text-center text-muted">By continuing, you're confirming that you've read our <a href="#">Terms &amp; Conditions</a> and <a href="#">Cookie Policy</a></span>--%>
                    </div>
                </div>
            </form>
            <!-- /login form -->

        </div>
        <!-- /content area -->
    </div>
    <!-- /Main content -->
</div>
<!-- /Page content -->
</body>

<%@ include file="/WEB-INF/jsp/common/script.jsp"%>
</html>

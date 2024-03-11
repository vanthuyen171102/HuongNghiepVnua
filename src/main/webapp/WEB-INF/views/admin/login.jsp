<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/shared/taglib.jsp"%>



<title>Đăng nhập</title>

<!-- Bootstrap-->
    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/assets/web/vendors/bootstrap/dist/css/bootstrap.min.css'/>"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/assets/web/vendors/bootstrap/dist/css/bootstrap-grid.min.css'/>"
    />

    <!-- Bootstrap Icon -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css"
      integrity="sha512-oAvZuuYVzkcTc2dH5z1ZJup5OmSQ000qlfRvuoTTiyTBjwX1faoyearj8KdMq0LgsBTHMrRuMek7s+CxF8yE+w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Jquery -->
    <script src="<c:url value='/assets/web/vendors/jquery/dist/jquery.min.js' />"></script>

    <!-- Reset CSS -->
    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/assets/web/vendors/reset/reset.css'/>"
    />

    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/assets/web/css/base.css'/>"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/assets/web/css/main.css'/>"
    />
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/common/toast/toast.css" />"/>

<script src="<c:url value="/assets/common/toast/toast.js" />"></script>

<div id="toast"></div>

<div class="auth-wrapper">
      <div class="auth-modal" tabindex="-1">
        <div class="auth-form">
          <ul class="tabs">
            <li class="tab-item active">Đăng nhập</li>
              </ul>
          <div class="tab-content">
            <div class="tab-pane active">
              <form action="/admin/login" id="signin-form" method="post">
                  <c:if test="${!empty returnUrl}">
                      <input type="hidden" name="returnUrl" value="${returnUrl}" />
                  </c:if>
                <div class="form-group mb-5">
                  <input
                    type="text"
                    id="signInName"
                    class="form-control"
                    placeholder="Tên đăng nhập"
                    name="username"
                  />
                </div>
                <div class="form-group mb-5">
                  <input
                    type="password"
                    id="signInPassword"
                    class="form-control"
                    placeholder="Mật khẩu"
                    name="password"
                  />
                </div>
                <button class="auth-btn btn" type="submit" id="signin-btn">Đăng nhập</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

<c:if test="${not empty toast.getMessage()}">
    <script>
        toast({
            title: "${toast.getTitle()}",
            type: "${toast.getType()}",
            message: "${toast.getMessage()}",
            duration: 3000
        })
    </script>
</c:if>
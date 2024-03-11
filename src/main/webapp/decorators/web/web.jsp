<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="/shared/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><dec:title></dec:title> - VNUA</title>

    <link rel="SHORTCUT ICON" href="<c:url value="/assets/web/images/Logo-Hoc-Vien-Nong-Nghiep-Viet-Nam-VNUA.png" />" type="image/x-icon">

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

    <link
            rel="stylesheet"
            type="text/css"
            href="<c:url value='/assets/web/css/responsive.css'/>"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="<c:url value='/assets/common/toast/toast.css'/>"
    />
  </head>

  <body>
    <!-- Header -->
    <%@ include file="/shared/web/header.jsp"%>
    <!-- End: Header -->

    <div class="main-content">
      <div id="toast">
      </div>
      <dec:body />
    </div>

    <!-- Footer -->
    <%@ include file="/shared/web/footer.jsp"%>
    <!-- End: Footer -->
    <script src="<c:url value='/assets/common/toast/toast.js'/>"></script>

  </body>
</html>

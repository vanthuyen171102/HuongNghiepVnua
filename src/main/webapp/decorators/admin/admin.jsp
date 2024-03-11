<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8"/>
    <title><dec:title></dec:title> - Quản trị VNUA
    </title>

    <link rel="SHORTCUT ICON" href="<c:url value="/assets/web/images/Logo-Hoc-Vien-Nong-Nghiep-Viet-Nam-VNUA.png" />"
          type="image/x-icon">

    <!-- Mobile Specific Metas -->
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/src/css/main.css" />"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/vendors/styles/core.css" />"/>
    <link
            rel="stylesheet"
            type="text/css"
            href="<c:url value="/assets/admin/vendors/styles/icon-font.min.css" />"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="<c:url value="/assets/admin/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="<c:url value="/assets/admin/src/plugins/datatables/css/responsive.bootstrap4.min.css" />"
    />

    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/vendors/styles/style.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/common/toast/toast.css" />"/>

    <%--    Jquery--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="<c:url value="/assets/common/toast/toast.js" />"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js"
            integrity="sha512-WMEKGZ7L5LWgaPeJtw9MBM4i5w5OSBlSjTjCtSnvFJGSVD26gE5+Td12qN5pvWXhuWaWcVwF++F7aqu9cvqP0A=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
<%@ include file="../../shared/admin/header.jsp" %>
<%@ include file="../../shared/admin/left-sidebar.jsp" %>


<div class="mobile-menu-overlay"></div>

<div class="main-container">
    <div class="xs-pd-20-10 pd-ltr-20">
        <div id="toast"></div>
        <dec:body/>
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
    </div>
</div>
<!-- js -->
<script src="<c:url value="/assets/admin/vendors/scripts/core.js" />"></script>
<script src="<c:url value="/assets/admin/vendors/scripts/script.min.js" />"></script>
<script src="<c:url value="/assets/admin/vendors/scripts/process.js" />"></script>
<script src="<c:url value="/assets/admin/vendors/scripts/layout-settings.js" />"></script>
<script src="<c:url value="/assets/admin/src/plugins/apexcharts/apexcharts.min.js" />"></script>
<script src="<c:url value="/assets/admin/src/plugins/datatables/js/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/assets/admin/src/plugins/datatables/js/dataTables.bootstrap4.min.js" />"></script>
<script src="<c:url value="/assets/admin/src/plugins/datatables/js/dataTables.responsive.min.js" />"></script>
<script src="<c:url value="/assets/admin/src/plugins/datatables/js/responsive.bootstrap4.min.js" />"></script>
<script src="<c:url value="/assets/admin/vendors/scripts/dashboard3.js" />"></script>

</body>
</html>
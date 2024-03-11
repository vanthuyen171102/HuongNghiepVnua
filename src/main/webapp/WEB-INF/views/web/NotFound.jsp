<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Page Not Found</title>

<!-- Bootstrap-->
<link
        rel="stylesheet"
        type="text/css"
        href="<c:url value='/assets/web/vendors/bootstrap/dist/css/bootstrap.min.css'/>"
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
<div class="mt-5 h-100 d-flex align-items-center flex-wrap justify-content-center pd-20">
    <div class="pd-10">
        <div class="error-page-wrap text-center">
            <h1 class="not-found-heading">404</h1>
            <h3 class="not-found-txt">Lỗi: 404 Page Not Found</h3>
            <p>
                Không tìm thấy trang bạn muốn truy cập
            </p>
            <div class="pt-3 mb-3">
                <a href="/trang-chu" class="btn text-white" style="background: var(--primary-color)">Quay về trang chủ</a>
            </div>
        </div>
    </div>
</div>


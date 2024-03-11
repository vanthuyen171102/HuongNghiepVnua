
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Chi tiết yêu cầu tư vấn</title>


<div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Trạng thái</label>
        <div class="col-sm-12 col-md-10 d-flex align-items-center">
            <c:choose>
                <c:when test="${advise.getIs_readed() == 1}">
                    <span class="badge badge-success font-12">Đã xem</span>
                </c:when>
                <c:otherwise>
                    <span class="badge badge-danger font-12">Chưa xem</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Họ tên</label>
        <div class="col-sm-12 col-md-10  d-flex align-items-center font-14 fw-semibold">
            <span>${advise.getName()}</span>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Số điện thoại</label>
        <div class="col-sm-12 col-md-10  d-flex align-items-center font-14 fw-semibold">
            <span>${advise.getPhone()}</span>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Email</label>
        <div class="col-sm-12 col-md-10  d-flex align-items-center font-14 fw-semibold">
            <span>${advise.getEmail()}</span>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Nội dung</label>
        <div class="col-sm-12 col-md-10">
            <textarea class="form-control" disabled cols="30" rows="10">${advise.getContent()}</textarea>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Ngày gửi</label>
        <div class="col-sm-12 col-md-10  d-flex align-items-center font-14 fw-semibold">
            <span>${advise.getCreate_at()}</span>
        </div>
    </div>
</div>












<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Thông tin tài khoản</title>

<div class="form">
    <div class="form-group row">
        <div class="avatar-upload">
            <div class="avatar-edit d-none">
                <input type='file'  id="imageUpload" name="imageFile" accept=".png, .jpg, .jpeg" />
                <label for="imageUpload"></label>
            </div>
            <div class="avatar-preview">
                <img class="profile-user-img img-responsive img-circle" id="imagePreview"
                     src="${user.getAvatarSrc()}" />
            </div>
        </div>
    </div>


    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Họ và tên</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" name="name"  disabled value="${user.getName()}" placeholder="Nhập họ tên..."/>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Email</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="email" disabled name="email" value="${user.getEmail()}" autocomplete="off"
                   placeholder="Nhập Email..."/>
        </div>
    </div>


    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Giới tính</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" disabled name="gender">
                <option value="1">Nam</option>
                <option value="2">Nữ</option>
            </select>
        </div>
    </div>




    <div class="form-group row">
        <a href="/admin/profile/edit" class="btn btn-primary">Chỉnh sửa thông tin</a>
    </div>
</div>
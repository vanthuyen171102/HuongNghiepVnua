<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Thêm tài khoản</title>

<form id="create-user-form" method="post" action="/admin/user/createNewUser" enctype='multipart/form-data'>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Họ và tên</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" name="name" placeholder="Nhập họ tên..." />
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Email</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="email" name="email" autocomplete="off" placeholder="Nhập Email..." />
        </div>
    </div>


    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Tên đăng nhập</label
        >
        <div class="col-sm-12 col-md-10">
            <input class="form-control" value="" type="text" name="username" placeholder="Nhập tên đăng nhập..." />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Mật khẩu</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" value="" autocomplete="off" type="password" name="password" placeholder="Nhập mật khẩu..." />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Phân quyền</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="permission" >
                <option value="1">Admin</option>
                <option value="2">Tình nguyện viên</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold" class="form-control btn-success" value="Thêm tài khoản" type="submit" />
    </div>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Đổi mật khẩu</title>
<form id="change-password-form" method="post" action="/admin/change-password">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Mật khẩu hiện tại</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="password"  autocomplete="off" name="old-password"
            />
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Mật khẩu mới</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="password" name="new-password" autocomplete="off"
            />
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Nhập lại mật khẩu</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="password" name="confirm-password" autocomplete="off"
            />
        </div>
    </div>


    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold" class="form-control btn-success" value="Đổi mật khẩu"
               type="submit"/>
    </div>
</form>

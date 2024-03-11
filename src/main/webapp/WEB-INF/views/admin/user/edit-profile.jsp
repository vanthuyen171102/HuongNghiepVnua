<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Chỉnh sửa thông tin tài khoản</title>

<form id="update-profile-form" method="post" action="/admin/user/updateUser/${user.getId()}" enctype='multipart/form-data'>
    <div class="form-group row">
        <div class="avatar-upload">
            <div class="avatar-edit">
                <input type='file'  id="imageUpload" name="image" accept=".png, .jpg, .jpeg" />
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
            <input class="form-control" type="text" name="name"  value="${user.getName()}" placeholder="Nhập họ tên..."/>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Email</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="email" name="email" value="${user.getEmail()}" autocomplete="off"
                   placeholder="Nhập Email..."/>
        </div>
    </div>


    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Giới tính</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="gender">
                <option value="1">Nam</option>
                <option value="2">Nữ</option>
            </select>
        </div>
    </div>


    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold" class="form-control btn-success" value="Lưu thay đổi"
               type="submit"/>
    </div>
</form>

<script>
    $(document).ready(function(){
        $("#imageUpload").change(function(data){
            var imageFile = data.target.files[0];
            var reader = new FileReader();
            reader.readAsDataURL(imageFile);
            reader.onload = function(evt){
                $('#imagePreview').attr('src', evt.target.result);
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            }
        });
    });
</script>
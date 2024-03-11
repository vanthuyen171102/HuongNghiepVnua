
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Sửa thông tin nghành học</title>

<form id="edit-form" method="post" action="/admin/field/updateField/${field.getId()}">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Tên nghành học</label>
        <div class="col-sm-12 col-md-10">
            <input type="text" class="form-control" name="name" value="${field.getName()}"
                   placeholder="Nhập tên nghành học">
        </div>
    </div>
    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold;"
               class="form-control btn-primary"
               value="Lưu thông tin nghành học"
               type="submit"
        />
    </div>
</form>

<script>
    $(document).ready(function() {
        $("#edit-form").validate({
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            rules: {
                "name": {
                    required: true,
                }
            },
            messages: {
                "name": {
                    required: "Vui lòng nhập tên nghành học",
                }
            }
        });
    })

</script>












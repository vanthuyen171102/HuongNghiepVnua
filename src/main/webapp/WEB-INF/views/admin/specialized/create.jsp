
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Thêm nghành học</title>

<form id="create-form" method="post" action="/admin/field/createField">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Tên chuyên nghành</label>
        <div class="col-sm-12 col-md-10">
            <input type="text" class="form-control" name="name"
                   placeholder="Nhập tên chuyên nghành">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Nghành học</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="field-id">
                <c:if test="${not empty fieldList}">
                    <c:forEach var="field" items="${fieldList}" varStatus="loop">
                                <option value="${field.getId()}">${field.getName()}</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Chương trình đào tạo</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="type">
                <option value="0">Tiêu chuẩn</option>
                <option value="1">Tiên tiến</option>
                <option value="2">Chất lượng cao</option>
                <option value="3">Định hương (POHE)</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Năm bắt đầu</label>
        <div class="col-sm-12 col-md-10">
            <input type="number" class="form-control" name="year-start"
                   placeholder="Năm bắt đầu">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Năm kết thúc</label>
        <div class="col-sm-12 col-md-10">
            <input type="number" class="form-control" name="year-end"
                   placeholder="Năm kết thúc">
        </div>
    </div>
    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold;"
               class="form-control btn-primary"
               value="Thêm chuyên nghành"
               type="submit"
        />
    </div>
</form>












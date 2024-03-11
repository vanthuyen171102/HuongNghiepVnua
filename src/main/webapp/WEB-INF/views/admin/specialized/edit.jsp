<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Sửa thông tin chuyên nghành</title>

<form id="edit-form" method="post" action="/admin/specialized/updateSpecialized/${specialized.getId()}">
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Tên chuyên nghành</label>
        <div class="col-sm-12 col-md-10">
            <input type="text" class="form-control" name="name" value="${specialized.getName()}"
                   placeholder="Nhập tên chuyên nghành">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Nghành học</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="field-id">
                <c:if test="${not empty fieldList}">
                    <c:forEach var="field" items="${fieldList}" varStatus="loop">
                        <c:choose>
                            <c:when test="${field.getId() == specialized.getField_id()}">
                                <option value="${field.getId()}" selected>${field.getName()}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${field.getId()}">${field.getName()}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:if>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Chương trình đào tạo</label>
        <div class="col-sm-12 col-md-10">
            <select class="form-control" name="type">
                <c:forEach var="i" begin="0" end="3">
                    <c:choose>
                        <c:when test="${i == specialized.getType()}">
                            <option value="${i}" selected>
                                <c:choose>
                                    <c:when test="${i==0}">
                                        Tiêu chuẩn
                                    </c:when>
                                    <c:when test="${i==1}">
                                        Tiên tiến
                                    </c:when>
                                    <c:when test="${i==2}">
                                        Chất lượng cao
                                    </c:when>
                                    <c:when test="${i==3}">
                                        Định hướng (POHE)
                                    </c:when>
                                </c:choose>
                            </option>
                        </c:when>
                        <c:otherwise>
                            <option value="${i}">
                                <c:choose>
                                    <c:when test="${i==0}">
                                        Tiêu chuẩn
                                    </c:when>
                                    <c:when test="${i==1}">
                                        Tiên tiến
                                    </c:when>
                                    <c:when test="${i==2}">
                                        Chất lượng cao
                                    </c:when>
                                    <c:when test="${i==3}">
                                        Định hướng (POHE)
                                    </c:when>
                                </c:choose>
                            </option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Năm bắt đầu</label>
        <div class="col-sm-12 col-md-10">
            <input type="number" class="form-control" name="year-start" value="${specialized.getYear_start()}"
                   placeholder="Năm bắt đầu">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Năm kết thúc</label>
        <div class="col-sm-12 col-md-10">
            <input type="number" class="form-control" name="year-end" value="${specialized.getYear_end()}"
                   placeholder="Năm kết thúc">
        </div>
    </div>
    <div class="form-group row">
        <input style="color: aliceblue; font-weight: bold;"
               class="form-control btn-primary"
               value="Sửa thông tin chuyên nghành"
               type="submit"
        />
    </div>
</form>












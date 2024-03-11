<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>Quản lý chuyên nghành</title>


<div class="card-box pb-10 mb-10">
    <div class="h5 pd-20 mb-0">Danh sách chuyên nghành</div>
    <table class="data-table table nowrap">
        <thead>
        <tr>
            <th>STT</th>
            <th class="table-plus">Tên chuyên nghành</th>
            <th class="table-plus">Nghành học</th>
            <th class="table-plus">Chương trình đào tạo</th>
            <th class="datatable-nosort">Hành động</th>
        </tr>

        </thead>
        <tbody>
        <c:if test="${not empty fieldList}">
            <c:set var="stt" value="0" />
            <c:forEach var="field" items="${fieldList}" varStatus="m">
                <c:set var="specializedList" value="${field.specialized}"/>
                <c:set var="fieldName" value="${field.name}"/>
                <c:if test="${not empty specializedList}">
                    <ul>
                        <c:forEach var="specialized" items="${specializedList}" varStatus="n">
                            <tr class="dropdown-specialized-toggle specialized">
                                <td>${stt + 1}</td>
                                <td class="table-plus">
                                    <div class="name-avatar d-flex align-items-center">
                                        <div class="txt">
                                            <div class="weight-600">${specialized.getName()}</div>
                                        </div>
                                    </div>
                                </td>
                                <td>${fieldName}</td>
                                <td>
                                    <c:set var="type" value="${specialized.getType()}"/>
                                    <c:choose>
                                        <c:when test="${type==0}">
                                            <span class="text-info">Tiêu chuẩn</span>
                                        </c:when>

                                        <c:when test="${type==1}">
                                            <span class="text-success">Tiên tiến</span>
                                        </c:when>

                                        <c:when test="${type==2}">
                                            <span class="text-primary">Chất lượng cao</span>
                                        </c:when>

                                        <c:when test="${type==3}">
                                            <span class="text-warning">Định hướng (POHE)</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="table-actions">
                                        <a href="/admin/specialized/edit/${ specialized.getId()}" data-color="#265ed7"
                                        ><i class="icon-copy dw dw-edit2"></i
                                        ></a>
                                        <a href="#" class="delete-btn" data-toggle="modal" data-target="#confirmDeleteModal"
                                           data-delete-url="/admin/news/delete/${specialized.getId()}">
                                            <i class="icon-copy dw dw-delete-3"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <c:set var="stt" value="${stt + 1}" />
                        </c:forEach>
                    </ul>
                </c:if>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>

<div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-14" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body font-14">
                Bạn có chắc muốn xóa chuyên nghành này?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                <a type="button" class="btn btn-danger" id="confirmDelete">Xác nhận</a>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $('.delete-btn').on('click', function (e) {
            e.preventDefault();
            let deleteUrl = $(this).data('delete-url');
            $('#confirmDelete').attr('href', deleteUrl);

            $('#confirmDeleteModal').modal('show');

            $('#confirmDeleteModal').on('hide.bs.modal', function () {
                $('#confirmDelete').attr('href', '');
            });
        });
    });
</script>
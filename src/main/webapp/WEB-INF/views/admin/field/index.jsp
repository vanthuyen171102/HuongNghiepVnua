<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>Quản lý nghành học</title>


<div class="card-box pb-10 mb-10">
    <div class="h5 pd-20 mb-0">Danh sách nghành học</div>
    <table class="data-table table nowrap">
        <thead>
        <tr>
            <th>STT</th>
            <th class="table-plus">Tên nghành học</th>
            <th class="table-plus">Số chuyên nghành</th>
            <th class="datatable-nosort">Hành động</th>
        </tr>

        </thead>
        <tbody>
        <c:if test="${not empty fieldList}">
            <ul>
                <c:forEach var="field" items="${fieldList}" varStatus="loop">
                    <tr class="dropdown-field-toggle field">
                        <td>${loop.index + 1}</td>
                        <td class="table-plus">
                            <div class="name-avatar d-flex align-items-center">
                                <div class="txt">
                                    <div class="weight-600">${field.getName()}</div>
                                </div>
                            </div>
                        </td>
                        <c:set var="specializedList" value="${field.getSpecialized()}" />
                        <td>${not empty specializedList ? fn:length(specializedList) : 0}</td>
                        <td>
                            <div class="table-actions">
                                <a href="/admin/field/edit/${ field.getId()}" data-color="#265ed7"
                                ><i class="icon-copy dw dw-edit2"></i
                                ></a>
                                <a href="#" class="delete-btn" data-toggle="modal" data-target="#confirmDeleteModal"
                                   data-delete-url="/admin/news/delete/${field.getId()}">
                                    <i class="icon-copy dw dw-delete-3"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </ul>
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
                Bạn có chắc muốn xóa nghành học này?
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



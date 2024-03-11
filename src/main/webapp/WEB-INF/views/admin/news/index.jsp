<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Quản lý tin tức</title>

<div class="card-box pb-10 mb-10">
    <div class="h5 pd-20 mb-0">Danh sách tin tức</div>
    <table class="data-table table">
        <thead>
        <tr>
            <th>STT</th>
            <th class="table-plus">Tiêu đề</th>
            <th>Ngày tạo</th>
            <th class="datatable-nosort">Hành động</th>
        </tr>

        </thead>
        <tbody>
        <c:if test="${not empty newsList}">
            <ul>
                <c:forEach var="news" items="${newsList}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td class="weight-600">${news.getTitle()}</td>
                        <td>15-11-2023</td>

                        <td>
                            <div class="table-actions">
                                <a href="/admin/news/edit/${ news.getId()}" data-color="#265ed7"
                                ><i class="icon-copy dw dw-edit2"></i
                                ></a>
                                <a href="#" class="delete-btn" data-toggle="modal" data-target="#confirmDeleteModal"
                                   data-delete-url="/admin/news/delete/${news.getId()}">
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
    <!-- Pagenation -->
    <div class="pagenation">
        <c:if test="${currentPage != 1}">
            <a href="news?page=${currentPage-1}" class="page-btn btn"> <i class="bi bi-chevron-left"></i></a>
        </c:if>
        <c:choose>
            <c:when test="${totalPages < 6}">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <a class="page-btn btn active">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a class="page-btn btn" href="/news?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:set var="pageCutLow" value="${currentPage - 1}"/>
                <c:set var="pageCutHigh" value="${currentPage + 1}"/>

                <c:if test="${currentPage > 2}">
                    <a class="page-btn btn" href="/news">1</a>
                    <c:if test="${currentPage > 3}">
                        <a class="page-btn btn">...</a>
                    </c:if>
                </c:if>

                <c:choose>
                    <c:when test="${currentPage == 1}">
                        <c:set var="pageCutHigh" value="${pageCutHigh + 2}"/>
                    </c:when>
                    <c:when test="${currentPage == 2}">
                        <c:set var="pageCutHigh" value="${pageCutHigh + 1}"/>
                    </c:when>
                    <c:when test="${currentPage == totalPages}">
                        <c:set var="pageCutLow" value="${pageCutLow - 2}"/>
                    </c:when>
                    <c:when test="${currentPage == totalPages - 1}">
                        <c:set var="pageCutLow" value="${pageCutLow - 1}"/>
                    </c:when>
                </c:choose>

                <c:forEach var="i" begin="${pageCutLow}" end="${pageCutHigh}">
                    <c:if test="${i > 0 && i <= totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <a class="page-btn btn active">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a class="page-btn btn" href="/news?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <c:if test="${currentPage < totalPages - 2}">
                        <a class="page-btn btn">...</a>
                    </c:if>
                    <a class="page-btn btn" href="/news?page=${totalPages}">${totalPages}</a>
                </c:if>
            </c:otherwise>
        </c:choose>
        <c:if test="${currentPage != totalPages}">
            <a href="" class="page-btn btn"> <i class="bi bi-chevron-right"></i></a>
        </c:if>

    </div>
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
                Bạn có chắc muốn xóa tin tức này?
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/shared/taglib.jsp"%>

<title>Danh sách yêu cầu tư vấn</title>

<div class="card-box pb-10 mb-10">
    <div class="h5 pd-20 mb-0">Yêu cầu tư vấn</div>
    <table class="data-table table nowrap">
        <thead>
        <tr>
            <th>STT</th>
            <th>Họ tên</th>
            <th>SĐT</th>
            <th>Trạng thái</th>
            <th>Ngày gửi</th>
            <th class="datatable-nosort">Hành động</th>
        </tr>

        </thead>
        <tbody>
        <c:if test="${not empty adviseList}">
            <ul>
                <c:forEach var="advise" items="${adviseList}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td class="table-plus">
                            <div class="name-avatar d-flex align-items-center">
                                <div class="txt">
                                    <div class="weight-600">${advise.getName()}</div>
                                </div>
                            </div>
                        </td>
                        <td>${advise.getPhone()}</td>
                        <td>
                            <c:choose>
                                <c:when test="${advise.getIs_readed() == 1}">
                                    <span class="badge badge-success">Đã xem</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger">Chưa xem</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>${advise.getCreate_at()}</td>
                        <td>
                            <a href="advise/${advise.getId()}">Xem thông tin</a>
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Tin tức - Sự kiện</title>

<div class="container">
    <!-- BreadCrumb -->
    <ul class="custom-breadcrumb">
        <li class="custom-breadcrumb-item"><a href="/trang-chu"> <span>Home</span>
        </a></li>
        <li class="custom-breadcrumb-item"><a href="/news"> <span>Tin
					tức - Sự kiện</span>
        </a></li>
        <li class="custom-breadcrumb-item active"><span> <span>Tin
					tức chung</span>
		</span></li>
    </ul>

    <div class="row">
        <div class="col-lg-9">
            <!-- Post Wrapper -->
            <div class="post-wrapper">

                    <div class="post-item feature-post">
                        <div class="thumb">
                            <a href="/tin-tuc/${ newsList[0].getId() }"> <img src="${newsList[0].getImageSrc()}"
                                                                           alt="${newsList[0].getTitle()}"
                                                                           class="image-zoom-hover"></a>
                        </div>
                        <div class="info">
                            <a href="" class="cat">Tin tức chung</a> <a href="/tin-tuc/${ news.getId() }"
                                                                        class="title">${newsList[0].getTitle()}</a>
                            <span class="date"><i class="bi bi-clock"></i> 11/10/2023</span>
                            <p class="desc">${newsList[0].getDescription()}</p>
                        </div>
                    </div>
                    <c:forEach items="${newsList}" var="news" begin="1">
                        <div class="post-item">
                            <div class="thumb">
                                <a href="/tin-tuc/${ news.getId() }"> <img src="${ news.getImageSrc() }"
                                                                        alt="${ news.getTitle() }" class="image-zoom-hover">
                                </a>
                            </div>
                            <div class="info">
                                <a href="/tin-tuc/${ news.getId() }" class="title"> ${ news.getTitle() } </a> <span
                                    class="date"> <i class="bi bi-clock"></i> 11/10/2023
							</span>
                                <p class="desc">${ news.getDescription() }</p>
                            </div>
                        </div>
                    </c:forEach>

            </div>

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
        <div class="col-lg-3">
            <div class="sidebar">
                <div class="sidebar__item">
                    <h3 class="heading">Tin tức - Sự kiện</h3>
                    <ul class="nav-list">
                        <li class="nav-item"><a href="" class="nav-link">Tin tức
                            chung</a></li>

                        <li class="nav-item"><a href="" class="nav-link">Đào tạo</a></li>

                        <li class="nav-item"><a href="" class="nav-link">Công
                            đoàn</a></li>


                        <li class="nav-item"><a href="" class="nav-link">Khởi
                            nghiệp</a></li>
                    </ul>
                </div>


            </div>
        </div>
    </div>
</div>

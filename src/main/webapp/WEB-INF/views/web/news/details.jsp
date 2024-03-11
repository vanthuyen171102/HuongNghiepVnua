<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>${news.getTitle()}</title>


<div class="post-title-wrapper"
            style="background-image: url('${news.getImageSrc()}');">
            <div class="overlay"></div>
            <div class="bottom-overlay"></div>
            <div class="container">
                <div class="post-title-content">
<%--                    <div class="post-date">--%>
<%--                        <div class="post-day">9</div>--%>
<%--                        <div class="post-month">Th. 10</div>--%>
<%--                    </div>--%>
                    <div class="post-title">
                        ${news.getTitle()}
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <!-- BreadCrumb -->
            <ul class="custom-breadcrumb">
                <li class="custom-breadcrumb-item">
                    <a href="">
                        <span>Home</span>
                    </a>
                </li>
                <li class="custom-breadcrumb-item">
                    <a href="">
                        <span>Tin tức - Sự kiện</span>
                    </a>
                </li>
                <li class="custom-breadcrumb-item active">
                    <span>
                        <span>Tin tức chung</span>
                    </span>
                </li>
            </ul>
            <div class="post-content-wrapper">
                <div class="post-view">
                    <p class="desc">
                        ${news.getDescription()}
                    </p>
                    <div class="content">
                    ${news.getContent()}
                    </div>
                </div>
                <div class="reply-form" id="reply-form">
                    <h3 class="form-heading">
                        Gửi phản hồi
                    </h3>
                    <div class="row">
                        <div class="col-md-6 form-group mb-md-5 mb-3">
                            <input type="text" placeholder="Họ tên*" class="form-control">
                        </div>
                        <div class="col-md-6 form-group mb-md-5 mb-3">
                            <input type="text" placeholder="Email*" class="form-control">
                        </div>
                        <div class="col-12 form-group mb-md-5 mb-3">
                            <textarea name="" class="form-control" rows="10" placeholder="Phản hồi*"></textarea>
                        </div>
                        <div class="col-12 form-group">
                            <button class="submit-btn btn">
                                Gửi ý kiến
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>



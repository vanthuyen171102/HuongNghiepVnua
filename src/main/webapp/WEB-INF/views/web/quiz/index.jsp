<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Trắc nghiệm hướng nghiệp</title>

<div class="quiz-template">
    <section>
        <div class="container">
            <div class="quiz-box">
                <div class="row gx-5 align-items-center">
                    <div class="col-12 col-md-4">
                        <img src="<c:url value="/assets/web/images/hero-disc.png" />" alt="" class="full-size-img" />
                    </div>
                    <div class="col-12 col-md-8">
                            <h2 class="quiz-box__title">Bài trắc nghiệm DISC</h2>
                            <p class="quiz-box_sub-title">
                                Bạn chưa biết tính cách của mình phù hợp với nghành học nào?
                            </p>
                        <p class="quiz-content__text">
                            Xác định ngay với DISC Test - Bài test hàng đầu về thấu hiểu
                            nhân tâm để tìm ra nghành học phù hợp với bạn
                        </p>
                        <a href="/trac-nghiem-huong-nghiep/disc" class="btn quiz-start-btn">Bắt đầu làm bài</a>
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>
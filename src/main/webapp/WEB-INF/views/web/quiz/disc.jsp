    <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Trắc nghiệm DISC</title>
<div
        class="modal"
        id="quiz-result-modal"
        tabindex="-1"
        aria-labelledby="modalLabel"
        aria-modal="true"
        role="dialog"
>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5" id="modalLabel">THÔNG TIN KẾT QUẢ</h2>
                <button
                        type="button"
                        class="btn-close"
                        id="result-modal-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body" id="result-content">

            </div>
        </div>
    </div>
</div>

<div class="quiz-banner">
    <div class="container">
        <div class="quiz-banner__wrapper">
            <div class="quiz-banner__content">
                <h2 class="quiz-banner__title">
                    DISC: Trắc nghiệm tính cách giúp bạn lựa chọn nghề nghiệp / nghành
                    học
                </h2>
                <h3 class="quiz-banner__desc">
                    Trắc nghiệm tính cách MBTI test (myers-briggs) là chuỗi 40 câu hỏi
                    trắc nghiệm tâm lý giúp xác định sở thích, nghề nghiệp chính xác
                    nhất.
                </h3>
            </div>
            <div class="quiz-banner__thumb">
                <img src="<c:url value="/assets/web/images/hero-disc.png" />" alt=""/>
            </div>
        </div>
    </div>
    <svg
            style="pointer-events: none"
            class="wave"
            width="100%"
            height="50px"
            preserveAspectRatio="none"
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            viewBox="0 0 1920 75"
    >
        <defs>
            <style>
                .a {
                    fill: none;
                }

                .b {
                    clip-path: url(#a);
                }

                .c,
                .d {
                    fill: #fcfcfc;
                }

                .d {
                    opacity: 0.5;
                    isolation: isolate;
                }
            </style>
            <clipPath id="a">
                <rect class="a" width="1920" height="75"></rect>
            </clipPath>
        </defs>
        <title>wave</title>
        <g class="b">
            <path
                    class="c"
                    d="M1963,327H-105V65A2647.49,2647.49,0,0,1,431,19c217.7,3.5,239.6,30.8,470,36,297.3,6.7,367.5-36.2,642-28a2511.41,2511.41,0,0,1,420,48"
            ></path>
        </g>
        <g class="b">
            <path
                    class="d"
                    d="M-127,404H1963V44c-140.1-28-343.3-46.7-566,22-75.5,23.3-118.5,45.9-162,64-48.6,20.2-404.7,128-784,0C355.2,97.7,341.6,78.3,235,50,86.6,10.6-41.8,6.9-127,10"
            ></path>
        </g>
        <g class="b">
            <path
                    class="d"
                    d="M1979,462-155,446V106C251.8,20.2,576.6,15.9,805,30c167.4,10.3,322.3,32.9,680,56,207,13.4,378,20.3,494,24"
            ></path>
        </g>
        <g class="b">
            <path
                    class="d"
                    d="M1998,484H-243V100c445.8,26.8,794.2-4.1,1035-39,141-20.4,231.1-40.1,378-45,349.6-11.6,636.7,73.8,828,150"
            ></path>
        </g>
    </svg>
</div>
<div class="quiz-box">
    <div class="container my-3">
        <div class="row">
            <div class="col-md-4 order-md-2">
                <div class="position-sticky end-0 top-0 pt-sm-5 py-3 mb-4">
                    <div class="ms-sm-4 rounded-4 p-4 shadow quiz-guide">
                        <h6 class="fw-bolder mb-0 text-uppercase mt-3">Cách thực hiện</h6>
                        <ul class="p-3">
                            <li class="mb-2">Hãy chọn câu trả lời mà bạn cho là phù hợp hơn với bản thân mình</li>
                            <li class="my-2">Chỉ đọc câu trả lời và chọn, bạn không nên cố gắng phân tích quá nhiều các
                                lựa chọn này vì làm như vậy sẽ khiến kết quả của bạn kém chính xác
                            </li>
                            <li class="mt-2">Đây là bài trắc nghiệm tính cách nên sẽ không có câu trả lời đúng hay sai
                            </li>
                        </ul>
                        <img class="w-100 m-auto d-block lazy"
                             src="<c:url value="/assets/web/images/career-orientation.svg"/>"
                             data-src="/img/career-orientation.svg" alt="JobsGO MBTI">

                    </div>
                </div>
            </div>
            <div class="col-md-8 order-md-1">
                <div class="quiz-box__inner">
                    <form id="quiz-form" class="form w-100">
                        <c:if test="${not empty questionList}">
                            <c:forEach var="question" items="${questionList}" varStatus="loop">
                                <c:set var="answerList" value="${question.getAnswer()}"/>
                                <div class="question">
                            <span class="question-content">
        ${loop.index+1}. ${question.getContent()}
        </span>
                                    <div class="answer-list">
                                        <c:forEach var="answer" items="${answerList}" varStatus="loop">
                                            <label class="answer" data-id="${answer.getId()}">
                                                <span class="circle"></span>
                                                <span
                                                >${answer.getContent()}</span
                                                >
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>

                            </c:forEach>
                        </c:if>

                        <button type="submit" class="quiz-submit-btn">
                            Xem kết quả
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
></script>
<script>
    $("#quiz-form").submit(function (event) {
        event.preventDefault();
        let uncheckedQuestionCount = 0;
        $(".question").each(function () {
            let isSelected = $(this).find(".answer.selected").length > 0;
            if (!isSelected) {
                uncheckedQuestionCount++;
                if (!$(this).find(".error-message").length) {
                    $(this).append(
                        '<span class="error-message text-danger">Vui lòng chọn câu trả lời</span>'
                    );
                }
            } else {
                $(this).find(".error-message").remove();
            }
        });

        if (uncheckedQuestionCount > 0) {
            let firstUncheckedQuestion = $(".question:not([data-answer])").first()[0];
            if (firstUncheckedQuestion) {
                firstUncheckedQuestion.scrollIntoView({
                    behavior: "smooth",
                    block: "start",
                });
            }
        } else {
            let answers = [];

            $(".question").each(function () {
                let dataAnswer = $(this).attr("data-answer");
                if (dataAnswer) {
                    answers.push(dataAnswer);
                }
            });

            let requestData = {
                answer: answers
            };

            // Gửi yêu cầu AJAX
            $.ajax({
                url: "/quiz/getDiscResult",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                data: JSON.stringify(requestData),
                success: function (result) {
                    console.log(result);
                    $('#result-content').html(result);
                    $('#quiz-result-modal').show();
                },
                error: function (error) {
                    toast({
                        title: "Lỗi",
                        type: "error",
                        message: "Không thể nhận kết quả kiểm tra",
                        duration: 3000
                    })                }
            });
        }
    });

    $(".answer").on("click", function () {
        let $this = $(this);
        let $question = $this.closest(".question");
        $question.find(".answer").removeClass("selected");
        $this.addClass("selected");
        let answerId = $this.data("id");
        $question.attr("data-answer", answerId);
        $question.find(".error-message").remove();
    });
    $("#result-modal-close").on("click", function () {
        let modal = $("#quiz-result-modal");
        modal.hide();
    });
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>
    Trang chủ
</title>

<!-- Slide slick -->
<link rel="stylesheet"
      href="<c:url value='/assets/web/vendors/slick-carousel/slick.css' />"/>
<script
        src="<c:url value='/assets/web/vendors/slick-carousel/slick.min.js' />"></script>

<!-- Select 2 -->
<link rel="stylesheet"
      href="<c:url value='/assets/web/vendors/select2/select2.css' />"/>
<!-- Date Picker -->
<link rel="stylesheet"
      href="<c:url value='/assets/web/vendors/bootstrap-datepicker/dist/css/bootstrap-datepicker.standalone.min.css' />"/>

<link rel="stylesheet"
      href="<c:url value='/assets/web/css/slider.css' />"/>
<link rel="stylesheet"
      href="<c:url value='/assets/web/css/datepicker.css' />"/>
<link rel="stylesheet"
      href="<c:url value='/assets/web/css/select2.css' />"/>
<link rel="stylesheet" href="<c:url value='/assets/web/css/form.css' />"/>


<div id="home-banner">

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
                    <a href="/trac-nghiem-huong-nghiep/disc" class="btn quiz-start-btn mt-3">Bắt đầu làm bài</a>
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

</div>

<section id="home-posts">
    <div class="container">
        <h2 class="section-heading">Tin tức - Sự kiện</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="post-item feature-post">
                    <div class="thumb">
                        <a href=""> <img src="<c:url value='/assets/web/images/feature-post.jpg' />" alt=""
                                         class="image-zoom-hover"/>
                        </a>
                    </div>
                    <div class="info">
                        <a href="" class="cat"> Tin tức chung </a> <a href=""
                                                                      class="title"> THÔNG BÁO TUYỂN SINH ĐẠI HỌC HỆ
                        CHÍNH QUY NĂM 2023</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="row gy-4">
                    <c:forEach var="news" items="${newsList}" varStatus="loop">
                        <c:if test="${loop.count <= 4}">
                            <div class="col-12 col-md-6">
                                <div class="post-item feature-post">
                                    <div class="thumb">
                                        <a href="/tin-tuc/${ news.getId() }"> <img src="${ news.getImageSrc() }"
                                                                                   alt="${ news.getTitle() }"
                                                                                   class="image-zoom-hover">
                                        </a>
                                    </div>
                                    <div class="info">
                                        <a href="" class="cat"> Tin tức chung </a>
                                        <a href="/tin-tuc/${ news.getId() }" class="title"> ${ news.getTitle() } </a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</section>

<section id="home-field">
    <div class="container">
        <h2 class="section-heading">Các nghành đào tạo</h2>
        <p class="section-desc">Chương trình đào tạo của trường được thiết
            kế dựa trên sự tham vấn của chuyên gia, chú trọng thực hành, phù hợp
            với nhu cầu mà nhà tuyển dụng tìm kiếm ở nguồn nhân lực thế hệ mới.</p>
        <div class="field-list">
            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/English.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Ngôn ngữ anh</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/it.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Công nghệ thông tin</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/biotechnology.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Công nghệ sinh học</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/veterinary medicine.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Thú y</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/accountant.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Kế toán</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/English.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Ngôn ngữ anh</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/it.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Công nghệ thông tin</h3>
                    </div>
                </a>
            </div>

            <div class="field-item">
                <a href="">
                    <div class="thumb">
                        <img src="<c:url value='/assets/web/images/biotechnology.jpg'/>" alt=""/>
                    </div>
                    <div class="content">
                        <h3 class="title">Công nghệ sinh học</h3>
                    </div>
                </a>
            </div>
        </div>

        <button class="view-more-btn btn">Xem thêm nghành học</button>
    </div>
</section>

<section id="achievements-section">
    <div class="container">
        <h2 class="achievements-heading">VÌ SAO CHỌN HỌC VIỆN NÔNG NGHIỆP
            VIỆT NAM?</h2>
        <div class="achievements-grid">
            <div class="achievements-item">
                <div class="achievements-img">
                    <i class="fa-solid fa-clock-rotate-left achievements-icon"></i>
                </div>
                <div class="achievements-content">
                    <h3>67</h3>
                    <p>Năm thành lập</p>
                </div>
            </div>
            <div class="achievements-item">
                <div class="achievements-img">
                    <i class="fa-solid fa-award achievements-icon"></i>
                </div>
                <div class="achievements-content">
                    <h3>TOP 3</h3>
                    <p>Trường đại học tại Việt Nam</p>
                </div>
            </div>
            <div class="achievements-item">
                <div class="achievements-img">
                    <i class="fa-solid fa-globe achievements-icon"></i>
                </div>
                <div class="achievements-content">
                    <h3>90%</h3>
                    <p>GIẢNG VIÊN ĐÀO TẠO Ở NƯỚC NGOÀI</p>
                </div>
            </div>
            <div class="achievements-item">
                <div class="achievements-img">
                    <i class="fa-solid fa-money-bill-wave achievements-icon"></i>
                </div>
                <div class="achievements-content">
                    <h3>≈40 Tỷ</h3>
                    <p>HỌC BỔNG / 1 NĂM</p>
                </div>
            </div>
            <div class="achievements-item">
                <div class="achievements-img">
                    <i class="fa-solid fa-bag-shopping achievements-icon"></i>
                </div>
                <div class="achievements-content">
                    <h3>>97%</h3>
                    <p>SINH VIÊN CÓ VIỆC LÀM</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="home-advise">
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-lg-6">
                <div class="advise-card">
                    <h3 class="heading">Đăng ký tư vấn</h3>
                    <p class="remind">Bạn vui lòng điền đầy đủ thông tin cá nhân vào
                        bảng đăng ký xét tuyển trực tuyến bên dưới. Chúng tôi sẽ chủ động
                        liên hệ lại với bạn trong vòng 24h kể từ khi nhận được thông tin
                        đăng ký</p>

                    <form class="form" id="register-advise-form" method="post" action="/send-advise-form">
                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label class="form-label" for="">Họ tên</label> <input
                                    type="text" name="name" placeholder="Vũ Văn A" class="form-control"/>
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label class="form-label" for="">Số điện thoại</label> <input
                                    type="text" placeholder="0987272722" class="form-control" name="phone"/>

                            </div>

                            <div class="col-md-12 form-group mb-3">
                                <label class="form-label" for="">Email</label> <input type="text"
                                                                                      placeholder="vuvana@gmail.com"
                                                                                      class="form-control"
                                                                                      name="email"/>
                            </div>

                            <div class="col-12 form-group mb-3">
                                <label class="form-label" for="">Nội dung tư vấn</label> <textarea name="content"
                                                                                                   placeholder="Bạn muốn chúng tôi tư vấn về vấn đề gì?"
                                                                                                   rows="5"
                                                                                                   class="form-control"></textarea>
                            </div>

                            <div class="col-12 form-group">
                                <button class="register-btn btn" type="submit">Đăng ký ngay</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>


<script src="<c:url value='/assets/web/js/main.js'/>"></script>
<script src="<c:url value='/assets/web/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js' />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js"
        integrity="sha512-WMEKGZ7L5LWgaPeJtw9MBM4i5w5OSBlSjTjCtSnvFJGSVD26gE5+Td12qN5pvWXhuWaWcVwF++F7aqu9cvqP0A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(document).ready(function () {
        $.validator.addMethod("phoneVN", function(phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.match(/^(0|\+84)\d{9}$/);
        }, "Vui lòng nhập số điện thoại hợp lệ.");

        $.validator.addMethod("emailFormat", function(value, element) {
            // Sử dụng regex để kiểm tra định dạng email
            return this.optional(element) || /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
        }, "Vui lòng nhập địa chỉ email hợp lệ.");

        $("#register-advise-form").validate({
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            rules: {
                "name": {
                    required: true,
                },
                "phone": {
                    required: true,
                    phoneVN: true
                },
                "email": {
                    required: true,
                    emailFormat: true
                },
                "content": {
                    required: true
                }
            },
            messages: {
                "name": {
                    required: "Vui lòng nhập họ tên",
                },
                "phone": {
                    required: "Vui lòng nhập số điện thoại",
                },
                "email": {
                    required: "Vui lòng địa chỉ Email",
                },
                "content": {
                    required: "Vui lòng nhập nội dung tư vấn",
                }
            }
        });


        $("#register-advise-form").submit(function (e) {
            e.preventDefault();

            if ($(this).valid()) {
                const formData = new FormData(this);
                $.ajax({
                    type: 'POST',
                    url: '/send-advise-form',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        toast({
                            title: "Thành công",
                            message: "Yêu cầu tư vấn đã được tiếp nhận",
                            type: "success",
                            duration: 3000
                        });
                    },
                    error: function (xhr, status, error) {
                        toast({
                            title: "Không thành công",
                            message: "Yêu cầu tư vấn không thành công",
                            type: "error",
                            duration: 3000
                        });
                    }
                });
            }
        })
    });
</script>







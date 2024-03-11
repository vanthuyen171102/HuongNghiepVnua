<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>
    Yêu cầu tư vấn
</title>
<section id="home-advise">

<div class="container site-content">
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

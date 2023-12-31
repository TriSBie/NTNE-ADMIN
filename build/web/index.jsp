<%-- 
    Document   : index.jsp
    Created on : Jun 11, 2023, 8:21:52 PM
    Author     : buidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Đăng nhập</title>
        <link rel="shortcut icon" type="image/png" href="" />
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.min.css"/>" />
    </head>

    <body>
        <!--  Body Wrapper -->
        <div
            class="page-wrapper"
            id="main-wrapper"
            data-layout="vertical"
            data-navbarbg="skin6"
            data-sidebartype="full"
            data-sidebar-position="fixed"
            data-header-position="fixed"
            >
            <div
                class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center"
                >
                <div class="d-flex align-items-center justify-content-center w-100">
                    <div class="row justify-content-center w-100">
                        <div class="col-md-8 col-lg-6 col-xxl-3">
                            <div class="card mb-0">
                                <div class="card-body">
                                    <a
                                        href="#"
                                        class="text-nowrap logo-img text-center d-block py-3 w-100"
                                        >
                                        <img
                                            src="https://firebasestorage.googleapis.com/v0/b/nha-trang-nature-elite.appspot.com/o/Images%20For%20Logo%20-%20Sliders%20-%20Other%2FTrang%20ch%E1%BB%A7%2Flogo.png?alt=media&token=2b706eb6-a8dd-488b-a807-bd03f3c56ad4&_gl=1*5t54yn*_ga*MTU1OTk0NzM3OC4xNjgzNTA1MDE2*_ga_CW55HF8NVT*MTY4NjEyNzYzMS40Mi4xLjE2ODYxMjc2MzUuMC4wLjA."
                                            width="180"
                                            alt=""
                                            />
                                    </a>
                                    <p class="text-center">Đăng nhập với vai trò là ADMIN</p>
                                    <form action="<c:url value="/account/hanleLogin.do"/>" method="post">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label"
                                                   >Tên tài khoản</label
                                            >
                                            <input
                                                type="email"
                                                name="email"
                                                class="form-control"
                                                id="exampleInputEmail1"
                                                aria-describedby="emailHelp"
                                                />
                                        </div>
                                        <div class="mb-4">
                                            <label for="exampleInputPassword1" class="form-label"
                                                   >Mật khẩu</label
                                            >
                                            <input
                                                type="password"
                                                name="password"
                                                class="form-control"
                                                id="exampleInputPassword1"
                                                />
                                        </div>
                                        <div
                                            class="d-flex align-items-center justify-content-between mb-4"
                                            >
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input primary"
                                                    type="checkbox"
                                                    value=""
                                                    id="flexCheckChecked"
                                                    checked
                                                    required
                                                    />
                                                <label
                                                    class="form-check-label text-dark"
                                                    for="flexCheckChecked"
                                                    >
                                                    Ghi nhớ
                                                </label>
                                            </div>
                                        </div>

                                        <!-- Thông báo nếu sai mật khẩu hoặc email -->
                                        <c:if test="${msg != null}">
                                            <div class="alert alert-danger">
                                                <strong>Bạn đăng nhập sai mật khẩu hoặc Email.</strong> Trong trường hợp nếu bạn quên mật khẩu vui lòng liên hệ bộ phận trên để cấp lại.
                                            </div>
                                        </c:if>
                                        <button type="submit"
                                                class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2"
                                                >Đăng nhập</a
                                            >
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>



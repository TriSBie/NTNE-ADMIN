<%-- 
    Document   : ui-editTour
    Created on : Jun 18, 2023, 3:51:22 PM
    Author     : buidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Chỉnh sửa TOUR</title>
        <link rel="shortcut icon" type="image/png" href="" />
        <link rel="stylesheet" href="../assets/css/styles.min.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
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
            <!-- Sidebar Start -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div>
                    <div
                        class="brand-logo d-flex align-items-center justify-content-between"
                        >
                        <a href="./icon-tabler.html" class="text-nowrap logo-img">
                            <img
                                src="https://firebasestorage.googleapis.com/v0/b/nha-trang-nature-elite.appspot.com/o/Images%20For%20Logo%20-%20Sliders%20-%20Other%2FTrang%20ch%E1%BB%A7%2Flogo.png?alt=media&token=2b706eb6-a8dd-488b-a807-bd03f3c56ad4&_gl=1*5k32sh*_ga*MTU1OTk0NzM3OC4xNjgzNTA1MDE2*_ga_CW55HF8NVT*MTY4NjEyMDM5NS40MS4xLjE2ODYxMjA4NzAuMC4wLjA."
                                width="180"
                                alt=""
                                />
                        </a>
                        <div
                            class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
                            id="sidebarCollapse"
                            >
                            <i class="ti ti-x fs-8"></i>
                        </div>
                    </div>
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                        <ul id="sidebarnav">
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Trang chủ</span>
                            </li>
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./index.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="ti ti-layout-dashboard"></i>
                                    </span>
                                    <span class="hide-menu">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Danh mục</span>
                            </li>

                            <!-- Begin tour manage -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./ui-listTour.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-suitcase"></i>
                                    </span>
                                    <span class="hide-menu">Danh sách TOUR</span>
                                </a>
                            </li>
                            <!-- End tour manage -->

                            <!-- Begin Tour Item management -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./ui-listTourItems.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-suitcase"></i>
                                    </span>
                                    <span class="hide-menu">Danh sách Lịch trình</span>
                                </a>
                            </li>
                            <!-- End Tour Item management -->

                            <!--LIST TRIP-->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./ui-listTrip.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-suitcase-rolling"></i>
                                    </span>
                                    <span class="hide-menu">Danh sách TRIP</span>
                                </a>
                            </li>
                            <!--LIST TRIP-->

                            <!-- manage Destination -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./ui-destination.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>
                                    <span class="hide-menu">Quản lí Destination</span>
                                </a>
                            </li>
                            <!-- End destination management -->

                            <!-- Booking management-->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./ui-manageBooking.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>
                                    <span class="hide-menu">Quản lí Booking</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <!--  Header Start -->
                <header class="app-header">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div
                            class="navbar-collapse justify-content-end px-0"
                            id="navbarNav"
                            >
                            <ul
                                class="navbar-nav flex-row ms-auto align-items-center justify-content-end"
                                >
                                <li class="nav-item dropdown">
                                    <a
                                        class="nav-link nav-icon-hover"
                                        href="javascript:void(0)"
                                        id="drop2"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        >
                                        <img
                                            src="../assets/images/profile/user-1.jpg"
                                            alt=""
                                            width="35"
                                            height="35"
                                            class="rounded-circle"
                                            />
                                    </a>
                                    <div
                                        class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                                        aria-labelledby="drop2"
                                        >
                                        <div class="message-body">
                                            <a
                                                href="javascript:void(0)"
                                                class="d-flex align-items-center gap-2 dropdown-item"
                                                >
                                                <i class="ti ti-mail fs-6"></i>
                                                <p class="mb-0 fs-3">Quản lí tài khoản</p>
                                            </a>
                                            <a
                                                href="./authentication-login.html"
                                                class="btn btn-outline-primary mx-3 mt-2 d-block"
                                                >Đăng xuất</a
                                            >
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
                <!--  Header End -->
                <div class="container-fluid">
                    <div class="container-fluid">
                        <h2 class="card-title fw-semibold mb-4">Chỉnh sửa TOUR</h2>
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${not empty requestScope.TOUR_DETAIL}">
                                    <c:set var="tourItem" value="${requestScope.TOUR_DETAIL}"/>
                                    <form action="<c:url value="/tour/editTourHandler.do"/>">
                                        <!-- Tên TOUR -->
                                        <div class="mb-3">
                                            <input type="hidden" name="tourID" value="${tourItem.tourID}"/>
                                            <h4>ID : ${tourItem.tourID}</h4>
                                            <div class="tour-header">
                                                <h3 class="text-body">${tourItem.tourName}</h3>
                                            </div>
                                            <div>
                                                <img
                                                    src="${tourItem.thumbnail}"
                                                    alt="${tourItem.tourName}"
                                                    class="img-thumbnail"
                                                    width="200"
                                                    />
                                            </div>
                                        </div>

                                        <!-- EDIT TOUR -->
                                        <div class="formTour">
                                            <div class="formTour-package">
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Tên TOUR</label
                                                        >
                                                        <input
                                                            type="text"
                                                            name="tourName"
                                                            value="${tourItem.tourName}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            />
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Điểm đến</label
                                                        >
                                                        <input
                                                            type="text"
                                                            name="tourLocation"
                                                            value="${tourItem.location}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá người lớn (VND)</label
                                                        >
                                                        <input
                                                            type="number"
                                                            name="tourPriceAdult"
                                                            value="${tourItem.priceAdult}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            />
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá trẻ em (VND)</label
                                                        >
                                                        <input
                                                            type="number"
                                                            name="tourPriceChild"
                                                            value="${tourItem.priceChild}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            />
                                                    </div>
                                                    <div class="col-12">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Chỉnh sửa link hình ảnh</label
                                                        >
                                                        <input
                                                            type="number"
                                                            name="tourThumbnail"
                                                            value="${tourItem.thumbnail}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END EDIT TOUR -->

                                        <!-- Hình Ảnh TOUR -->
                                        <!-- Check Box -->
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" required />
                                            <label class="form-check-label"
                                                   >Xác thực thay đổi thông tin TOUR</label
                                            >
                                        </div>
                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <!-- <script src="../assets/js/editor.js"></script> -->
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
        <!-- CKEditor -->
        <script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
        <script>
            CKEDITOR.replace("editor1");
        </script>
        <!-- CKEditor -->
    </body>
</html>


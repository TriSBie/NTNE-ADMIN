<%-- 
    Document   : ui-manageBooking
    Created on : Jun 17, 2023, 2:21:33 PM
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
        <title>Quản lí Booking</title>
        <link
            rel="shortcut icon"
            type="image/png"
            href=""
            />
        <link rel="stylesheet" href="../assets/css/styles.min.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
        <!--Style CSS-->
        <style>
            /* The switch - the box around the slider */
            .switch {
                font-size: 12px;
                position: relative;
                display: inline-block;
                width: 3.5em;
                height: 2em;
            }

            /* Hide default HTML checkbox */
            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            /* The slider */
            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #B0B0B0;
                border: 1px solid #B0B0B0;
                -webkit-transition: .4s;
                transition: .4s;
                border-radius: 32px;
                outline: none;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 1.5rem;
                width: 1.5rem;
                border-radius: 50%;
                outline: 2px solid #B0B0B0;
                left: -1px;
                bottom: -1px;
                background-color: #fff;
                -webkit-transition: -webkit-transform .25s ease-in-out 0s;
                transition: -webkit-transform .25s ease-in-out 0s;
                transition: transform .25s ease-in-out 0s;
                transition: transform .25s ease-in-out 0s, -webkit-transform .25s ease-in-out 0s;
            }

            input:checked + .slider {
                background-color: #222222;
            }

            input:checked + .slider .slider-icon {
                opacity: 1;
                right: 20%;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(1.5em);
                -ms-transform: translateX(1.5em);
                transform: translateX(1.5em);
                outline-color: #181818;
            }
        </style>
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
                        <a href="<c:url value="/tour/dashborad.do"/>"class="text-nowrap logo-img">
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
                                <span class="hide-menu">${admin.name}</span>
                            </li>
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Trang chủ</span>
                            </li>
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/tour/dashborad.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="ti ti-layout-dashboard"></i>
                                    </span>
                                    <span class="hide-menu">Báo cáo</span>
                                </a>
                            </li>

                            <!-- Start service management- -->
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Quản lí dịch vụ</span>
                            </li>

                            <!-- Booking management-->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/booking/viewBooking.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>

                                    <span class="hide-menu">Booking</span>
                                </a>
                            </li>
                            <!-- End Booking management- -->

                            <!--LIST TRIP-->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/tour/listTrip.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>
                                    <span class="hide-menu">Chuyến đi trong ngày</span>
                                </a>
                            </li>
                            <!--LIST TRIP-->

                            <!-- End service management- -->
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">DANH SÁCH</span>
                            </li>

                            <!-- Begin tour manage -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/tour/listTour.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-suitcase"></i>
                                    </span>
                                    <span class="hide-menu">Tour du lịch</span>
                                </a>
                            </li>
                            <!-- End tour manage -->

                            <!-- Manage Destination -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/tour/listDestination.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>
                                    <span class="hide-menu">Địa điểm</span>
                                </a>
                            </li>
                            <!-- End destination management -->

                            <!-- Manage Account -->
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">QUẢN LÍ TÀI KHOẢN</span>
                            </li>
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/account/accountList.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-list"></i>
                                    </span>
                                    <span class="hide-menu">Người dùng</span>
                                </a>
                            </li>                           
                            <!-- Manage Account -->
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
                        <ul class="navbar-nav">
                            <li class="nav-item d-block d-xl-none">
                                <a
                                    class="nav-link sidebartoggler nav-icon-hover"
                                    id="headerCollapse"
                                    href="javascript:void(0)"
                                    >
                                    <i class="ti ti-menu-2"></i>
                                </a>
                            </li>
                        </ul>
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
                                            src="${admin.linkImg}"
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
                                                <p class="mb-0 fs-3">Tài khoản</p>
                                            </a>
                                            <a
                                                href="<c:url value="/account/hanleLogout.do"/>"
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
                <!--GET BOOKING DETAIL BY ID-->
                <c:if test="${not empty requestScope.BOOKING_DETAILS}">
                    <c:set var="tripDTO" value="${requestScope.BOOKING_DETAILS.tripDTO}"/>
                    <c:set var="paymentDTO" value="${requestScope.BOOKING_DETAILS.paymentDTO}"/>
                    <c:set var="bookingDTO" value="${requestScope.BOOKING_DETAILS}"/>
                    <div class="container-fluid" style="background-color: #E6E9EB;">
                        <!-- Danh Sách BOOKING -->
                        <div class="row">
                            <h5 class="fw-semibold mb-1">
                                Mã TRIP: ${tripDTO.code} - [<fmt:formatDate pattern="dd/MM" value="${tripDTO.depart_time}"/>]
                            </h5>
                            <br>
                            <br>
                            <div class="mb-3 row">
                                <div class="col-6">
                                    <c:if test="${bookingDTO.status == true}">
                                        <span class="badge bg-success rounded-3 fw-semibold">Đã thanh toán</span>
                                    </c:if>
                                    <c:if test="${bookingDTO.status != true}">
                                        <span class="badge bg-danger rounded-3 fw-semibold">Chưa thanh toán</span>
                                    </c:if>
                                </div>
                            </div>
                            <a href="<c:url value="/booking/viewBooking.do"/>">
                                <i class="fa-solid fa-caret-left"></i> &nbsp; Quay lại
                            </a>
                            <div class="col-lg-8 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <!--GET BOOKING DETAIL BY ID-->
                                    <div class="card-body">
                                        <!--Thông tin khách hàng-->
                                        <!-- row 1 -->
                                        <div class="mb-3 row">
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Tên khách hàng
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    ${BOOKING_DETAILS.cusBook}
                                                </h6>
                                            </div>
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Email
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    ${bookingDTO.cusMail}
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 1 -->

                                        <!-- row 2 -->
                                        <div class="mb-3 row">
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Số điên thoại
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    ${bookingDTO.cusPhone}
                                                </h6>
                                            </div>
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Địa chỉ
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    ${bookingDTO.cusAddress}
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 2 -->

                                        <!-- row 3 -->
                                        <div class="mb-3 row">
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Ngày Booking
                                                </label>
                                                <h6 class="mb-0 fw-normal">
                                                    ${bookingDTO.expireDate}
                                                </h6>
                                            </div>
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Ngày khởi hành
                                                </label>
                                                <h6 class="mb-0 fw-normal">
                                                    <fmt:formatDate value="${tripDTO.depart_time}" pattern="dd-MM-yyyy" />
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 3 -->

                                        <!-- row 4 -->
                                        <div class="mb-3 row">
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >SL người lớn x Giá
                                                </label>
                                                <h6 class="mb-0 fw-normal">
                                                    ${bookingDTO.quantityAdult} * <fmt:formatNumber value ="${tripDTO.priceAdult}" type = "currency"/>
                                                </h6>
                                            </div>
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >SL trẻ em x Giá
                                                </label>
                                                <h6 class="mb-0 fw-normal">
                                                    ${bookingDTO.quantityChild} *  <fmt:formatNumber value ="${tripDTO.priceChild}" type = "currency"/>
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 4 -->

                                        <!-- row 5 -->
                                        <div class="mb-3 row">
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Tổng Booking
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    <fmt:formatNumber value ="${bookingDTO.totalPrice}" type = "currency"/>
                                                </h6>
                                            </div>
                                            <div class="col-6">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Hình thức thanh toán
                                                </label>
                                                <h6 class="fw-semibold mb-1">
                                                    ${paymentDTO.paymentName}
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 5 -->
                                        <div class="mb-3 row">
                                            <div class="col-12">
                                                <label
                                                    for="exampleInputEmail1"
                                                    class="form-check-inline"
                                                    >Yêu cầu(nếu có)
                                                </label>
                                                <h6 class="mb-1" style="border: 1px solid; height: 100px; padding: 10px; border-radius: 5px">
                                                    ${bookingDTO.requirement}
                                                </h6>
                                            </div>
                                        </div>
                                        <!-- row 5 -->
                                        <c:if test="${bookingDTO.reason != null}">
                                            <div class="mb-3 row">
                                                <div class="col-12">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-inline"
                                                        >Lý do chuyển trạng thái
                                                    </label>
                                                    <h6 class="mb-1">
                                                        ${bookingDTO.reason}
                                                    </h6>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <!-- TOUR INFO -->
                            <c:if test="${not empty requestScope.TOUR}">
                                <div class="col-lg-4 d-flex align-items-stretch">
                                    <!--GET BOOKING DETAIL BY ID-->
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="fw-semibold mb-1">
                                                Thông tin cơ bản của TOUR
                                            </h5>
                                            <div class="mb-3 row">
                                                <div class="col-12">
                                                    <img
                                                        style="
                                                        width: 300px;
                                                        height: 200px;
                                                        border-radius: 5px;
                                                        "
                                                        src="${TOUR.thumbnail}"
                                                        />
                                                </div>
                                            </div>    
                                            <div class="mb-3 row">
                                                <div class="col-12">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-inline"
                                                        >Tên TOUR
                                                    </label>
                                                    <h6 class="fw-semibold mb-1">
                                                        ${TOUR.tourName}
                                                    </h6>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-6">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-inline"
                                                        >Giá trẻ em
                                                    </label>
                                                    <h6 class="mb-0 fw-semibold">
                                                        <fmt:formatNumber value ="${tripDTO.priceAdult}" type = "currency"/>
                                                    </h6>
                                                </div>
                                                <div class="col-6">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-semibold"
                                                        >Giá trẻ em
                                                    </label>
                                                    <h6 class="mb-0 fw-semibold">
                                                        <fmt:formatNumber value ="${tripDTO.priceChild}" type = "currency"/>
                                                    </h6>
                                                </div>
                                            </div>  
                                            <div class="mb-3 row">
                                                <div class="col-12">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-inline"
                                                        >Các điểm đến
                                                    </label>
                                                    <h6 class="mb-0 fw-semibold">
                                                        ${TOUR.location}
                                                    </h6>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:if>
                <style>
                    .bookingIDLink h6{
                        color: black;
                    }

                    .bookingIDLink:hover h6{
                        color :green;
                    }
                </style>                                     
                <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
                <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
                <script src="../assets/js/sidebarmenu.js"></script>
                <script src="../assets/js/app.min.js"></script>
                <script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
                <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
                <script src="../assets/js/dashboard.js"></script>

                <!-- Confirm Press btn -->
                <script>
                    function myFunction() {
                        let text = "Bạn có chắc muốn thay đổi trạng thái hay không ?";
                        if (confirm(text) === false) {
                            event.preventDefault();
                        }
                    }
                </script>
                </body>
                </html>


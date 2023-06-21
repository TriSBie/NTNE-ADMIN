<%-- 
    Document   : index.jsp
    Created on : Jun 11, 2023, 8:21:52 PM
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
        <title>NTNE BOOKING SYSTEM</title>
        <link
            rel="shortcut icon"
            type="image/png"
            href=""
            />
        <link rel="stylesheet" href="<c:url value="../assets/css/styles.min.css"/>" />
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
                                    <span class="hide-menu">Dashboard</span>
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
                                    <span class="hide-menu">TRIP</span>
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
                                    <span class="hide-menu">TOUR</span>
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
                <div class="container-fluid">
                    <!--  Row 1 -->
                    <div class="row">
                        <div class="col-lg-8 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    <h5 class="card-title fw-semibold mb-4">
                                        TOP DOANH THU THEO TOUR
                                    </h5>
                                    <div class="table-responsive">
                                        <table class="table text-nowrap mb-0 align-middle">
                                            <thead class="text-dark fs-4">
                                                <tr>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">ID</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Tên TOUR</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Hình ảnh</h6>
                                                    </th>
                                                    <th class="border-bottom-0">
                                                        <h6 class="fw-semibold mb-0">Tổng Doanh Thu</h6>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Du lieu -->
                                                <c:forEach var="item" items="${LIST_ALL_TOUR_REVENUE}" varStatus="counter">
                                                    <tr>
                                                        <td class="border-bottom-0">
                                                            <h6 class="fw-semibold mb-0">${counter.count}</h6>
                                                        </td>
                                                        <td class="border-bottom-0">
                                                            <h6 class="fw-semibold mb-1">${item.tourName}</h6>
                                                        </td>
                                                        <td class="border-bottom-0">
                                                            <h6 class="fw-semibold mb-0">
                                                                <img
                                                                    style="width: 60px; height: 60px"
                                                                    src=${item.tourThumbnail}
                                                                    />
                                                            </h6>
                                                        </td>
                                                        <td class="border-bottom-0">
                                                            <p class="mb-0 fw-normal"><fmt:formatNumber value ="${item.revenue}" type = "currency"/></p>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <!-- Du lieu -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <!-- Yearly Breakup -->
                                    <div class="card overflow-hidden">
                                        <div class="card-body p-4">
                                            <h5 class="card-title mb-9 fw-semibold">Doanh thu tháng 6</h5>
                                            <div class="row align-items-center">
                                                <div class="col-8">
                                                    <h4 class="fw-semibold mb-3"><fmt:formatNumber value ="${REVENUE_BY_MONTH}" type = "currency"/></p></h4>
                                                    <div class="d-flex align-items-center mb-3">
                                                        <span
                                                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                                                            <i class="ti ti-arrow-up-left text-success"></i>
                                                        </span>
                                                        <p class="text-dark me-1 fs-3 mb-0">0%</p>
                                                        <p class="fs-3 mb-0">Tháng vừa qua</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <!-- Monthly Earnings -->
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row alig n-items-start">
                                                    <div class="col-10">
                                                        <h5 class="card-title mb-9 fw-semibold">Doanh thu hôm nay</h5>
                                                        <h4 class="fw-semibold mb-3">
                                                            <fmt:formatNumber value ="${REVENUE_BY_CURENT_DAY}" type = "currency"/>
                                                        </h4>
                                                        <div class="d-flex align-items-center pb-1">
                                                            <c:if test="${REVENUE_GROWTH_RATE > 100}">
                                                                <span
                                                                    class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                                                                    <i class="ti ti-arrow-up-left text-success"></i>
                                                                </span>
                                                                <p class="text-dark me-1 fs-3 mb-0">
                                                                    ${REVENUE_GROWTH_RATE}%
                                                                </p>
                                                                <br>
                                                            </c:if>
                                                            <c:if test="${REVENUE_GROWTH_RATE < 100 && REVENUE_GROWTH_RATE > 0}">
                                                                <span
                                                                    class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                                                                    <i class="ti ti-arrow-down-right text-danger"></i>
                                                                </span>
                                                                <p class="text-dark me-1 fs-3 mb-0">
                                                                    ${REVENUE_GROWTH_RATE_DOWN}%
                                                                </p>
                                                            </c:if>

                                                            <p class="fs-3 mb-0">
                                                                Hôm qua
                                                                <fmt:formatNumber value ="${REVENUE_BY_PRIVIOUS_DAY}" type = "currency"/>
                                                            </p>
                                                        </div>
                                                        <div class="d-flex align-items-center pb-1">

                                                        </div>
                                                    </div>
                                                    <div class="col-2">
                                                        <div class="d-flex justify-content-end">
                                                            <div
                                                                class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
                                                                <i class="ti ti-currency-dollar fs-6"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  Row 1 -->



                        <!--  Row 3 -->
                        <div class="row">
                            <div class="col-lg-12 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <h5 class="card-title fw-semibold mb-4">BOOKING MỚI NHẤT</h5>
                                        <div class="table-responsive">
                                            <table class="table text-nowrap mb-0 align-middle">
                                                <thead class="text-dark fs-4">
                                                    <c:if test="${empty requestScope.BOOKING_DETAILS}">
                                                        <tr>
                                                            <th class="border-bottom-0">                                     
                                                                <h6 class="fw-semibold mb-0">Mã BK</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="fw-semibold mb-0">Mã Trip</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="fw-semibold mb-0">Ngày booking</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="fw-semibold mb-0">Tên khách hàng</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="fw-semibold mb-0">Tổng giá (VND)</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="fw-semibold mb-0">Trạng thái</h6>
                                                            </th>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${not empty requestScope.BOOKING_DETAILS}">
                                                    <a href="<c:url value="/booking/viewBooking.do"/>">
                                                        <i class="fa-solid fa-caret-left"></i> &nbsp; Quay lại
                                                    </a>
                                                </c:if>
                                                </thead>
                                                <tbody>
                                                    <!--GET LIST BOOKING BY DEFAULT-->
                                                    <c:if test="${not empty requestScope.LIST_OF_SUMMARY_BOOKING}">
                                                        <c:forEach var="bookingITEM" items="${requestScope.LIST_OF_SUMMARY_BOOKING}" begin="1" end="5">
                                                            <tr>
                                                                <td class="border-bottom-0">
                                                                    <c:url var="getDetaiBookingLink" value="/booking/viewDetailBooking.do">
                                                                        <c:param name="bookingID" value="${bookingITEM.id}"/>
                                                                    </c:url>
                                                                    <a href=${getDetaiBookingLink} class="bookingIDLink">
                                                                        <h6 class="fw-semibold mb-0" title="Xem chi tiết">
                                                                            ${bookingITEM.id}
                                                                        </h6>
                                                                    </a>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <h6 class="fw-semibold mb-1">
                                                                        ${bookingITEM.tripDTO.code} - [<fmt:formatDate pattern="dd/MM" value="${bookingITEM.tripDTO.depart_time}"/>]
                                                                    </h6>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="mb-0 fw-normal">
                                                                        <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${bookingITEM.expireDate}" />
                                                                    </p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="fw-semibold mb-1">${bookingITEM.cusBook}</p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="mb-0 fw-normal">
                                                                        <fmt:formatNumber value="${bookingITEM.totalPrice}" type="currency"/>
                                                                    </p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <div class="d-flex align-items-center gap-2">
                                                                        <c:choose>
                                                                            <c:when test="${bookingITEM.status}">
                                                                                <span
                                                                                    class="badge bg-success rounded-3 fw-semibold"
                                                                                    >
                                                                                    Đã thanh toán
                                                                                </span>
                                                                            </c:when>
                                                                            <c:when test="${!bookingITEM.status}">
                                                                                <span
                                                                                    class="badge bg-danger rounded-3 fw-semibold"
                                                                                    >
                                                                                    Chưa thanh toán
                                                                                </span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    <!-- Du lieu -->
                                                </tbody>
                                            </table>
                                            <a href="<c:url value="/booking/viewBooking.do"/>">
                                                <!--<i class="fa-solid fa-caret-left"></i> &nbsp; Quay lại-->
                                                Xem tất cả danh sách Booking
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
            <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
            <script src="../assets/js/sidebarmenu.js"></script>
            <script src="../assets/js/app.min.js"></script>
            <script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
            <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
            <script src="../assets/js/dashboard.js"></script>
    </body>
</html>


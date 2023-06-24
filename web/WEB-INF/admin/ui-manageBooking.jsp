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
                <div class="container-fluid">
                    <!-- Danh Sách BOOKING -->
                    <div class="row">
                        <div class="col-lg-12 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">
                                    <!-- Thông báo nếu thao tác thành công -->
                                    <c:if test="${msg_success != null}">
                                        <div class="alert alert-success">
                                            <strong>${msg_success} [ ${bookingItemID} ]!</strong>
                                        </div>
                                    </c:if>
                                    <!-- Thông báo nếu thao tác thành công -->
                                    <h5 class="card-title fw-semibold mb-4">Danh Sách BOOKING</h5>
                                    <!-- Filter theo trạng thái -->
                                    <div class="mb-3">
                                        <div class="col-6">
                                            <form action="<c:url value="/booking/filterStatusBooking.do"/>">
                                                <button class="btn btn-outline-success" name="payStatus" value="yes">
                                                    <p style="margin:0px; color:#333">Danh sách KH đã thanh toán</p>
                                                </button>
                                                <button class="btn btn-outline-danger" name="payStatus" value="no">
                                                    <p style="margin:0px; color:#333">Danh sách KH chưa thanh toán</p>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table text-nowrap mb-0 align-middle">
                                            <thead class="text-dark fs-4">
                                                <c:if test="${empty requestScope.BOOKING_DETAILS}">
                                                    <tr>
                                                        <th class="border-bottom-0">                                     
                                                            <h6 class="fw-normal mb-0">Mã BK</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Mã Trip</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Ngày booking</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Tên khách hàng</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Tổng giá (VND)</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Trạng thái</h6>
                                                        </th>
                                                        <th class="border-bottom-0">
                                                            <h6 class="fw-normal mb-0">Đổi trạng thái</h6>
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
                                                    <c:forEach var="bookingITEM" items="${requestScope.LIST_OF_SUMMARY_BOOKING}" varStatus="counter">
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
                                                                <p class="mb-0 fw-semibold">
                                                                    ${bookingITEM.expireDate}
                                                                </p>
                                                            </td>
                                                            <td class="border-bottom-0">
                                                                <p class="fw-semibold mb-1">${bookingITEM.cusBook}</p>
                                                            </td>
                                                            <td class="border-bottom-0">
                                                                <p class="mb-0 fw-semibold">
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
                                                            <td>
                                                                <!-- Nơi xử lý đổi trạng thái của trip -->
                                                                <c:if test="${bookingITEM.status == true}">
                                                                    <a class="anchorLink"
                                                                       href="#popupEdit${counter.count}"
                                                                       onclick="openPopupEdit(${counter.count})"
                                                                       >
                                                                        <label class="switch">
                                                                            <button class="btn" style="padding: 0">
                                                                                <input type="checkbox" checked>
                                                                                <span class="slider">
                                                                                </span>
                                                                            </button>
                                                                        </label>
                                                                    </a>
                                                                    <div class="card">
                                                                        <div
                                                                            class="card-body overlay2"
                                                                            id="popupEdit${counter.count}"
                                                                            >
                                                                            <div class="popup2">
                                                                                <!-- Tên TOUR -->
                                                                                <h3>Lý do đổi trạng thái thanh toán</h3>
                                                                                <hr class="hr" />
                                                                                <a href="#anchorLink${counter.count - 1}" class="close" onclick="closePopupEdit()">&times;</a>
                                                                                <!-- CREATE TRIP -->
                                                                                <form action="<c:url value="/booking/hanleChangeState_Booking.do"/>" method="post">
                                                                                    <div class="formTour">
                                                                                        <div class="formTour-package">
                                                                                            <div class="mb-3 row">
                                                                                                <div class="mb-3 col-12">
                                                                                                    <label class="form-label">Mô tả lý do</label>
                                                                                                    <textarea 
                                                                                                        rows="5" 
                                                                                                        class="form-control" 
                                                                                                        id="editor${counter.count}" 
                                                                                                        name="destinationDescription"
                                                                                                        value=${bookingITEM.reason}>
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- END CREATE TRIP -->
                                                                                    <!-- Check Box -->
                                                                                    <div class="mb-3 form-check">
                                                                                        <input type="checkbox" class="form-check-input" required/>
                                                                                        <label class="form-check-label"
                                                                                               >Xác thực thay đổi trạng thái booking</label
                                                                                        >
                                                                                    </div>

                                                                                    <input type="hidden" name="bookingItemID" value="${bookingITEM.id}"/>
                                                                                    <button
                                                                                        type="submit"
                                                                                        class="btn btn-primary"
                                                                                        onclick="closePopupEdit()"
                                                                                        >
                                                                                        Lưu
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${bookingITEM.status != true}" >
                                                                    <a class="anchorLink"
                                                                       href="#popupEdit${counter.count}"
                                                                       onclick="openPopupEdit(${counter.count})"
                                                                       >
                                                                        <label class="switch">
                                                                            <button class="btn">
                                                                                <input type="checkbox">
                                                                                <span class="slider">
                                                                                </span>
                                                                            </button>
                                                                        </label>
                                                                    </a>
                                                                    <div class="card">
                                                                        <div
                                                                            class="card-body overlay2"
                                                                            id="popupEdit${counter.count}"
                                                                            >
                                                                            <div class="popup2">
                                                                                <!-- Tên TOUR -->
                                                                                <h3>Lý do đổi trạng thái thanh toán</h3>
                                                                                <hr class="hr" />
                                                                                <a href="#anchorLink${counter.count - 1}" class="close" onclick="closePopupEdit()">&times;</a>
                                                                                <!-- CREATE TRIP -->
                                                                                <form action="<c:url value="/booking/hanleChangeState_Booking.do"/>" method="post">
                                                                                    <div class="formTour">
                                                                                        <div class="formTour-package">
                                                                                            <div class="mb-3 row">
                                                                                                <div class="mb-3 col-12">
                                                                                                    <label class="form-label">Mô tả lý do</label>
                                                                                                    <textarea 
                                                                                                        rows="5" 
                                                                                                        class="form-control" 
                                                                                                        id="editor${counter.count}" 
                                                                                                        name="descriptionBookingChanged"
                                                                                                        value=${bookingITEM.reason}>
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- END CREATE TRIP -->
                                                                                    <!-- Check Box -->


                                                                                    <div class="mb-3 form-check">
                                                                                        <input type="checkbox" class="form-check-input confirmative-change" required/>
                                                                                        <label class="form-check-label"
                                                                                               >Xác thực thay đổi trạng thái booking</label
                                                                                        >
                                                                                    </div>
                                                                                    <input type="hidden" name="bookingItemID" value="${bookingITEM.id}"/>
                                                                                    <button
                                                                                        type="submit"
                                                                                        class="btn btn-primary saveBtn"
                                                                                        onclick="closePopupEdit()"
                                                                                        >
                                                                                        Lưu
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <!-- Nơi xử lý đổi trạng thái của Booking -->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <!--END-->

                                                <!--GET LIST OF BOOKING WITH STATUS IN CONDITION-->
                                                <c:if test="${not empty requestScope.BOOKING_STATUS_WITH_CONDITION}">
                                                    <c:forEach var="bookingITEM" items="${requestScope.BOOKING_STATUS_WITH_CONDITION}" varStatus="counter">
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
                                                                    ${bookingITEM.expireDate}
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
                                                            <td>
                                                                <!-- Nơi xử lý đổi trạng thái của trip -->
                                                                <c:if test="${bookingITEM.status == true}">
                                                                    <a class="anchorLink"
                                                                       href="#popupEdit${counter.count}"
                                                                       onclick="openPopupEdit(${counter.count})"
                                                                       >
                                                                        <label class="switch">
                                                                            <button class="btn" style="padding: 0">
                                                                                <input type="checkbox" checked>
                                                                                <span class="slider">
                                                                                </span>
                                                                            </button>
                                                                        </label>
                                                                    </a>
                                                                    <div class="card">
                                                                        <div
                                                                            class="card-body overlay2"
                                                                            id="popupEdit${counter.count}"
                                                                            >
                                                                            <div class="popup2">
                                                                                <!-- Tên TOUR -->
                                                                                <h3>Lý do đổi trạng thái thanh toán</h3>
                                                                                <hr class="hr" />
                                                                                <a href="#anchorLink${counter.count - 1}" class="close" onclick="closePopupEdit()">&times;</a>
                                                                                <!-- CREATE TRIP -->
                                                                                <form action="<c:url value="/booking/hanleChangeState_Booking.do"/>" method="post">
                                                                                    <div class="formTour">
                                                                                        <div class="formTour-package">
                                                                                            <div class="mb-3 row">
                                                                                                <div class="mb-3 col-12">
                                                                                                    <label class="form-label">Mô tả lý do</label>
                                                                                                    <textarea 
                                                                                                        rows="5" 
                                                                                                        class="form-control" 
                                                                                                        id="editor${counter.count}" 
                                                                                                        name="destinationDescription"
                                                                                                        value=${bookingITEM.reason}>
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- END CREATE TRIP -->
                                                                                    <!-- Check Box -->
                                                                                    <div class="mb-3 form-check">
                                                                                        <input type="checkbox" class="form-check-input" required/>
                                                                                        <label class="form-check-label"
                                                                                               >Xác thực thay đổi trạng thái booking</label
                                                                                        >
                                                                                    </div>

                                                                                    <input type="hidden" name="bookingItemID" value="${bookingITEM.id}"/>
                                                                                    <button
                                                                                        type="submit"
                                                                                        class="btn btn-primary"
                                                                                        onclick="closePopupEdit()"
                                                                                        >
                                                                                        Lưu
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${bookingITEM.status != true}" >
                                                                    <a class="anchorLink"
                                                                       href="#popupEdit${counter.count}"
                                                                       onclick="openPopupEdit(${counter.count})"
                                                                       >
                                                                        <label class="switch">
                                                                            <button class="btn">
                                                                                <input type="checkbox">
                                                                                <span class="slider">
                                                                                </span>
                                                                            </button>
                                                                        </label>
                                                                    </a>
                                                                    <div class="card">
                                                                        <div
                                                                            class="card-body overlay2"
                                                                            id="popupEdit${counter.count}"
                                                                            >
                                                                            <div class="popup2">
                                                                                <!-- Tên TOUR -->
                                                                                <h3>Lý do đổi trạng thái thanh toán</h3>
                                                                                <hr class="hr" />
                                                                                <a href="#anchorLink${counter.count - 1}" class="close" onclick="closePopupEdit()">&times;</a>
                                                                                <!-- CREATE TRIP -->
                                                                                <form action="<c:url value="/booking/hanleChangeState_Booking.do"/>" method="post">
                                                                                    <div class="formTour">
                                                                                        <div class="formTour-package">
                                                                                            <div class="mb-3 row">
                                                                                                <div class="mb-3 col-12">
                                                                                                    <label class="form-label">Mô tả lý do</label>
                                                                                                    <textarea 
                                                                                                        rows="5" 
                                                                                                        class="form-control" 
                                                                                                        id="editor${counter.count}" 
                                                                                                        name="descriptionBookingChanged"
                                                                                                        value=${bookingITEM.reason}>
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- END CREATE TRIP -->
                                                                                    <!-- Check Box -->


                                                                                    <div class="mb-3 form-check">
                                                                                        <input type="checkbox" class="form-check-input confirmative-change" required/>
                                                                                        <label class="form-check-label"
                                                                                               >Xác thực thay đổi trạng thái booking</label
                                                                                        >
                                                                                    </div>
                                                                                    <input type="hidden" name="bookingItemID" value="${bookingITEM.id}"/>
                                                                                    <button
                                                                                        type="submit"
                                                                                        class="btn btn-primary saveBtn"
                                                                                        onclick="closePopupEdit()"
                                                                                        >
                                                                                        Lưu
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <!-- Nơi xử lý đổi trạng thái của Booking -->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <!--END-->
                                                <!-- Du lieu -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <c:if test="${empty requestScope.BOOKING_DETAILS}">
                                    <!--  Phân trang -->
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1">Trang trước</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">Trang sau</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <!--  Phân trang -->
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Style CSS-->
        <style>
            /* The switch - the box around the slider */
            .switch {
                font-size: 12px;
                position: relative;
                display: inline-block;
                width: 3.5em;
                height: 2em;
                top: 15px;
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

            .overlay2 {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                background: rgba(0, 0, 0, 0.7);
                transition: opacity 500ms;
                visibility: hidden;
                opacity: 0;
            }
            .overlay2:target {
                visibility: visible;
                opacity: 1;
                z-index: 99;
            }
            .popup2 {
                top: 8%;
                left: 3%;
                /*            margin: 70px auto;*/
                margin-left: 26%;
                margin-top: 25px;
                padding: 15px;
                background: #fff;
                border-radius: 5px;
                width: 50%;
                position: relative;
                transition: all 1s ease-in-out;

            }
            .popup2 img {
                width: 100%;
            }
            .popup2 h2 {
                margin-top: 0;
                color: #333;
                font-family: Tahoma, Arial, sans-serif;
            }
            .popup2 .close {
                position: absolute;
                top: -9px;
                right: 30px;
                transition: all 200ms;
                font-size: 40px;
                font-weight: bold;
                text-decoration: none;
                color: #333;
            }
            .popup2 .close:hover {
                color: #06d85f;
            }
            .popup2 .content {
                max-height: 30%;
                overflow: auto;
            }
        </style>
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
        <script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>

        <!-- Confirm Press btn -->
        <!--        <script>
                                                                            function myFunction() {
                                                                                let text = "Bạn có chắc muốn thay đổi trạng thái hay không ?";
                                                                                if (confirm(text) === false) {
                                                                                    event.preventDefault();
                                                                                }
                                                                            }
                </script>-->
        <script>
                                                                                            var index = 1;
                                                                                            var editor = "editor" + index;
                                                                                            CKEDITOR.replace(editor);
                                                                                            CKEDITOR.replace('editorCreate')
                                                                                            function openPopupEdit(value) {
                                                                                                index = value;
                                                                                                editor = "editor" + index;
                                                                                                CKEDITOR.replace(editor);
                                                                                                document.querySelector(
                                                                                                        '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
                                                                                                        ).style.zIndex = "0";
                                                                                            }

                                                                                            function closePopupEdit(e) {
                                                                                                let checked = document.querySelector('.confirmative-change')
                                                                                                if (checked.checked != true) {
                                                                                                    e.preventDefault();
                                                                                                }
                                                                                                document.querySelector(
                                                                                                        '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
                                                                                                        ).style.zIndex = "10";
                                                                                            }

        </script>
    </body>
</html>


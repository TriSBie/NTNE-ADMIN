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
                    <div class="row">
                        <!-- Danh sách booking gần nhất  -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <h5 class="card-title fw-semibold mb-4">DANH SÁCH TẤT CẢ CÁC BOOKING</h5>
                                        <!-- EXPORT EXCEL -->
                                        <div class="row alig n-items-start">
                                            <div class="col-3">
                                                <button class="btn btn-primary" onclick="exportTableToExcel('tblData', 'members-data')">Xuất file Excel</button>
                                            </div>
                                        </div>
                                        <!-- EXPORT EXCEL -->
                                        <div class="table-responsive">
                                            <table class="table text-nowrap mb-0 align-middle" id="tblData">
                                                <thead class="text-dark fs-4">
                                                    <c:if test="${empty requestScope.BOOKING_DETAILS}">
                                                        <tr>
                                                            <th class="border-bottom-0">                                     
                                                                <h6 class="mb-0 fw-normal">Mã BK</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Mã Trip</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Ngày booking</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Tên khách hàng</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Số điện thoại</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Email</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Số vé</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Tổng giá (VND)</h6>
                                                            </th>
                                                            <th class="border-bottom-0">
                                                                <h6 class="mb-0 fw-normal">Trạng thái</h6>
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
                                                        <c:forEach var="bookingITEM" items="${requestScope.LIST_OF_SUMMARY_BOOKING}">
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
                                                                    <p class="fw-semibold mb-1">${bookingITEM.cusMail}</p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="fw-semibold mb-1">${bookingITEM.cusPhone}</p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="fw-semibold mb-1">${bookingITEM.totalQuantity}</p>
                                                                </td>
                                                                <td class="border-bottom-0">
                                                                    <p class="fw-semibold mb-1">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Danh sách booking gần nhất  -->
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

        <!--Function xuất file excel -->
        <script>
                                                    function exportTableToExcel(tableID, filename = '') {
                                                        var downloadLink;
                                                        var dataType = 'application/vnd.ms-excel';
                                                        var tableSelect = document.getElementById(tableID);
                                                        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

                                                        // Specify file name
                                                        filename = filename ? filename + '.xls' : 'excel_data.xls';

                                                        // Create download link element
                                                        downloadLink = document.createElement("a");

                                                        document.body.appendChild(downloadLink);

                                                        if (navigator.msSaveOrOpenBlob) {
                                                            var blob = new Blob(['\ufeff', tableHTML], {
                                                                type: dataType
                                                            });
                                                            navigator.msSaveOrOpenBlob(blob, filename);
                                                        } else {
                                                            // Create a link to the file
                                                            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

                                                            // Setting the file name
                                                            downloadLink.download = filename;

                                                            //triggering the function
                                                            downloadLink.click();
                                                    }
                                                    }
        </script>
    </body>
</html>


<%-- 
    Document   : ui-editTrip
    Created on : Jun 17, 2023, 8:56:17 PM
    Author     : thuyk
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
                <div class="container-fluid" style="background-color: #E6E9EB;">
                    <div class="container-fluid">
                        <h2 class="card-title fw-semibold mb-4">Chỉnh sửa TOUR</h2>
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${not empty requestScope.TOUR_DETAIL}">               
                                    <form action="<c:url value="/tour/hanleEditTour.do"/>" method="post">

                                        <!-- gán ID Tour -->
                                        <input type="hidden" name="tourID" value="${TOUR_DETAIL.tourID}"/>

                                        <!-- Tên TOUR -->
                                        <div class="mb-3">
                                            <h3 class="text-body">${TOUR_DETAIL.tourName}</h3>
                                            <img
                                                src="${TOUR_DETAIL.thumbnail}"
                                                alt="${TOUR_DETAIL.tourName}"
                                                class="img-thumbnail"
                                                style="width: 300px"
                                                />
                                        </div>


                                        <!-- CREATE TRIP -->
                                        <div class="formTour">
                                            <div class="formTour-package">
                                                <div class="mb-3 row">
                                                    <div class="col-2">
                                                        <label class="form-label">Mã TOUR</label>
                                                        <input name="code" type="text" class="form-control" value="${TOUR_DETAIL.code}" placeholder="Tên TOUR hiện tại [ ${TOUR_DETAIL.tourName} ]" required/>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label class="form-label">Mời bạn nhập tên TOUR</label>
                                                        <input name="tourName" type="text" class="form-control" value="${TOUR_DETAIL.tourName}" placeholder="Tên TOUR hiện tại [ ${TOUR_DETAIL.tourName} ]" required/>
                                                    </div>
                                                    <div class="col-6">
                                                        <label class="form-label">Các điểm đến</label>
                                                        <input name="location" type="text" class="form-control" value="${TOUR_DETAIL.location}" placeholder="Địa điểm hiện tại [ ${TOUR_DETAIL.location} ]" required/>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá người lớn (VND)</label
                                                        >
                                                        <input
                                                            name="priceAdult"
                                                            value="${TOUR_DETAIL.priceAdult}"
                                                            type="number"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại:<fmt:formatNumber value ="${TOUR_DETAIL.priceAdult}" type = "currency"/>"
                                                            required
                                                            />
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá trẻ em (VND)</label

                                                        >
                                                        <input
                                                            name="priceChild"
                                                            value="${TOUR_DETAIL.priceChild}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại: <fmt:formatNumber value ="${TOUR_DETAIL.priceChild}" type = "currency"/>"
                                                            required
                                                            />
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-12">
                                                        <label class="form-label">Mời bạn nhập đường dẫn hình ảnh (https://firebase.google.com)</label>
                                                        <textarea name="thumbnail" class="form-control"required>${TOUR_DETAIL.thumbnail}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END CREATE TRIP -->

                                        <!-- Hình Ảnh TOUR -->
                                        <!-- Check Box -->
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" required/>
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
    </body>
</html>


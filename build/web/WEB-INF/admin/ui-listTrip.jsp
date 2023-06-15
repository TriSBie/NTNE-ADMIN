<%-- 
    Document   : ui-listTrip
    Created on : Jun 14, 2023, 4:33:11 PM
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
        <title>Danh sách Trip</title>
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
                                    href="./ui-manageBooking.html"
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
                                    href="./authentication-login.html"
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
                    <div class="container-fluid">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: flex; justify-content: space-between; margin: 0px 12px;">
                                            <h3 class="mb-3">DANH SÁCH TRIP</h3>
                                            <a href="<c:url value="/tour/createTrip.do"/>" alt="createTour">
                                                <button class="btn btn-primary">Tạo TRIP</button>
                                            </a>
                                        </div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên Tour</th>
                                                    <th scope="col">Hình ảnh</th>
                                                    <th scope="col">Ngày khởi hành</th>
                                                    <th scope="col">Giá người lớn</th>
                                                    <!--                                                    <th scope="col">Giá trẻ em</th>-->
                                                    <th scope="col">SL</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col">Chức năng</th>
                                                </tr>
                                            </thead>

                                            <!--Begin DATA -->
                                            <tbody>
                                                <c:if test="${not empty requestScope.LIST_TRIP}">
                                                    <c:forEach var="tripItem" items="${requestScope.LIST_TRIP}">
                                                        <tr>
                                                            <th scope="row">${tripItem.tripID}</th>
                                                            <td>${tripItem.tourName}</td>
                                                            <td>
                                                                <img
                                                                    style="
                                                                    width: 60px;
                                                                    height: 60px;
                                                                    border-radius: 5px;
                                                                    "
                                                                    src="${tripItem.thumbnail}"
                                                                    />
                                                            </td>
                                                            <td style="width: 150px">
                                                                <p>${tripItem.depart_time}</p>
                                                            </td>
                                                            <td style="width: 130px;">
                                                                <fmt:formatNumber value ="${tripItem.priceAdult}" type = "currency"/></span>
                                                            </td>
                                                            <!--                                                            <td style="width: 130px;">
                                                            <fmt:formatNumber value ="${tripItem.priceChild}" type = "currency"/></span>
                                                        </td>-->
                                                            <td>${tripItem.quantity}</td>
                                                            <td>
                                                                <form action="<c:url value="/tour/hanleChangeState.do"/>" method="post">
                                                                    <!-- Nơi xử lý đổi trạng thái của trip -->

                                                                    <input type="hidden" name="tripID" value="${tripItem.tripID}"/>
                                                                    <c:if test="${tripItem.availability == true}">
                                                                        <span class="badge bg-success rounded-3 fw-semibold">Hoạt động</span>
                                                                        <!--<button type="submit" class="btn btn-primary">Active</button>-->
                                                                    </c:if>
                                                                    <c:if test="${tripItem.availability != true}">
                                                                        <span class="badge bg-danger rounded-3 fw-semibold">Tạm dừng</span>
                                                                        <!--<button type="submit" class="btn btn-warning">Inactive</button>-->
                                                                    </c:if>
                                                                    <!-- Nơi xử lý đổi trạng thái của trip -->
                                                                </form>
                                                            </td>
                                                            <td style="width: 130px;">
                                                                <a href="./ui-editTrip.html">
                                                                    <button class="btn btn-warning">
                                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                                    </button>
                                                                </a>
                                                                <button class="btn btn btn-danger">
                                                                    <i class="fa-solid fa-trash"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                            <!--End DATA -->
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const btnActive = document.querySelector(".btnActive");

            function changeStatus() {
                btnActive.innerText = "Tạm dừng";
            }
        </script>
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/sidebarmenu.js"></script>
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    </body>
</html>


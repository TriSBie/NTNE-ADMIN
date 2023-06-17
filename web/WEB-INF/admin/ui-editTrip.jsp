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
        <title>Chỉnh sửa TRIP</title>
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

                            <!-- Quản lí Booking -->
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
                            <!-- End tour manage -->

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
                            <li class="nav-small-cap">
                                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                <span class="hide-menu">Tài khoản</span>
                            </li>
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./authentication-login.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="ti ti-login"></i>
                                    </span>
                                    <span class="hide-menu">Đăng nhập</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="./authentication-register.html"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="ti ti-user-plus"></i>
                                    </span>
                                    <span class="hide-menu">Đăng kí</span>
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
                        <h2 class="card-title fw-semibold mb-4">Chỉnh sửa TRIP</h2>
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${not empty requestScope.TRIP_DETAIL}">
                                    <form action="<c:url value="/tour/hanleEditTrip.do"/>" method="post">
                                        <!-- gán ID TRIP -->
                                        <input type="hidden" name="tripID" value="${TRIP_DETAIL.tripID}"/>
                                        
                                        <!-- Tên TOUR -->
                                        <div class="mb-3">
                                            <h3 class="text-body">${TRIP_DETAIL.tourName}</h3>
                                            <img
                                                src="${TRIP_DETAIL.thumbnail}"
                                                alt="${TRIP_DETAIL.tourName}"
                                                class="img-thumbnail"
                                                style="width: 150px"
                                                />
                                        </div>

                                        <!-- CREATE TRIP -->
                                        <div class="formTour">
                                            <div class="formTour-package">
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá người lớn (VND)</label
                                                        >
                                                        <input
                                                            name="priceAdult"
                                                            value="${TRIP_DETAIL.priceAdult}"
                                                            type="number"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại:<fmt:formatNumber value ="${TRIP_DETAIL.priceAdult}" type = "currency"/>"
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
                                                            name="priceChild"
                                                            value="${TRIP_DETAIL.priceChild}"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại: <fmt:formatNumber value ="${TRIP_DETAIL.priceChild}" type = "currency"/>"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label style="color: red" class="form-label"
                                                               >Ngày khởi hành
                                                            <p class="form-text">
                                                                Ngày hiện tại: ${TRIP_DETAIL.depart_time}
                                                            </p></label
                                                        >
                                                        <input name="depart_time" type="date" class="form-control" />
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            style="color: red"
                                                            class="form-label"
                                                            for="tour"
                                                            >Số chỗ cho phép
                                                            <p class="form-text">Số chỗ hiện tại: ${TRIP_DETAIL.quantity}</p>
                                                        </label>
                                                        <input name="quantity" value="${TRIP_DETAIL.quantity}" type="number" class="form-control" />
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
                                                   >Xác thực thay đổi thông tin TRIP</label
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
        <script>
            const buttonCreate = document.querySelector(".btnCreate");
            const formCreate = document.querySelector(".formTour");
            const formTour_package = document.querySelector(".formTour-package");
            console.log(formTour_package);
            function createTourForm(e) {
                const div = document.createElement("div");
                div.innerHTML = `<div class="mb-3 row">
                                <div class="col-6">
                                  <label class="form-label">Mốc thời gian</label>
                                <input type="text" class="form-control" />
                                </div>
                                <div class="col-6">
                                  <label class="form-label" for="tour">Mời bạn chọn địa điểm: </label>
                                  <select class="form-select col-2" name="select_tour" id="tour" aria-label="Default select example">
                                    <option value="1">khu quần thể Vinpearl</option>
                                    <option value="2">VinWonders Nha Trang</option>
                                    <option value="3">Vườn Quý Vương </option>
                                    <option value="4">Khu trò chơi cảm giác mạnh ngoài trời</option>
                                  </select>
                                </div>
                              </div>
                              <div class="mb-3 col-12">
                                <label class="form-label">Chi tiết</label>
                                <textarea
                                  rows="5"
                                  class="form-control"
                                  name="editor1"
                                >
                                </textarea>
                              </div>`;
                div.classList.add("formTour-package");
                formCreate.appendChild(div);
            }
        </script>

        <!-- CKEditor -->
        <script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
        <script>
            CKEDITOR.replace("editor1");
        </script>
        <!-- CKEditor -->
    </body>
</html>

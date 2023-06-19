<%-- 
    Document   : ui-createTrip
    Created on : Jun 14, 2023, 11:10:50 PM
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
        <title>Tạo TRIP</title>
        <link rel="shortcut icon" type="image/png" href="" />
        <link rel="stylesheet" href="../assets/css/styles.min.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
        <style>
            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 12px;
                border: none;
            }

            .dropdown {
                width: 100%;
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                width: 100%;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;

            }

            .dropdown-content a {
                font-size: 12px;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #ddd;}

            .dropdown:hover .dropdown-content {display: block;}

            .dropdown:hover .dropbtn {background-color: #3e8e41;}
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
                        <h2 class="card-title fw-semibold mb-4">Tạo TRIP</h2>
                        <div class="card">
                            <div class="card-body">
                                <form action="<c:url value="/tour/hanleCreateTrip.do"/>" method="post">
                                    <!-- Gán TOUR ID để tạo trip -->
                                    <input name="tour_id" type="hidden" class="form-control" value="${TOUR.tourID}"/>
                                    
                                    
                                    <!-- Select TOUR -->
                                    <div class="mb-3 row">
                                        <div class="col-7">
                                            <label id="tour-selection" class="form-label">Mời bạn chọn Tour</label>
                                            <br>
                                            <div class="dropdown">
                                                <button type="button" class="form-select">${TOUR.tourName}</button>
                                                <div class="dropdown-content">
                                                    <c:forEach var="tour" items="${requestScope.LIST_TOUR}" varStatus="counter">
                                                        <c:url var="getDetailTourLink" value="/tour/createTrip.do">
                                                            <c:param name="tourID" value="${tour.tourID}"/>
                                                        </c:url>
                                                        <a href="${getDetailTourLink}">${counter.count} - ${tour.tourName}</a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Chon ngay khoi hanh -->        
                                        <div class="col-5">
                                            <label class="form-label">Ngày khởi hành</label>
                                            <input name="depart_time" type="date" class="form-control" value=""/>
                                        </div>
                                    </div>

                                    <div class="mb-3 row">

                                    </div>   
                                    <!-- CREATE TRIP -->
                                    <div class="formTour">
                                        <span>Giá mặc định của TOUR &nbsp;
                                            [ <fmt:formatNumber value ="${TOUR.priceAdult}" type = "currency"/> ]
                                        </span>

                                        <div class="formTour-package">
                                            <div class="mb-3 row">
                                                <div class="col-4">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-label"
                                                        >Giá người lớn (VND)</label
                                                    >
                                                    <input
                                                        name="priceAdult"
                                                        type="number"
                                                        class="form-control"
                                                        id="exampleInputEmail1"
                                                        aria-describedby="emailHelp"
                                                        value="${TOUR.priceAdult}"
                                                        />
                                                </div>
                                                <div class="col-4">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-label"
                                                        >Giá trẻ em (VND)</label
                                                    >
                                                    <input
                                                        type="number"
                                                        class="form-control"
                                                        id="exampleInputEmail1"
                                                        name="priceChild"
                                                        aria-describedby="emailHelp"
                                                        value="${TOUR.priceChild}"
                                                        />
                                                </div>
                                                <div class="col-4">
                                                    <label
                                                        class="form-label"
                                                        for="tour"
                                                        >Số chỗ cho phép
                                                    </label>
                                                    <input name="quantity" type="number" class="form-control" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END CREATE TRIP -->

                                    <!-- Hình Ảnh TOUR -->
                                    <!-- Check Box -->
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" 
                                               required />
                                        <label class="form-check-label">Xác thực tạo TRIP</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        Tạo TRIP
                                    </button>
                                </form>
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


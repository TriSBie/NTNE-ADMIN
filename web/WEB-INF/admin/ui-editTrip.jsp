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

                            <!-- Manage Image -->
                            <li class="sidebar-item">
                                <a
                                    class="sidebar-link"
                                    href="<c:url value="/tour/listImage.do"/>"
                                    aria-expanded="false"
                                    >
                                    <span>
                                        <i class="fa-solid fa-image"></i>   
                                    </span>
                                    <span class="hide-menu">Hình ảnh</span>
                                </a>
                            </li>
                            <!-- End Image management -->

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
                <div class="container-fluid" style="background-color: #E6E9EB;">
                    <div class="container-fluid">
                        <h2 class="card-title fw-semibold mb-2">THAY ĐỔI THÔNG TIN CHUYẾN ĐI</h2>
                        <a href="<c:url value="/tour/listTrip.do"/>">
                            <i class="fa-solid fa-caret-left"></i> &nbsp; Quay lại
                        </a>
                        <div class="row">
                            <div class="col-lg-8  ">
                                <div class="card" >
                                    <div class="card-body">
                                        <c:if test="${not empty requestScope.TRIP_DETAIL}">               
                                            <form action="<c:url value="/tour/hanleEditTrip.do"/>" method="post">
                                                <!-- gán ID TRIP -->
                                                <input type="hidden" name="tripID" value="${TRIP_DETAIL.tripID}"/>
                                                <!-- CREATE TRIP -->
                                                <div class="mb-3 row">
                                                    <div class="col-6">
                                                        <label class="form-label">Ngày khởi hành hiện tại:
                                                            <fmt:formatDate pattern = "dd-MM-yyyy" value = "${TRIP_DETAIL.depart_time}"/>
                                                        </label>
                                                        <input type="date" class="form-control" min="${NOW}" required="" value= "${TRIP_DETAIL.depart_time}"  disabled=""/>
                                                        <input name="depart_time" type="hidden" class="form-control" min="${NOW}" required="" value= "${TRIP_DETAIL.depart_time}"/>
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            class="form-label"
                                                            for="tour"
                                                            >Số chỗ hiện tại: ${TRIP_DETAIL.quantity}
                                                        </label>
                                                        <input name="quantity" value="${TRIP_DETAIL.quantity}" type="number" class="form-control" min="1" max="20" required=""/>
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
                                                            type="number"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại:<fmt:formatNumber value ="${TRIP_DETAIL.priceAdult}" type = "currency"/>"
                                                            min="1000"
                                                            required=""
                                                            disabled=""
                                                            />
                                                        <input
                                                            name="priceAdult"
                                                            value="${TRIP_DETAIL.priceAdult}"
                                                            type="hidden"
                                                            />
                                                    </div>
                                                    <div class="col-6">
                                                        <label
                                                            for="exampleInputEmail1"
                                                            class="form-label"
                                                            >Giá trẻ em (VND)</label
                                                        >
                                                        <input
                                                            type="number"
                                                            class="form-control"
                                                            id="exampleInputEmail1"
                                                            aria-describedby="emailHelp"
                                                            placeholder="Giá hiện tại: <fmt:formatNumber value ="${TRIP_DETAIL.priceChild}" type = "currency"/>"
                                                            min="1000"
                                                            required=""
                                                            disabled=""
                                                            />
                                                        <input
                                                            name="priceChild"
                                                            value="${TRIP_DETAIL.priceChild}"
                                                            type="hidden"
                                                            />
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
                                                        >Giá người lớn
                                                    </label>
                                                    <h6 class="mb-0 fw-semibold">
                                                        <fmt:formatNumber value ="${TOUR.priceAdult}" type = "currency"/>
                                                    </h6>
                                                </div>
                                                <div class="col-6">
                                                    <label
                                                        for="exampleInputEmail1"
                                                        class="form-check-semibold"
                                                        >Giá trẻ em
                                                    </label>
                                                    <h6 class="mb-0 fw-semibold">
                                                        <fmt:formatNumber value ="${TOUR.priceChild}" type = "currency"/>
                                                    </h6>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </c:if>
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


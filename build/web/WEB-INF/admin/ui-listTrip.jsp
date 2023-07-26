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
        <!-- BOOTSTRAP -->
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
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- Thông báo nếu thao tác thành công -->
                                        <c:if test="${msg_success_create != null}">
                                            <div class="alert alert-success">
                                                <strong>${msg_success_create}</strong>
                                            </div>
                                        </c:if>
                                        <c:if test="${msg_success != null}">
                                            <div class="alert alert-success">
                                                <strong>${msg_success} [ ${tripID} ]!</strong>
                                            </div>
                                        </c:if>
                                        <div style="display: flex; justify-content: space-between; margin: 0px  0px;">
                                            <h3 class="mb-3">DANH SÁCH CÁC CHUYẾN ĐI</h3>
                                            <a href="<c:url value="/tour/createTrip.do"/>" alt="createTour">
                                                <button class="btn btn-primary">
                                                    <!-- Tạo TRIP-->
                                                    <i class="ti ti-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                        <!-- Filter theo trạng thái -->
                                        <div class="mb-3">
                                            <div class="col-12 ">
                                                <div class="mb-3 row">
                                                    <div class="col-3">
                                                        <div class="dropdown">
                                                            <button type="button" class="form-select">Sắp xếp</button>
                                                            <div class="dropdown-content">
                                                                <a class="dropdown-item active" 
                                                                   href="<c:url value="/tour/filter_state_true.do"/>">
                                                                    Chuyến đi hoạt động
                                                                </a>
                                                                <a class="dropdown-item active" 
                                                                   href="<c:url value="/tour/filter_state_false.do"/>">
                                                                    Chuyến đi ngừng hoạt động
                                                                </a>
                                                                <a class="dropdown-item active" href="<c:url value="/tour/filter_trip_price.do">
                                                                       <c:param name="sortByPrice" value="ascending"/>
                                                                   </c:url>">Giá tăng dần</a>
                                                                <a class="dropdown-item active" href="<c:url value="/tour/filter_trip_price.do">
                                                                       <c:param name="sortByPrice" value="descending"/>
                                                                   </c:url>">Giá giảm dần</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Filter theo trạng thái -->
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Mã Trip</th>
                                                        <th scope="col">Hình ảnh</th>
                                                        <th scope="col">Giá người lớn</th>
                                                        <th scope="col">Giá trẻ em</th>
                                                        <th scope="col">SL</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Tắt/Bật</th>
                                                        <th scope="col">Chức năng</th>
                                                    </tr>
                                                </thead>
                                                <!--Begin DATA -->
                                                <tbody>
                                                    <c:if test="${not empty requestScope.LIST_TRIP}">
                                                        <c:forEach var="tripItem" items="${requestScope.LIST_TRIP}">
                                                            <tr>
                                                                <td scope="row">${tripItem.tripID}</td>
                                                                <td style="width: 150px;">
                                                                    <h6 class="fw-semibold mb-1 titleLink">
                                                                        <c:url var="getListBookinglLink" value="/booking/listBookingbyTripID.do">
                                                                            <c:param name="tripID" value="${tripItem.tripID}"/>
                                                                        </c:url>
                                                                        <a  style="margin:0px;" href="${getListBookinglLink}">
                                                                            ${tripItem.code} - [<fmt:formatDate pattern="dd/MM" value="${tripItem.depart_time}"/>]
                                                                        </a>
                                                                    </h6>
                                                                </td>
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
                                                                    <fmt:formatNumber value ="${tripItem.priceAdult}" type = "currency"/>
                                                                </td>
                                                                <td style="width: 130px;">
                                                                    <fmt:formatNumber value ="${tripItem.priceChild}" type = "currency"/>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${tripItem.current_quantity == tripItem.quantity}">
                                                                        <p style="color: red;font-weight: bold ">${tripItem.current_quantity}/${tripItem.quantity}</p>
                                                                    </c:if>
                                                                    <c:if test="${tripItem.current_quantity < tripItem.quantity}">
                                                                        <p>${tripItem.current_quantity}/${tripItem.quantity}</p>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${tripItem.availability == true}">
                                                                        <span class="badge bg-success rounded-3 fw-semibold">Hoạt động</span>
                                                                    </c:if>
                                                                    <c:if test="${tripItem.availability != true}">
                                                                        <span class="badge bg-danger rounded-3 fw-semibold">Tạm dừng</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <form action="<c:url value="/tour/hanleChangeState.do"/>" method="post">
                                                                        <!-- Nơi xử lý đổi trạng thái của trip -->
                                                                        <input type="hidden" name="tripID" value="${tripItem.tripID}"/>
                                                                        <c:if test="${tripItem.availability == true}">
                                                                            <button type="submit" class="btn" style="padding: 0" onclick="myFunction()">
                                                                                <label class="switch">
                                                                                    <input type="checkbox" checked>
                                                                                    <span class="slider">
                                                                                    </span>
                                                                                </label>
                                                                            </button> 
                                                                        </c:if>
                                                                        <c:if test="${tripItem.availability != true}" >
                                                                            <button type="" class="btn" style="padding: 0;" onclick="myFunction()">
                                                                                <label class="switch">
                                                                                    <input type="checkbox">
                                                                                    <span class="slider">
                                                                                    </span>
                                                                                </label>
                                                                            </button>

                                                                        </c:if>
                                                                        <!-- Nơi xử lý đổi trạng thái của trip -->
                                                                    </form>
                                                                </td>
                                                                <td style="width: 130px;">
                                                                    <form action="<c:url value="/tour/editTrip.do"/>" method="post">
                                                                        <button class="btn btn-warning">
                                                                            <input type="hidden" name="tripID" value="${tripItem.tripID}"/>
                                                                            <i class="fa-solid fa-pen-to-square"></i>
                                                                        </button>
                                                                    </form>
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
                                <!--  Phân trang -->
                                <c:if test="${empty SHOW}">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <c:if test="${currentPage != 1}">
                                                <c:url var="redirectToPagination" value="/tour/listTrip.do">
                                                    <c:param name="page" value="${currentPage - 1}"/>
                                                </c:url>
                                                <li class="page-item">
                                                    <a class="page-link" 
                                                       href="${redirectToPagination}" tabindex="-1">Trang trước</a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfRecords}" var="i" varStatus="counter">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="page-item active">
                                                            <a class="page-link" href="#">
                                                                ${i}
                                                            </a>
                                                        </li>   
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:url var="redirectToPagination" value="/tour/listTrip.do">
                                                            <c:param name="page" value="${i}"/>
                                                        </c:url>
                                                        <li class="page-item"><a class="page-link" href="${redirectToPagination}">${i}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${currentPage != noOfRecords}">
                                                    <c:url var="redirectToPagination" value="/tour/listTrip.do?">
                                                        <c:param name="page" value="${currentPage + 1}"/>
                                                    </c:url>
                                                <li class="page-item ">
                                                    <a class="page-link" 
                                                       href="${redirectToPagination}" tabindex="-1">Trang sau</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </c:if>

                                <!--  Phân trang -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                .titleLink a{
                    color:#333
                }
                .titleLink:hover a{
                    color: green;
                }
            </style>
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


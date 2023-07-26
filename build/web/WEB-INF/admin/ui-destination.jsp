<%-- 
    Document   : ui-destination
    Created on : Jun 14, 2023, 10:29:49 PM
    Author     : buidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Quản lí danh sách Địa Điểm</title>
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

        <!-- CK EDITOR -->
        <script src="//cdn.ckeditor.com/4.21.0/basic/ckeditor.js"></script>
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
                                        <c:if test="${msg_success != null}">
                                            <div class="alert alert-success alert-dismissible">
                                                <strong>${msg_success}</strong>
                                            </div>
                                        </c:if>
                                        <div style="display: flex; justify-content: space-between">
                                            <h5 class="mb-3">DANH SÁCH ĐỊA ĐIỂM</h5>
                                            <a href="#popup1" class="openPopup" onclick="openPopup()">
                                                <button class="btn btn-primary">
                                                    <i class="ti ti-plus"></i>
                                                </button>
                                            </a>
                                        </div>
                                        <!-- Filter -->
                                        <div class="row alig n-items-start">
                                            <div class="col-3">
                                                <input  id="myInput" name="depart_time" type="text" class="form-control" placeholder="Tìm kiếm địa điểm.." />
                                            </div>
                                        </div>
                                        <!-- Filter -->
                                        <div class="container-fluid">
                                            <div class="card">
                                                <div class="card-body overlay" id="popup1">
                                                    <form class="popup" action="<c:url value="/tour/handleCreateDestination.do"/>" method="post">
                                                        <!-- CREATE TRIP -->
                                                        <div class="formTour">
                                                            <a class="close" href="#" onclick="showZindex()">&times;</a> 
                                                            <div class="formTour-package">
                                                                <div class="mb-3 row">
                                                                    <div class="col">
                                                                        <label
                                                                            for="exampleInputEmail1"
                                                                            class="form-label"
                                                                            >Nhập tên Địa điểm mới</label
                                                                        >
                                                                        <input
                                                                            name="destinationName"
                                                                            type="text"
                                                                            class="form-control"
                                                                            id="exampleInputEmail1"
                                                                            aria-describedby="destination_name"
                                                                            value=""
                                                                            required=""
                                                                            />
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3 row">
                                                                    <div class="col-6">
                                                                        <label class="form-label"
                                                                               >Nhập vĩ độ </label>
                                                                        <input name="latitude" type="number" class="form-control" value="" />
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label
                                                                            class="form-label"
                                                                            for="tour"
                                                                            >Nhập kinh độ
                                                                        </label>
                                                                        <input name="longitude" type="number" class="form-control" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3 col-12">
                                                                    <label class="form-label">Mô tả ngắn</label>
                                                                    <textarea rows="3" class="form-control" name="editor1" id="editorCreate" value="" ></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- END CREATE TRIP -->

                                                        <!-- Check Box -->
                                                        <div class="mb-3 form-check">
                                                            <input type="checkbox" class="form-check-input" required />
                                                            <label class="form-check-label">Xác thực tạo Địa điểm</label>
                                                            <br>
                                                        </div>
                                                        <button style="margin-bottom:10px; margin-left: 15px" type="submit" class="btn btn-primary" onclick="closePopup()">
                                                            Tạo địa điểm
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tên Địa Điểm</th>    
                                                <th scope="col">Vĩ độ</th>
                                                <th scope="col">Kinh độ</th>
                                                <th scope="col">Mô tả ngắn</th>
                                                <th scope="col">Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody id="myTable">
                                            <c:if test="${not empty requestScope.LIST_DESTINATION}">
                                                <c:forEach var="destination" items="${requestScope.LIST_DESTINATION}" varStatus="counter">
                                                    <tr scope="row" id="anchorLink${counter.count}">
                                                        <td>${destination.id}</td>
                                                        <td>${destination.name}</td>    
                                                        <td>${destination.lat}</td>
                                                        <td>${destination.lon}</td>
                                                        <td>${destination.description}</td>
                                                        <td>
                                                            <a class="anchorLink"
                                                               href="#popupEdit${counter.count}"
                                                               onclick="openPopupEdit(${counter.count})"
                                                               >
                                                                <button class="btn btn-warning">
                                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                                </button>
                                                            </a>
                                                            <div class="card">
                                                                <div
                                                                    class="card-body overlay2"
                                                                    id="popupEdit${counter.count}"
                                                                    >
                                                                    <form class="popup2" action="<c:url value="/tour/handleEditDestination.do"/>" method="POST">
                                                                        <!-- Tên TOUR -->
                                                                        <a href="#anchorLink${counter.count - 1}" class="close" onclick="closePopupEdit()">&times;</a>
                                                                        <div class="mb-3" style="display: flex">
                                                                            <span class="text-body">[ ${destination.id} ] Tên địa điểm hiện tại: "${destination.name}"</span>
                                                                            <input type="hidden" name="destinationID" value="${destination.id}"/>
                                                                        </div>

                                                                        <!-- CREATE TRIP -->
                                                                        <div class="formTour">
                                                                            <div class="formTour-package">
                                                                                <div class="mb-3 row">
                                                                                    <div class="col-12 mb-3">
                                                                                        <label
                                                                                            for="exampleInputEmail1"
                                                                                            class="form-label"
                                                                                            >Tên địa điểm mới</label
                                                                                        >
                                                                                        <input
                                                                                            name="destinationName"
                                                                                            value="${destination.name}"
                                                                                            type="text"
                                                                                            class="form-control"
                                                                                            id="exampleInputEmail1"
                                                                                            aria-describedby="emailHelp"
                                                                                            >
                                                                                    </div>
                                                                                    <div class="col-6">
                                                                                        <label
                                                                                            for="destinationLatitude"
                                                                                            class="form-label"
                                                                                            >Nhập vĩ độ</label
                                                                                        >
                                                                                        <input
                                                                                            id="destinationLatitude"
                                                                                            name="destinationLat"
                                                                                            type="text"
                                                                                            class="form-control"
                                                                                            value=${destination.lat}
                                                                                            >
                                                                                    </div> 
                                                                                    <div class="col-6">
                                                                                        <label
                                                                                            for="destinationLongitude"
                                                                                            class="form-label"
                                                                                            >
                                                                                            Nhập kinh độ
                                                                                        </label>
                                                                                        <input
                                                                                            id="destinationLongitude"
                                                                                            name="destinationLong"
                                                                                            type="text"
                                                                                            class="form-control"
                                                                                            value=${destination.lon}
                                                                                            >
                                                                                    </div>
                                                                                </div>
                                                                                <div class="mb-3 row">
                                                                                    <div class="mb-3 col-12">
                                                                                        <label class="form-label">Mô tả</label>
                                                                                        <textarea 
                                                                                            rows="5" 
                                                                                            class="form-control" 
                                                                                            id="editor${counter.count}" 
                                                                                            name="destinationDescription"
                                                                                            value=${destination.description}>
                                                                                        </textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!-- END CREATE TRIP -->
                                                                        <!-- Check Box -->
                                                                        <div class="mb-3 form-check">
                                                                            <input type="checkbox" class="form-check-input" required />
                                                                            <label class="form-check-label"
                                                                                   >Xác thực thay đổi thông tin chỉnh sửa Địa điểm</label
                                                                            >
                                                                        </div>
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
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${currentPage != 1}">
                                        <c:url var="redirectToPagination" value="/tour/listDestination.do">
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
                                                <c:url var="redirectToPagination" value="/tour/listDestination.do">
                                                    <c:param name="page" value="${i}"/>
                                                </c:url>
                                                <li class="page-item"><a class="page-link" href="${redirectToPagination}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage != noOfRecords}">
                                            <c:url var="redirectToPagination" value="/tour/listDestination.do?">
                                                <c:param name="page" value="${currentPage + 1}"/>
                                            </c:url>
                                        <li class="page-item ">
                                            <a class="page-link" 
                                               href="${redirectToPagination}" tabindex="-1">Trang sau</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .overlay {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            display: none;
            opacity: 0;
        }
        .overlay:target {
            display:  block;
            opacity: 1;
            z-index: 4;
        }

        #main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header{
            z-index: 5;
        }
        .popup {
            margin: 70px auto;
            padding: 5px;
            background: #fff;
            border-radius: 5px;
            width: 50%;
            position: relative;
            top: 10%;
            left: 10%;
            transition: all 1s ease-in-out;
        }
        .popup img{ width: 100%;}
        .popup h2 {
            margin-top: 0;
            color: #333;
            font-family: Tahoma, Arial, sans-serif;
        }

        .popup .close {
            position: absolute;
            top: -10px;
            right: 12px;
            transition: all 200ms;
            font-size: 36px;
            font-weight: bold;
            text-decoration: none;
            color: #333;
        }
        .popup .close:hover {color: #06D85F;}
        .popup .content {
            max-height: 30%;
            overflow: auto;
        }
        /*--------------------------------------------------------------*/
        .overlay2 {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            display: none;
            opacity: 0;
        }
        .overlay2:target {
            display: block;
            opacity: 1;
            z-index: 4
        }
        .popup2 {
            top: 10%;
            left: 8%;
            /*            margin: 70px auto;*/
            margin-left: 26%;
            margin-top: 25px;
            padding: 15px;
            background: #fff;
            border-radius: 5px;
            width: 50%;
            position: relative;
            transition: all 1s ease-in-out;
            z-index: 1;
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
            top: 10px;
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

        .pagination{
            z-index: 0;
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
    <script>

    </script>

    <script>
        var btnOpenPopup = document.querySelector('.openPopup');
        var popup = document.querySelector('.overlay');
        function openPopup() {
            document.querySelector(".app-header").style.zIndex = "4";
        }
//        addEventListener(btnOpenPopup, function () {
//            document.querySelector(".app-header").style.zIndex = 0;
//        })

        function showZindex() {
            document.querySelector(".app-header").style.zIndex = "10";
        }

//        function closePopup() {
//            popup.style.visibility = "visibility: hidden";
//            popup.style.opacity = "0"
//        }
    </script>

    <script>
        var index = 1;
        function openPopupEdit(value) {
            index = value;
            document.querySelector(
                    '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
                    ).style.zIndex = "4";
        }

        function closePopupEdit(e) {
            document.querySelector(
                    '#main-wrapper[data-layout="vertical"][data-header-position="fixed"] .app-header'
                    ).style.zIndex = "10";
        }
    </script>

    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>
</html>


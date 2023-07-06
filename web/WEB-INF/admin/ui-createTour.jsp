<%-- 
    Document   : ui-createTour
    Created on : Jun 15, 2023, 9:32:49 PM
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
        <!-- CKEditor -->
        <title>Tạo TOUR</title>
        <link rel="shortcut icon" type="image/png" href="" />
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
                        <h2 class="card-title fw-semibold mb-4">TẠO TOUR</h2>
                        <a href="<c:url value="/tour/listTour.do"/>">
                            <i class="fa-solid fa-caret-left"></i> &nbsp; Quay lại
                        </a>
                        <div class="card">
                            <div class="card-body">
                                <form action="<c:url value="/tour/handleCreateTour.do"/>" method="post">
                                    <!-- Tên TOUR -->
                                    <div class="mb-3 row">
                                        <div class="col-5">
                                            <label
                                                for="exampleInputEmail1"
                                                class="form-label"
                                                >Nhập tên TOUR
                                            </label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="exampleInputEmail1"
                                                aria-describedby="emailHelp"
                                                name="name"
                                                required=""
                                                />
                                        </div>
                                        <div class="col-2">
                                            <label
                                                for="exampleInputEmail1"
                                                class="form-label"
                                                >Mã TOUR
                                            </label>
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="exampleInputEmail1"
                                                aria-describedby="emailHelp"
                                                name="code"
                                                required=""
                                                />
                                        </div>
                                        <div class="col-5">
                                            <label
                                                for="exampleInputEmail1"
                                                class="form-label"
                                                >Các điểm đến</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="exampleInputEmail1"
                                                aria-describedby="emailHelp"
                                                name="location"
                                                required=""
                                                />
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
                                                name="priceAdult"
                                                min="1000"
                                                required=""
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
                                                class="form-control "
                                                id="exampleInputEmail1"
                                                aria-describedby="emailHelp"
                                                min="1000"
                                                name="priceChild"
                                                required=""
                                                />
                                        </div>
                                    </div>

                                    <!-- Hình Ảnh TOUR -->
                                    <div class="mb-3">
                                        <label class="form-label"
                                               >Mời bạn nhập đường dẫn hình ảnh (https://firebase.google.com/)
                                        </label>
                                        <input type="text" class="form-control" name="thumbnail" required=""/>
                                    </div>



                                    <!-- CREATE DES -->
                                    <div class="formTour">
                                        <div class="formTour-package">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h2 class="card-title fw-semibold mb-4">Địa điểm 1</h2>
                                                <button type="button" class="btn-close" aria-label="Close" onclick="handleDeleteCreateForm(1)"></button>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-6">
                                                    <label class="form-label" for="tour"
                                                           >Mời bạn chọn địa điểm:
                                                    </label>
                                                    <select
                                                        name="destination_id"
                                                        class="form-select col-2"
                                                        id="tour"
                                                        aria-label="Default select example"
                                                        >
                                                        <c:forEach var="destination" items="${requestScope.LIST_DESTINATION}" varStatus="counter">
                                                            <option value="${destination.id}">${counter.count} - ${destination.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <label class="form-label">Mốc thời gian</label>
                                                    <input type="text" class="form-control" name="duration" required=""/>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label class="form-label">Chi tiết</label>
                                                <textarea id="textarea1" name="script" rows="5" class="form-control" required="">
                                                </textarea>                                               
                                            </div>
                                        </div>
                                    </div>
                                    <button
                                        style="margin-bottom: 20px"
                                        type="button"
                                        class="btn btn-primary btnCreate"
                                        onclick="createTourForm()"
                                        >
                                        Thêm địa điểm
                                    </button>
                                    <!-- END CREATE DES -->
                                    <!-- Check Box -->
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" required/>
                                        <label class="form-check-label">Xác thực tạo TOUR</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                        Tạo TOUR
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
        <script src="<c:url value="assets/js/editor.js"/>"</script> 
        <script src="../assets/js/app.min.js"></script>
        <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
        <!-- CKEditor -->
        <script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>

        <script>
                                            const buttonCreate = document.querySelector(".btnCreate");
                                            const formCreate = document.querySelector(".formTour");
                                            const formTour_package = document.querySelector(".formTour-package");
                                            var values = [];
                                            var contentDivArr = [];
                                            var updatedContentDivArr = [];

                                            var index = 1;
                                            //PUSH DEFAULT VALUES
                                            contentDivArr.push(`
                                                <div class="d-flex align-items-center justify-content-between">
                                                 <h2 class="card-title fw-semibold mb-4">Địa điểm ` + index + `</h2>
                                                <button type="button" class="btn-close" aria-label="Close" onclick="handleDeleteCreateForm(` + index + `)"></button>
                                                </div>
                                               
                                                <div class="mb-3 row">
                                                <div class="col-6">
                                                    <label class="form-label" for="tour"
                                                           >Mời bạn chọn địa điểm:
                                                    </label>
                                                    <select
                                                        name="destination_id"
                                                        class="form-select col-2"
                                                        id="tour"
                                                        aria-label="Default select example"
                                                        >
            <c:forEach var="destination" items="${requestScope.LIST_DESTINATION}" varStatus="counter">
                                                            <option value="${destination.id}">${counter.count} - ${destination.name}</option>
            </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <label class="form-label">Mốc thời gian</label>
                                                    <input type="text" class="form-control" name="duration" required=""/>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label class="form-label">Chi tiết</label>` +
                                                    `<textarea id=` + `"textarea` + index + `" name="script" rows="5" class="form-control" required="">
                                                </textarea>                                              
                                            </div>`);


                                            var textArea = "textarea" + index;
                                            CKEDITOR.replace(textArea);


                                            function createTourForm(e) {
                                                index = contentDivArr.length;
                                                index += 1;
                                                const div = document.createElement("div");
                                                let newTourFormSection = `
                                                <div class="d-flex align-items-center justify-content-between">
                                                 <h2 class="card-title fw-semibold mb-4">Địa điểm ` + index + `</h2>
                                                <button type="button" class="btn-close" aria-label="Close" onclick="handleDeleteCreateForm(` + index + `)"></button>
                                                </div>
                                               
                                                <div class="mb-3 row">
                                                <div class="col-6">
                                                    <label class="form-label" for="tour"
                                                           >Mời bạn chọn địa điểm:
                                                    </label>
                                                    <select
                                                        name="destination_id"
                                                        class="form-select col-2"
                                                        id="tour"
                                                        aria-label="Default select example"
                                                        >
            <c:forEach var="destination" items="${requestScope.LIST_DESTINATION}" varStatus="counter">
                                                            <option value="${destination.id}">${counter.count} - ${destination.name}</option>
            </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <label class="form-label">Mốc thời gian</label>
                                                    <input type="text" class="form-control" name="duration" required=""/>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label class="form-label">Chi tiết</label>` +
                                                        `<textarea id=` + `"textarea` + index + `" name="script" rows="5" class="form-control" required="">
                                                </textarea>                                              
                                            </div>`;

                                                div.innerHTML = newTourFormSection;
                                                div.classList.add("formTour-package");
                                                formCreate.appendChild(div);
                                                console.log(index);
                                                var textArea = "textarea" + index;
                                                CKEDITOR.replace(textArea);
                                                contentDivArr.push(newTourFormSection);
                                            }

                                            function createTourFormWithLoop(arrayObj) {
                                                for (var index = 1; index < arrayObj.length + 1; index++) {
                                                    const div = document.createElement("div");
                                                    let newTourFormSection = `
                                                <div class="d-flex align-items-center justify-content-between">
                                                 <h2 class="card-title fw-semibold mb-4">Địa điểm ` + index + `</h2>
                                                <button type="button" class="btn-close" aria-label="Close" onclick="handleDeleteCreateForm(` + index + `)"></button>
                                                </div>
                                               
                                                <div class="mb-3 row">
                                                <div class="col-6">
                                                    <label class="form-label" for="tour"
                                                           >Mời bạn chọn địa điểm:
                                                    </label>
                                                    <select
                                                        name="destination_id"
                                                        class="form-select col-2"
                                                        id="tour"
                                                        aria-label="Default select example"
                                                        >
            <c:forEach var="destination" items="${requestScope.LIST_DESTINATION}" varStatus="counter">
                                                            <option value="${destination.id}">${counter.count} - ${destination.name}</option>
            </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <label class="form-label">Mốc thời gian</label>
                                                    <input type="text" class="form-control" name="duration" required=""/>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label class="form-label">Chi tiết</label>` +
                                                            `<textarea id=` + `"textarea` + index + `" name="script" rows="5" class="form-control" required="">
                                                </textarea>                                              
                                            </div>`;
                                                    div.innerHTML = newTourFormSection;
                                                    div.classList.add("formTour-package");
                                                    formCreate.appendChild(div);
                                                    var textArea = "textarea" + index;
                                                    CKEDITOR.replace(textArea);
                                                }
                                            }

                                            function removeAllChildNodes(parent) {
                                                while (parent.firstChild) {
                                                    parent.removeChild(parent.firstChild);
                                                }
                                            }

                                            function reloadData() {
                                                removeAllChildNodes(formCreate); //remove all child first
                                                createTourFormWithLoop(contentDivArr);
                                            }

                                            function handleDeleteCreateForm(indexCheck) {
                                                const checkDestini = "Địa điểm " + indexCheck;
                                                var flag = -1;
                                                for (var i = 0; i < contentDivArr.length; i++) {
                                                    if (contentDivArr[i].includes(checkDestini)) {
                                                        flag = i;
                                                    }
                                                }
                                                index
                                                if (flag > -1) {
                                                    //remove at index has flagged
                                                    contentDivArr.splice(flag, 1)
                                                }
                                                reloadData();
                                            }
        </script>

    </body>
</html>

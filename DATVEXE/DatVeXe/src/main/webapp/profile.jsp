<%@ page import="nhon.cnpm.it.service.UserService" %>
<%@ page import="nhon.cnpm.it.bean.User" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<head>
    <!-- META DATA -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!--font-family-->
    <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

    <!-- TITLE OF SITE -->
    <title>Travel</title>

    <!-- favicon img -->
    <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

    <!--font-awesome.min.css-->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />

    <!--animate.css-->
    <link rel="stylesheet" href="assets/css/animate.css" />

    <!--hover.css-->
    <link rel="stylesheet" href="assets/css/hover-min.css">

    <!--datepicker.css-->
    <link rel="stylesheet"  href="assets/css/datepicker.css" >

    <!--owl.carousel.css-->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css"/>

    <!-- range css-->
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css" />

    <!--bootstrap.min.css-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- bootsnav -->
    <link rel="stylesheet" href="assets/css/bootsnav.css"/>

    <!--style.css-->
    <link rel="stylesheet" href="assets/css/style.css" />

    <!--responsive.css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!-- main-menu Start -->
<header class="top-area">
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="logo">
                        <a href="index.html">
                            tour<span>Nest</span>
                        </a>
                    </div><!-- /.logo-->
                </div><!-- /.col-->
                <div class="col-sm-10">
                    <div class="main-menu">

                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <i class="fa fa-bars"></i>
                            </button><!-- / button-->
                        </div><!-- /.navbar-header-->
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="smooth-menu"><a href="#home">home</a></li>
                                <li class="smooth-menu"><a href="#gallery">Destination</a></li>
                                <li class="smooth-menu"><a href="#pack">Packages </a></li>
                                <li class="smooth-menu"><a href="#spo">Special Offers</a></li>
                                <li class="smooth-menu"><a href="#blog">blog</a></li>
                                <li class="smooth-menu"><a href="#subs">subscription</a></li>
                                <!--										1. Người dùng chọn thông tin cá nhân ở bên phải thanh menu-->
                                <li>
                                    <!--											2. Chuyển đên trang thông tin cá nhân-->
                                    <button class="book-btn" onclick="location.href='	profile.jsp'">profile
                                    </button>
                                </li><!--/.project-btn--> <!--/.project-btn-->

                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.main-menu-->
                </div><!-- /.col-->
            </div><!-- /.row -->
            <div class="home-border"></div><!-- /.home-border-->
        </div><!-- /.container-->
    </div><!-- /.header-area -->

</header><!-- /.top-area-->
<!-- main-menu End -->
<div style="height: 76px; background: #71a2c4"></div>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <%--            3. gọi đến UserService lấy dữ liệu người dùng&ndash;%&gt;--%>
                <% User user = new UserService().getUser();%>
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                    <%--                5. Hiển thị thông tin người dùng lên giao diện--%>
                    <span class="font-weight-bold"><%=user.getName()%></span>
                    <span class="text-black-50"><%=user.getEmail()%></span>
                    <span> </span>
                </div>
            </div>

            <div class="col-md-5 border-right">
                <%--            7. Gửi các thông tin đến lớp changeProfile để xử lý--%>
                <form action="changeProfile" method="POST">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <div class="row mt-3">
                            <%--10. Hiển thị thông tin mới, thông báo cập nhật thành công--%>
                            <%String error = (String) request.getAttribute("message");%>
                            <%=error == null ? "" : error%>
                            <div class="col-md-12" >
                                <input name="id" type="hidden" class="form-control" value="<%=user.getId()%>"
                                ></div>
                            <div class="col-md-12">
                                <label class="labels">Name</label>
                                <input name="name" type="text" class="form-control" placeholder="enter your name" value="<%=user.getName()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Mobile Number</label>
                                <input name="phone" type="text" class="form-control" placeholder="enter phone number" value="<%=user.getPhone()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Address</label>
                                <input name="address" type="text" class="form-control" placeholder="enter address" value="<%=user.getAddress()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Birthday</label>
                                <input name="birthday" type="text" class="form-control" placeholder="enter birthday" value="<%=user.getBirthday()%>">
                            </div>
                        </div>
                        <%--                    6. Người dùng thay đổi các thông tin muốn thay đổi và ấn nút Save Profile--%>
                        <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                    </div>
                </form>
            </div>
            <div class="col-md-4">
                <form action="ChangePassword" method="post">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience">
                            <span>Mật khẩu</span>
                        </div><br>
                        <%-- Kiểm tra xem có thông báo lỗi hay không --%>
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>

                        <%-- Kiểm tra xem có thông báo thành công hay không --%>
                        <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("success") %>
                        </div>
                        <% } %>
                        <div class="col-md-12"><label class="labels">Mật khẩu cũ</label><input type="password" class="form-control" placeholder="Nhập mật khẩu cũ" id="oldPass" name="oldPass" required></div><br>
                        <div class="col-md-12"><label class="labels">Mật khẩu mới</label><input type="password" class="form-control" placeholder="Nhập mật khẩu mới" id="newPass" name="newPass" required></div>
                        <div class="col-md-12"><label class="labels">Nhập lại mật khẩu mới</label><input type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" id="confirmPass" name="confirmPass" required></div>
                        <div class="mt-5 text-center"><button class="btn btn-primary password-button mt-5" type="submit">Thay đổi mật khẩu</button></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- footer-copyright start -->
    <footer  class="footer-copyright">
        <div class="container">
            <div class="footer-content">
                <div class="row">

                    <div class="col-sm-3">
                        <div class="single-footer-item">
                            <div class="footer-logo">
                                <a href="index.html">
                                    tour<span>Nest</span>
                                </a>
                                <p>
                                    best travel agency
                                </p>
                            </div>
                        </div><!--/.single-footer-item-->
                    </div><!--/.col-->

                    <div class="col-sm-3">
                        <div class="single-footer-item">
                            <h2>link</h2>
                            <div class="single-footer-txt">
                                <p><a href="#">home</a></p>
                                <p><a href="#">destination</a></p>
                                <p><a href="#">spacial packages</a></p>
                                <p><a href="#">special offers</a></p>
                                <p><a href="#">blog</a></p>
                                <p><a href="#">contacts</a></p>
                            </div><!--/.single-footer-txt-->
                        </div><!--/.single-footer-item-->

                    </div><!--/.col-->

                    <div class="col-sm-3">
                        <div class="single-footer-item">
                            <h2>popular destination</h2>
                            <div class="single-footer-txt">
                                <p><a href="#">china</a></p>
                                <p><a href="#">venezuela</a></p>
                                <p><a href="#">brazil</a></p>
                                <p><a href="#">australia</a></p>
                                <p><a href="#">london</a></p>
                            </div><!--/.single-footer-txt-->
                        </div><!--/.single-footer-item-->
                    </div><!--/.col-->

                    <div class="col-sm-3">
                        <div class="single-footer-item text-center">
                            <h2 class="text-left">contacts</h2>
                            <div class="single-footer-txt text-left">
                                <p>+1 (300) 1234 6543</p>
                                <p class="foot-email"><a href="#">info@tnest.com</a></p>
                                <p>North Warnner Park 336/A</p>
                                <p>Newyork, USA</p>
                            </div><!--/.single-footer-txt-->
                        </div><!--/.single-footer-item-->
                    </div><!--/.col-->

                </div><!--/.row-->

            </div><!--/.footer-content-->
            <hr>
            <div class="foot-icons ">
                <ul class="footer-social-links list-inline list-unstyled">
                    <li><a href="#" target="_blank" class="foot-icon-bg-1"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" target="_blank" class="foot-icon-bg-2"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" target="_blank" class="foot-icon-bg-3"><i class="fa fa-instagram"></i></a></li>
                </ul>
                <p>&copy; 2017 <a href="https://www.themesine.com">ThemeSINE</a>. All Right Reserved</p>

            </div><!--/.foot-icons-->
            <div id="scroll-Top">
                <i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
            </div><!--/.scroll-Top-->
        </div><!-- /.container-->

    </footer><!-- /.footer-copyright-->
    <!-- footer-copyright end -->

    <script src="assets/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <!--modernizr.min.js-->
    <script  src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


    <!--bootstrap.min.js-->
    <script  src="assets/js/bootstrap.min.js"></script>

    <!-- bootsnav js -->
    <script src="assets/js/bootsnav.js"></script>

    <!-- jquery.filterizr.min.js -->
    <script src="assets/js/jquery.filterizr.min.js"></script>

    <script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

    <!--jquery-ui.min.js-->
    <script src="assets/js/jquery-ui.min.js"></script>

    <!-- counter js -->
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>

    <!--owl.carousel.js-->
    <script  src="assets/js/owl.carousel.min.js"></script>

    <!-- jquery.sticky.js -->
    <script src="assets/js/jquery.sticky.js"></script>

    <!--datepicker.js-->
    <script  src="assets/js/datepicker.js"></script>

    <!--Custom JS-->
    <script src="assets/js/custom.js"></script>

</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="nhon.cnpm.it.bean.Trip" %>
<%@ page import="nhon.cnpm.it.bean.Bus" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="en">
<head>
<!--    <meta charset="UTF-8"/>-->
<!--    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>-->
<!--    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>-->
<!--    <title>Chọn chổ ngồi</title>-->
<!--    <link-->
<!--            rel="stylesheet"-->
<!--            href="./assets/libs/fontawesome-free-6.1.1-web/css/all.css"-->
<!--    />-->
<!--    <link rel="stylesheet" href="./assets/css/style.css"/>-->
    <head>
        <!-- META DATA -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
        <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet"/>

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- TITLE OF SITE -->
        <title>Travel</title>

        <!-- favicon img -->
        <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

        <!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css"/>

        <!--hover.css-->
        <link rel="stylesheet" href="assets/css/hover-min.css">

        <!--datepicker.css-->
        <link rel="stylesheet" href="assets/css/datepicker.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css"/>

        <!-- range css-->
        <link rel="stylesheet" href="assets/css/jquery-ui.min.css"/>

        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>

        <!-- bootsnav -->
        <link rel="stylesheet" href="assets/css/bootsnav.css"/>

        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css"/>

        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
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
              <button type="button" class="navbar-toggle" data-toggle="collapse"
                      data-target=".navbar-collapse">
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
                <li>
                  <button class="book-btn">book now
                  </button>
                </li><!--/.project-btn-->
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
<% Trip trip = (Trip) request.getAttribute("trip");
    Bus bus = (Bus) request.getAttribute("bus");%>
<div style="height: 76px; background: #71a2c4"></div>
<div id="content">
        <div id="ticket-infor">
            <div class="location-time ticket-infor-item">
                <h1><%=trip.getStartPoint()%> - <%=trip.getEndPoint()%></h1>
                <p>Thời gian khởi hành: <%=trip.getStartTime()%> ngày : <%=trip.getStartDate()%></p>
            </div>
            <div class="car-type-route ticket-infor-item">
                <p>Loại xe: <%=bus.getType()%> -  <%=bus.getNumberOfChair()%> chỗ </p>

            </div>
            <div class="space-price ticket-infor-item">
                <p>Giá vé: <%=trip.getPrice()%> VNĐ</p>
            </div>
        </div>

    <script>
        <% if (request.getAttribute("errorMessage") != null) { %>
        alert("<%= request.getAttribute("errorMessage") %>");
        <% } %>
    </script>

    <div id="ticket-diagram-gh-16">
        <div class="right">
            <div class="note">

                <h1 style="margin-top: 50px">Ghế được chọn</h1>
                <div class="choose-diagram"></div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="margin-top: 100px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Điền Thông Tin</h4>
                        </div>

                        <div class="modal-body">
                            <form action="/InsertVe" method="get" class="input-information">
                                <input id="ve" name="ve" value="" style="display: none">
                                <%--                                    <% // 6.1 thông báo lỗi trên form--%>
                                <%--                                        String errorMessage = (String) request.getAttribute("errorMessage");--%>
                                <%--                                        if (errorMessage != null) {--%>
                                <%--                                    %>--%>
                                <%--                                    <p><%= errorMessage %></p>--%>
                                <%--                                    <%--%>
                                <%--                                        }--%>
                                <%--                                    %>--%>
                                <input id="xe" name="bus" value="<%=bus.getId()%>" style="display: none">
                                <input id="trip" name="trip" value="<%=trip.getId()%>" style="display: none">
                                <label for="phone">Số điện thoại</label>
                                <%--                                    bước 4-5-6 : hiển thị form(4), người dùng nhập(5) và bấm xác nhận(6)--%>
                                <input type="number" id="phone" name="phone" placeholder="Số điện thoại..">

                                <label for="name">Họ Tên</label>
                                <input type="text" id="name" name="name" placeholder="Tên của bạn..">

                                <label for="email">Email (Có hoặc Không)</label>
                                <input type="text" id="email" name="email" placeholder="Email của bạn..">

                                <input type="submit" value="Xác nhận" )>
                            </form>
                        </div>
                        <!--                            <div class="modal-footer">-->
                        <!--                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>-->
                        <!--                                <button type="button" class="btn btn-primary">Đặt Vé</button>-->
                        <!--                            </div>-->
                    </div>
                </div>
            </div>
        </div>
        <div class="left">
            <div class="ticket-diagram">
                <h1>Sơ đồ vé</h1>
                <div class="diagram">
                    <div class="driver not-available">
                        <i class="fa-solid fa-user"></i>
                        <p>Tài xế</p>
                    </div>
                    <div></div>

                    <div></div>
                    <%--                        Bước 3. Người dùng chọn chỗ ngồi trên xe sau đó bấm vào button xác nhận ở bên dưới góc phải của trang--%>
                    <% List<String> list = (List<String>) request.getAttribute("listChairCode");
                        for(String l: list){%>
                    <div class="customer">

                        <p class="paragraph"><i class="fa-solid fa-user gray "></i>  <%=l%></p>
                    </div>
                    <%}%>

                </div>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                    Xác nhận
                </button>
            </div>
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

<div id="notification-background">
    <div class="notification">
        <h1>Không thể chọn quá 5 chổ</h1>
        <div class="ok my-hover ">OK</div>
    </div>
</div>
<script src="assets/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->

<!--modernizr.min.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


<!--bootstrap.min.js-->
<script src="assets/js/bootstrap.min.js"></script>

<!-- bootsnav js -->
<script src="assets/js/bootsnav.js"></script>

<!-- jquery.filterizr.min.js -->
<script src="assets/js/jquery.filterizr.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

<!--jquery-ui.min.js-->
<script src="assets/js/jquery-ui.min.js"></script>

<!-- counter js -->
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>

<!--owl.carousel.js-->
<script src="assets/js/owl.carousel.min.js"></script>

<!-- jquery.sticky.js -->
<script src="assets/js/jquery.sticky.js"></script>

<!--datepicker.js-->
<script src="assets/js/datepicker.js"></script>

<!--Custom JS-->
<script src="assets/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function changeColor(color,text) {
        var element = document.querySelector(".fa-solid.fa-user.gray ");
        element.style.color = color;
    }


    var text=""
    $(document).ready(function() {
         $(".paragraph").click(function() {
            if ( text.indexOf($(this).text()) === -1) {
                text+=  $(this).text()+";";
                $(".choose-diagram").text(text);
                changeColor("blue");
                $("#Ve").val(text);
            } else {
                changeColor("#666666");
                text =text.replace(new RegExp($(this).text()+";", "g"), "");
                $(".choose-diagram").text(text);
                $("#Ve").val(text);
            }
        });
    });

</script>
</body>
</html>

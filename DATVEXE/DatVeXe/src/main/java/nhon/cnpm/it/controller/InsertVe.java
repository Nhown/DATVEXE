package nhon.cnpm.it.controller;

import nhon.cnpm.it.service.TripService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

import static java.lang.System.out;

@WebServlet(name = "InsertVe", value = "/InsertVe")
public class InsertVe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String listVe = request.getParameter("ve");
        String[] list = listVe.trim().split(";");
        String bus = request.getParameter("bus");
        String trip = request.getParameter("trip");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean check=true;
        for (String ve : list) {
            if (check!=TripService.getInstance().checkCart(ve, trip, bus)) {
                check= false;
            } else {
//                7. Hệ thống kiểm tra ghi thông tin vé vào bảng "Ve" ở database và chuyển vé vào giỏ hàng chờ thanh toán
                TripService.getInstance().addVeToCart(email, phone, ve, name, trip, bus);
            }
        }
        // 8. thông báo vé đã được thêm thành công
        if(check) {
            request.setAttribute("successMessage", " vé đã được thêm ở giỏ hàng của bạn!");
            request.getRequestDispatcher("listTour.jsp").forward(request, response);
        }else{
//            String errorMessage = "vé đã có ở giỏ hàng. Vui lòng kiểm tra lại và chọn vé khác!";
//            response.sendRedirect("/ChosenSit?id="+trip+"?error=" + URLEncoder.encode(errorMessage, "UTF-8"));
            request.setAttribute("errorMessage", "vé đã có ở giỏ hàng. Vui lòng kiểm tra lại và chọn vé khác!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ChosenSit?id="+trip);
            dispatcher.forward(request, response);


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
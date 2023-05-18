package nhon.cnpm.it.controller;

import nhon.cnpm.it.service.TripService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InsertVe", value = "/InsertVe")
public class InsertVe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String listVe = request.getParameter("Ve");
        String[] list = listVe.trim().split(";");
        String bus = request.getParameter("bus");
        String trip = request.getParameter("trip");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        StringBuilder check = null;

        for (String ve : list) {
            if (!TripService.getInstance().checkCart(ve, trip, bus)) {
                check.append(ve+";");
            } else {
//                7. Hệ thống kiểm tra ghi thông tin vé vào bảng "Ve" ở database và chuyển vé vào giỏ hàng chờ thanh toán
                TripService.getInstance().addVeToCart(email, phone, ve, name, trip, bus);
            }
        }
        if(check!=null) {
            request.setAttribute("errorMessage", "ghế :" + check.toString() + "đã được chọn ở giỏ hàng của bạn");
           request.getRequestDispatcher("/DatVeXe/ChosenSit?id" + trip).forward(request, response);
        }else {
//            8. thông báo vé đã được thêm thành công
            request.setAttribute("successMessage",   " vé đã được chọn ở giỏ hàng của bạn");
            response.sendRedirect("listTour.jsp");
        }
    }
}
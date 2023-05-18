package nhon.cnpm.it.controller;


import nhon.cnpm.it.bean.Bus;
import nhon.cnpm.it.bean.Trip;
import nhon.cnpm.it.service.TripService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChosenSit", value = "/ChosenSit")
public class ChosenSit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");
        String idBus = TripService.getInstance().getIdBus(id);
        List<String> listChairCode = TripService.getInstance().getAllChairInBus(idBus);
        Trip trip = TripService.getInstance().getTrip(id);
        Bus bus = TripService.getInstance().getBus(idBus);
        request.setAttribute("bus", bus);
        request.setAttribute("trip", trip);
        request.setAttribute("id", idBus);
        request.setAttribute("listChairCode", listChairCode);
//bước 2:Hệ thống chuyển người dùng đến trang chọn chỗ ngồi ở xe
        request.getRequestDispatcher("chon_cho.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

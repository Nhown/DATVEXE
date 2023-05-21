package nhon.cnpm.it.controller;

import nhon.cnpm.it.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changeProfile", value = "/changeProfile")
public class ChangeProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
//        8. Gọi đến UserService để thay đổi dữ liệu người dùng
        UserService userService = new UserService();
        userService.changeInfor(id, name, phone, address, null);
        request.setAttribute("error", "<div class=\"alert alert-success\" role=\"alert\">Thay đổi thành công</div>");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}

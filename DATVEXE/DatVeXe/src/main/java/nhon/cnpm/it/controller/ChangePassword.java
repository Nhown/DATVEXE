package nhon.cnpm.it.controller;

import nhon.cnpm.it.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/ChangePassword")
public class ChangePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");
        String Id = "u0001"; // thay bằng id của user hiện tại

        //Nếu người dùng nhập sai pass cũ

        //6. Kiểm tra mật khẩu cũ
        //6.1. Gọi lớp UserService để lấy thông tin mật khẩu của người dùng
        if (!oldPass.equals(UserService.getInstance().getPasswordById(Id))) {
            //6.3.  Mật khẩu cũ không đúng, hệ thống thông báo lỗi
            request.setAttribute("error", "Mật khẩu cũ không đúng!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        //Nếu người dùng nhập pass mới và xác nhận lại mật khẩu không khớp
        //7. Kiểm tra mật khẩu mới
        if (!newPass.equals(confirmPass)) {
            //7.1.  Mật khẩu mới và nhập lại mật khẩu mới không khớp, hệ thống thông báo lỗi
            request.setAttribute("error", "Nhập lại mật khẩu mới không đúng!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // Thay đổi mật khẩu
        //8. Gọi lớp UserSevice để thay đổi mật khẩu người dùng
        UserService.getInstance().changePassword(newPass, Id);
        //10.Thông báo thay đổi mật khẩu thành công
        request.setAttribute("success", "Thay đổi mật khẩu thành công");
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }
}



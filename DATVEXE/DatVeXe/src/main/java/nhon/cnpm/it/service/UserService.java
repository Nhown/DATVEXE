package nhon.cnpm.it.service;

import nhon.cnpm.it.bean.User;
import nhon.cnpm.it.db.JDBIConnector;
import org.jdbi.v3.core.Handle;

public class UserService {
    private static UserService instance;

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }
    // lấy password của user đang đăng nhập dựa trên id
    public String getPasswordById(String Id) {
        try (Handle handle = JDBIConnector.get().open()) {
            String sql = "SELECT pass FROM user WHERE id = ?";
            return handle.createQuery(sql)
                    .bind(0, Id)
                    .mapTo(String.class)
                    .first();

        }
    }
    //thay đổi password
    public void changePassword(String newPass, String Id) {
        JDBIConnector.get().withHandle(handle -> {
            String sql = "UPDATE User SET pass=? WHERE id =?";
            return handle.createUpdate(sql)
                    .bind(0, newPass)
                    .bind(1, Id)
                    .execute();
        });
    }
    //     4. UserService lấy dữ liệu từ database
    public User getUser() {
        return JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT id, email, pass,name,phone,address,birthday  FROM user WHERE id like 'u0001'")
                        .mapToBean(User.class)
                        .first());

    }
    //    9. UserService thay đổi dữ liệu trên database
    public void changeInfor(String id, String name, String phone, String address, String birthday) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("UPDATE user SET name=?,phone=?,address=?,birthday=? WHERE id=?")
                            .bind(0, name)
                            .bind(1,phone)
                            .bind(2,address)
                            .bind(3,birthday)
                            .bind(4,id)
                            .execute();
                    return null;
                }
        );

    }

}
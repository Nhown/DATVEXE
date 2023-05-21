package nhon.cnpm.it.bean;

import java.util.Date;

public class User {
    private String id;
    private String name;
    private String pass;
    private String phone;
    private String address;
    private String birthday;
    private String email;
    public User(String id, String name, String pass, String phone, String address, String birthday, String email) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.phone = phone;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
    }

    public User() {
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User [userName=" + name + ", password=" + pass + ", email="
                + email + ", phoneNumber=" + phone + ", address=" + address + ", birthday="
                + birthday + "]";
    }
}

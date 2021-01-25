package entity;

public class Userdata {
    private int id;
    private String userName;
    private String password;
    private String avatar;
    private String email;
    private String reg_ip;
    private String log_ip;
    private int role;
    private int state;

    public Userdata(int id, String string, String userName, String password, String avatar, String email, String reg_ip, String log_ip, int role, int state) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.avatar = avatar;
        this.email = email;
        this.reg_ip = reg_ip;
        this.log_ip = log_ip;
        this.role = role;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getReg_ip() {
        return reg_ip;
    }

    public void setReg_ip(String reg_ip) {
        this.reg_ip = reg_ip;
    }

    public String getLog_ip() {
        return log_ip;
    }

    public void setLog_ip(String log_ip) {
        this.log_ip = log_ip;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}

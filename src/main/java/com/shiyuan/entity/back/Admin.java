package com.shiyuan.entity.back;

public class Admin {
    private String admin;
    private String passwd;
    private int limits;
    private String headerImg;

    public Admin() {
    }

    public Admin(String admin, String passwd, int limits, String headerImg) {
        this.admin = admin;
        this.passwd = passwd;
        this.limits = limits;
        this.headerImg = headerImg;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getLimits() {
        return limits;
    }

    public void setLimits(int limits) {
        this.limits = limits;
    }

    public String getHeaderImg() {
        return headerImg;
    }

    public void setHeaderImg(String headerImg) {
        this.headerImg = headerImg;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin='" + admin + '\'' +
                ", passwd='" + passwd + '\'' +
                ", limits=" + limits +
                ", headerImg='" + headerImg + '\'' +
                '}';
    }
}

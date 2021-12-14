package com.shiyuan.entity;
//用户账号信息的Bean
public class User {
   private String account;
   private String name;
   private String passwd;
   private String touxiang;

   public User(){};

    public User(String account, String passwd) {
        this.account = account;
        this.passwd = passwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", passwd='" + passwd + '\'' +
                ", touxiang='" + touxiang + '\'' +
                '}';
    }

    public User(String account, String passwd, String touxiang) {
        this.account = account;
        this.passwd = passwd;
        this.touxiang = touxiang;
    }

    public User(String account, String name, String passwd, String touxiang) {
        this.account = account;
        this.name = name;
        this.passwd = passwd;
        this.touxiang = touxiang;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang;
    }
}

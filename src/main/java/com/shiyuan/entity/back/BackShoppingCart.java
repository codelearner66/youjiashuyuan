package com.shiyuan.entity.back;

public class BackShoppingCart {
    private  String id;
    private  String name;
    private  String account;
    private  String date;
    private String state;

    public BackShoppingCart() { }

    public BackShoppingCart(String id, String name, String account, String date, String state) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.date = date;
        this.state = state;
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

    public String getAccount() {
        return account;
    }

    public void setAccount(String accoount) {
        this.account = accoount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

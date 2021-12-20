package com.shiyuan.entity;

public class ShopCart {
    private String id;
    private String name;
    private String account;
    private String date;
    private String num;
    private String price;
    private String xiaoji;
    private String state;

    public ShopCart() {
    }

    public ShopCart(String id, String name, String account, String date, String num, String price, String xiaoji, String state) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.date = date;
        this.num = num;
        this.price = price;
        this.xiaoji = xiaoji;
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

    public void setAccount(String account) {
        this.account = account;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getXiaoji() {
        return xiaoji;
    }

    public void setXiaoji(String xiaoji) {
        this.xiaoji = xiaoji;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}

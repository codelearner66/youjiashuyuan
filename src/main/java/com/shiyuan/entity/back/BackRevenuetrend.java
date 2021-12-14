package com.shiyuan.entity.back;

public class BackRevenuetrend {
    private String dat;
    private double money;

    public BackRevenuetrend() { }
    public BackRevenuetrend(String dat, double money) {
        this.dat = dat;
        this.money = money;
    }

    public String getDat() {
        return dat;
    }

    public void setDat(String dat) {
        this.dat = dat;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}

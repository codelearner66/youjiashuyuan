package com.shiyuan.entity.back;

public class Echarts {
    private  String name;
    private  double dat;

    public Echarts() { }

    public Echarts(String name, double dat) {
        this.name = name;
        this.dat = dat;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getDat() {
        return dat;
    }

    public void setDat(double dat) {
        this.dat = dat;
    }
}

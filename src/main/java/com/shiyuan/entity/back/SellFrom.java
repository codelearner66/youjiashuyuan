package com.shiyuan.entity.back;

public class SellFrom {
    private String F_Id;
    private String F_BuyerId;
    private String F_M_Id;
    private String F_Date;

    public SellFrom() { }

    public SellFrom(String f_Id, String f_BuyerId, String f_M_Id, String f_Date) {
        F_Id = f_Id;
        F_BuyerId = f_BuyerId;
        F_M_Id = f_M_Id;
        F_Date = f_Date;
    }

    public String getF_Id() {
        return F_Id;
    }

    public void setF_Id(String f_Id) {
        F_Id = f_Id;
    }

    public String getF_BuyerId() {
        return F_BuyerId;
    }

    public void setF_BuyerId(String f_BuyerId) {
        F_BuyerId = f_BuyerId;
    }

    public String getF_M_Id() {
        return F_M_Id;
    }

    public void setF_M_Id(String f_M_Id) {
        F_M_Id = f_M_Id;
    }

    public String getF_Date() {
        return F_Date;
    }

    public void setF_Date(String f_Date) {
        F_Date = f_Date;
    }
}

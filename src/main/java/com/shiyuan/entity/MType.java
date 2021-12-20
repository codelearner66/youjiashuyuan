package com.shiyuan.entity;

public class MType {
    private String T_Id;
    private String T_Name;

    public MType() {
    }

    public MType(String t_Id, String t_Name) {
        T_Id = t_Id;
        T_Name = t_Name;
    }

    @Override
    public String toString() {
        return "MType{" +
                "T_Id='" + T_Id + '\'' +
                ", T_Name='" + T_Name + '\'' +
                '}';
    }

    public String getT_Id() {
        return T_Id;
    }

    public void setT_Id(String t_Id) {
        T_Id = t_Id;
    }

    public String getT_Name() {
        return T_Name;
    }

    public void setT_Name(String t_Name) {
        T_Name = t_Name;
    }
}

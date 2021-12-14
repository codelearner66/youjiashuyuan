package com.shiyuan.entity;

public class Magazines {
    private String M_ID;
    private String M_Name;
    private float M_Price;
    private String M_Type;
    private String M_Cycle;
    private String M_Introduce;
    private String M_ImgUrl;


    @Override
    public String toString() {
        return "Magazines{" +
                "M_ID='" + M_ID + '\'' +
                ", M_Name='" + M_Name + '\'' +
                ", M_Price=" + M_Price +
                ", M_Type='" + M_Type + '\'' +
                ", M_Cycle='" + M_Cycle + '\'' +
                ", M_Introduce='" + M_Introduce + '\'' +
                ", M_ImgUrl='" + M_ImgUrl + '\'' +
                '}';
    }

    public Magazines() {

    }

    public Magazines(String m_ID, String m_Name, float m_Price, String m_Type, String m_Cycle, String m_Introduce, String m_ImgUrl) {
        M_ID = m_ID;
        M_Name = m_Name;
        M_Price = m_Price;
        M_Type = m_Type;
        M_Cycle = m_Cycle;
        M_Introduce = m_Introduce;
        M_ImgUrl = m_ImgUrl;
    }

    public String getM_ID() {
        return M_ID;
    }

    public void setM_ID(String m_ID) {
        M_ID = m_ID;
    }

    public String getM_Name() {
        return M_Name;
    }

    public void setM_Name(String m_Name) {
        M_Name = m_Name;
    }

    public float getM_Price() {
        return M_Price;
    }

    public void setM_Price(float m_Price) {
        M_Price = m_Price;
    }

    public String getM_Type() {
        return M_Type;
    }

    public void setM_Type(String m_Type) {
        M_Type = m_Type;
    }

    public String getM_Cycle() {
        return M_Cycle;
    }

    public void setM_Cycle(String m_Cycle) {
        M_Cycle = m_Cycle;
    }

    public String getM_Introduce() {
        return M_Introduce;
    }

    public void setM_Introduce(String m_Introduce) {
        M_Introduce = m_Introduce;
    }

    public String getM_ImgUrl() {
        return M_ImgUrl;
    }

    public void setM_ImgUrl(String m_ImgUrl) {
        M_ImgUrl = m_ImgUrl;
    }

}

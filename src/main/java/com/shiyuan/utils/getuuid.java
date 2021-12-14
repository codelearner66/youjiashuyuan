package com.shiyuan.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

//生成唯一的32位UUID 作为表sell_form,shopping_cart,margazines的id
public class getuuid {
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    public static String getDate() {//获取特定格式的日期
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd ");
        return simpleDateFormat.format(date);
    }

    public static String getDate(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
    public static String[] getRandomDare(){
        String[]strDate=new String[100];
        for (int i=0;i<100;i++){
            Date date = randomDate("2021-09-1","2021-12-16");
            strDate[i]=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date).toString();
        }
        return strDate;
    }
    private static Date randomDate(String beginDate,String endDate){
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date start = format.parse(beginDate);
            Date end = format.parse(endDate);

            if(start.getTime() >= end.getTime()){
                return null;
            }
            long date = random(start.getTime(),end.getTime());
            return new Date(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static long random(long begin,long end){
        long rtn = begin + (long)(Math.random() * (end - begin));
        if(rtn == begin || rtn == end){
            return random(begin,end);
        }
        return rtn;
    }

}

package com.example.utils;

import java.util.Calendar;
import java.util.Random;

/**
 * @author 软件1907-20195361-徐也川
 */
public class CodeUtils {
    public static String createCode(){
        Calendar calendar = Calendar.getInstance();
        Random random = new Random();
        int n = calendar.get(Calendar.MILLISECOND);
        return ("" +(int)(Math.sqrt(n*786513)*(random.nextDouble()*3456+1))+
                (int)(Math.sin(n)*7891*(random.nextDouble())*1297+1)+
                (int)(Math.cos(n)*117*(random.nextDouble())*941+1)).replace("-","")
                .substring(1,14);
    }
}

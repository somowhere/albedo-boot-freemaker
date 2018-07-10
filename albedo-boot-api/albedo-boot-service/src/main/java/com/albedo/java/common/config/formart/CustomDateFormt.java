package com.albedo.java.common.config.formart;

import com.albedo.java.util.DateUtil;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Date;

public class CustomDateFormt extends DateFormat {

    private DateFormat dateFormat;


    public CustomDateFormt(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    @Override
    public StringBuffer format(Date date, StringBuffer toAppendTo, FieldPosition fieldPosition) {
        try {
            return new StringBuffer(DateUtil.formatDateTime(date));
        }catch (Exception e){
            return dateFormat.format(date, toAppendTo, fieldPosition);
        }
    }

    @Override
    public Date parse(String source, ParsePosition pos) {
        Date date;
        try {
            date = DateUtil.parseDate(source);
        } catch (Exception e) {
            date = dateFormat.parse(source, pos);
        }

        return date;
    }

    // 主要还是装饰这个方法
    @Override
    public Date parse(String source) throws ParseException {
        Date date;
        try {
            // 先按我的规则来
            date = DateUtil.parseDate(source);
        } catch (Exception e) {
            // 不行，那就按原先的规则吧
            date = dateFormat.parse(source);
        }
        return date;
    }

    // 这里装饰clone方法的原因是因为clone方法在jackson中也有用到
    @Override
    public Object clone() {
        Object format = dateFormat.clone();
        return new CustomDateFormt((DateFormat) format);
    }

}

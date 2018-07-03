package com.albedo.java.util.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class ComboVueData implements Serializable {

    public static final String F_LABEL = "label";
    public static final String F_VALUE = "value";
    private static final long serialVersionUID = 1L;
    private String label; // 下拉列表隐藏值
    private String value; // 下拉列表显示值

    public ComboVueData() {
    }

    public ComboVueData(String label, String value) {
        this.label = label;
        this.value = value;
    }

}

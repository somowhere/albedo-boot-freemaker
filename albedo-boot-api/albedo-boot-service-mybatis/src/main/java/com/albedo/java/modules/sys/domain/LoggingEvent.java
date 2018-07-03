/**
 * Copyright &copy; 2015 <a href="http://www.bs-innotech.com/">bs-innotech</a> All rights reserved.
 */
package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 操作日志Entity 操作日志
 *
 * @author admin
 * @version 2017-01-03
 */
@TableName("logging_event")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class LoggingEvent extends GeneralEntity<LoggingEvent> {

    /**
     * F_TIMESTMP timestmp : 创建时间
     */
    public static final String F_TIMESTMP = "timestmp";
    /**
     * F_FORMATTEDMESSAGE formatted_message : 内容
     */
    public static final String F_FORMATTEDMESSAGE = "formattedMessage";
    /**
     * F_LOGGERNAME logger_name : 名称
     */
    public static final String F_LOGGERNAME = "loggerName";
    /**
     * F_LEVELSTRING level_string : 级别
     */
    public static final String F_LEVELSTRING = "levelString";
    /**
     * F_THREADNAME thread_name : 线程
     */
    public static final String F_THREADNAME = "threadName";
    /**
     * F_REFERENCEFLAG reference_flag : 引用标识
     */
    public static final String F_REFERENCEFLAG = "referenceFlag";
    /**
     * F_ARG0 arg0 : 参数0
     */
    public static final String F_ARG0 = "arg0";
    /**
     * F_ARG1 arg1 : 参数1
     */
    public static final String F_ARG1 = "arg1";
    /**
     * F_ARG2 arg2 : 参数2
     */
    public static final String F_ARG2 = "arg2";
    /**
     * F_ARG3 arg3 : 参数3
     */
    public static final String F_ARG3 = "arg3";
    /**
     * F_CALLERFILENAME caller_filename : 操作文件
     */
    public static final String F_CALLERFILENAME = "callerFilename";
    /**
     * F_CALLERCLASS caller_class : 操作类名
     */
    public static final String F_CALLERCLASS = "callerClass";
    /**
     * F_CALLERMETHOD caller_method : 操作方法
     */
    public static final String F_CALLERMETHOD = "callerMethod";
    /**
     * F_CALLERLINE caller_line : 操作行
     */
    public static final String F_CALLERLINE = "callerLine";
    private static final long serialVersionUID = 1L;
    // columns START
    @TableId("event_id")
    @SearchField
    private Long id;
    /**
     * timestmp 创建时间
     */
    @NotNull
    @TableField("timestmp")
    private Long timestmp;
    /**
     * formattedMessage 内容
     */
    @NotBlank
    @Length(max = 65535)
    @TableField("formatted_message")
    private String formattedMessage;
    /**
     * loggerName 名称
     */
    @NotBlank
    @Length(max = 254)
    @TableField("logger_name")
    private String loggerName;
    /**
     * levelString 级别
     */
    @NotBlank
    @Length(max = 254)
    @TableField("level_string")
    @DictType(name = "sys_log_level")
    private String levelString;
    /**
     * threadName 线程
     */
    @Length(max = 254)
    @TableField("thread_name")
    private String threadName;
    /**
     * referenceFlag 引用标识
     */
    @Length(max = 6)
    @TableField("reference_flag")
    @DictType(name = "sys_yes_no")
    private String referenceFlag;
    /**
     * arg0 参数0
     */
    @Length(max = 254)
    @TableField("arg0")
    private String arg0;
    /**
     * arg1 参数1
     */
    @Length(max = 254)
    @TableField("arg1")
    private String arg1;
    /**
     * arg2 参数2
     */
    @Length(max = 254)
    @TableField("arg2")
    private String arg2;
    /**
     * arg3 参数3
     */
    @Length(max = 254)
    @TableField("arg3")
    private String arg3;
    /**
     * callerFilename 操作文件
     */
    @NotBlank
    @Length(max = 254)
    @TableField("caller_filename")
    private String callerFilename;
    /**
     * callerClass 操作类名
     */
    @NotBlank
    @Length(max = 254)
    @TableField("caller_class")
    private String callerClass;
    /**
     * callerMethod 操作方法
     */
    @NotBlank
    @Length(max = 254)
    @TableField("caller_method")
    private String callerMethod;
    /**
     * callerLine 操作行
     */
    @NotBlank
    @Length(max = 4)
    @TableField("caller_line")
    private String callerLine;

    // columns END
    public LoggingEvent(Long id) {
        this.id = id;
    }

    @Override
    protected Serializable pkVal() {
        return getId();
    }
    @Override
    public boolean equals(Object o) {
        return super.equals(o);
    }
    @Override
    public int hashCode() {
        return super.hashCode();
    }
}

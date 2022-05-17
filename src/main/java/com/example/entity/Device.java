package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_device_tab")
public class Device extends Model<Device> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 设备名称 
      */
    private String devicename;

    /**
      * 设备类型 
      */
    private String devicetype;

    /**
      * 设备规格 
      */
    private String norms;

    /**
      * 设备描述 
      */
    private String description;

    /**
      * 设备状态 
      */
    private String devicestatus;

    /**
      * 租用状态 
      */
    private String rentstatus;

    /**
      * 所属工厂
 
      */
    private String owner;

}
package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_device_product_tab")
public class Capacity extends Model<Capacity> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 设备id 
      */
    private String deviceid;

    /**
      * 产品id 
      */
    private String productid;

    /**
      * 产能 
      */
    private String capacity;

}
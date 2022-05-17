package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_product_tab")
public class Product extends Model<Product> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 产品名称 
      */
    private String productname;

    /**
      * 产品类型 
      */
    private String producttype;

    /**
      * 产品描述 
      */
    private String prodcutdescription;

    /**
      * 产品规格 
      */
    private String productnorms;

    /**
      * 产品编号 
      */
    private String productcode;

}
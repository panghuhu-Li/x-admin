package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_factory_tab")
public class Factory extends Model<Factory> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 工厂名称 
      */
    private String factoryname;

    /**
      * 工厂简介 
      */
    private String introduction;

    /**
      * 工厂状态
 
      */
    private String status;

    /**
      * 管理员ID 
      */
    private String userid;



}
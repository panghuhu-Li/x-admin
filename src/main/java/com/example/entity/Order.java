package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_order_tab")
public class Order extends Model<Order> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 地址 
      */
    private String address;

    /**
      * 关联 
      */
    private String contact;

    /**
      * 截止日期 
      */
    private String deaddate;

    /**
      * 交付日期 
      */
    private String deliverdate;

    /**
      * 所属工厂 
      */
    private String factoryid;

    /**
      * 订单编号 
      */
    private String orderno;

    /**
      * 订单数量 
      */
    private String ordernum;

    /**
      * 订单状态 
      */
    private String orderstatus;

    /**
      * 产品ID 
      */
    private String productid;

    /**
      * 账单 
      */
    private String receipt;

    /**
      * 用户ID 
      */
    private String userid;

}
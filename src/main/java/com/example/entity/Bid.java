package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("module_bid_tab")
public class Bid extends Model<Bid> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 订单编号 
      */
    private String orderid;

    /**
      * 投标工厂 
      */
    private String factoryid;

    /**
      * 出价 
      */
    private String bidprice;

    /**
      * 竞标状态 
      */
    private String bidstatus;

}
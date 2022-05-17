package com.example.service;

import com.example.entity.Order;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.OrderMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService extends ServiceImpl<OrderMapper, Order> {

    @Resource
    private OrderMapper orderMapper;

    public Order getOrderByNo(String orderNo){
        for(Order order:list()){
            if(order.getOrderno().equals(orderNo))
                return order;
        }
        return null;
    }

    public List<Order> getDealerOrderList(String dealerId){
        List<Order> list = new ArrayList<>();
        for(Order order:list()){
            if(order.getUserid().equals(dealerId)){
                list.add(order);
            }
        }
        return list;
    }

}

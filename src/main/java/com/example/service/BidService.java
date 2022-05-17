package com.example.service;

import com.example.entity.Bid;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.BidMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BidService extends ServiceImpl<BidMapper, Bid> {

    @Resource
    private BidMapper bidMapper;

    public List<Bid> getBidListOfOrder(String orderNo){
        List<Bid> list = new ArrayList<>();
        for(Bid bid:list()){
            if(bid.getOrderid().equals(orderNo))
                list.add(bid);
        }
        return list;
    }

    public Bid getBidByOrderNoAndFactoryName(String orderNo, String factoryName){
        for(Bid bid:list()){
            if(bid.getOrderid().equals(orderNo)&&bid.getFactoryid().equals(factoryName))
                return bid;
        }
        return null;
    }
}

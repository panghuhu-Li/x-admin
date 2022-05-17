package com.example.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.Result;
import com.example.entity.Device;
import com.example.entity.Factory;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.FactoryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FactoryService extends ServiceImpl<FactoryMapper, Factory> {

    @Resource
    private FactoryMapper factoryMapper;

    public Factory getFactoryByUserId(String userid){
        List<Factory> list = list();
        for(Factory f:list){
            if(f.getUserid().equals(userid)){
                return f;
            }
        }
        return null;
    }

}

package com.example.service;

import com.example.entity.Capacity;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.CapacityMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CapacityService extends ServiceImpl<CapacityMapper, Capacity> {

    @Resource
    private CapacityMapper capacityMapper;

}

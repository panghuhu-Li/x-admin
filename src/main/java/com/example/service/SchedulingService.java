package com.example.service;

import com.example.entity.Scheduling;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.SchedulingMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SchedulingService extends ServiceImpl<SchedulingMapper, Scheduling> {

    @Resource
    private SchedulingMapper schedulingMapper;

}

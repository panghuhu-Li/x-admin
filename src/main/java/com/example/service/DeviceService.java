package com.example.service;

import com.example.entity.Device;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.DeviceMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DeviceService extends ServiceImpl<DeviceMapper, Device> {

    @Resource
    private DeviceMapper deviceMapper;

    public Device getDeviceByName(String deviceName){
        for(Device device:list()){
            if(device.getDevicename().equals(deviceName))
                return device;
        }
        return null;
    }
}

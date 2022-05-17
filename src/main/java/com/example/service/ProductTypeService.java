package com.example.service;

import com.example.entity.ProductType;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.ProductTypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProductTypeService extends ServiceImpl<ProductTypeMapper, ProductType> {

    @Resource
    private ProductTypeMapper productTypeMapper;

}

package com.example.service;

import com.example.entity.Product;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.ProductMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProductService extends ServiceImpl<ProductMapper, Product> {

    @Resource
    private ProductMapper productMapper;

}

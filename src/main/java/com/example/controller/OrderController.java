package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Order;
import com.example.service.FactoryService;
import com.example.service.OrderService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.service.UserService;
import com.example.utils.CodeUtils;
import org.springframework.web.bind.annotation.*;
import com.example.exception.CustomException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;

@RestController
@RequestMapping("/api/order")
public class OrderController {
    @Resource
    private OrderService orderService;
    @Resource
    private UserService userService;
    @Resource
    private FactoryService factoryService;
    @Resource
    private HttpServletRequest request;

    public User getUser() {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            throw new CustomException("-1", "请登录");
        }
        return user;
    }

    @PostMapping
    public Result<?> save(@RequestBody Order order) {
        order.setOrderno("OC" + CodeUtils.createCode());
        order.setOrderstatus("未安排");
        order.setReceipt("无数据");
        order.setFactoryid("无数据");
        return Result.success(orderService.save(order));
    }

    @PutMapping
    public Result<?> update(@RequestBody Order order) {
        return Result.success(orderService.updateById(order));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        orderService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(orderService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(orderService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = true) String dealerId,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Order> query = Wrappers.<Order>lambdaQuery().orderByDesc(Order::getId);
        if(userService.isSuperAdmin(dealerId)){
            query.like(Order::getId, name);
        } else {
            // 不是超级管理员,只能查看自己的订单
            query.eq(Order::getUserid, dealerId).like(Order::getId, name);
        }
        return Result.success(orderService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("/available")
    public Result<?> getAvailableOrder(@RequestParam(required = false)String userId){
        String factoryName = factoryService.getFactoryByUserId(userId).getFactoryname();
        List<Order> list = new ArrayList<>();
        for(Order order:orderService.list()){
            if(order.getFactoryid().equals(factoryName)&&order.getOrderstatus().equals("竞标完成"))
                list.add(order);
        }
        return Result.success(list);
    }

    @GetMapping("/bidable")
    public Result<?> getAvailableOrderForBid(){
        List<Order> list = new ArrayList<>();
        for(Order order:orderService.list()){
            if(order.getOrderstatus().equals("未安排"))
                list.add(order);
        }
        return Result.success(list);
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Order> all = orderService.list();
        for (Order obj : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("地址", obj.getAddress());
            row.put("关联", obj.getContact());
            row.put("截止日期", obj.getDeaddate());
            row.put("交付日期", obj.getDeliverdate());
            row.put("所属工厂", obj.getFactoryid());
            row.put("ID", obj.getId());
            row.put("订单编号", obj.getOrderno());
            row.put("订单数量", obj.getOrdernum());
            row.put("订单状态", obj.getOrderstatus());
            row.put("产品ID", obj.getProductid());
            row.put("账单", obj.getReceipt());
            row.put("用户ID", obj.getUserid());

            list.add(row);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("订单信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        writer.close();
        IoUtil.close(System.out);
    }

    @GetMapping("/upload/{fileId}")
    public Result<?> upload(@PathVariable String fileId) {
        String basePath = System.getProperty("user.dir") + "/src/main/resources/static/file/";
        List<String> fileNames = FileUtil.listFileNames(basePath);
        String file = fileNames.stream().filter(name -> name.contains(fileId)).findAny().orElse("");
        List<List<Object>> lists = ExcelUtil.getReader(basePath + file).read(1);
        List<Order> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            Order obj = new Order();
            obj.setAddress((String) row.get(1));
            obj.setContact((String) row.get(2));
            obj.setDeaddate((String) row.get(3));
            obj.setDeliverdate((String) row.get(4));
            obj.setFactoryid((String) row.get(5));
            obj.setOrderno((String) row.get(6));
            obj.setOrdernum((String) row.get(7));
            obj.setOrderstatus((String) row.get(8));
            obj.setProductid((String) row.get(9));
            obj.setReceipt((String) row.get(10));
            obj.setUserid((String) row.get(11));

            saveList.add(obj);
        }
        orderService.saveBatch(saveList);
        return Result.success();
    }

}

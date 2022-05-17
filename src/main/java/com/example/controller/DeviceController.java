package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Device;
import com.example.entity.Factory;
import com.example.service.DeviceService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.service.FactoryService;
import com.example.service.UserService;
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
@RequestMapping("/api/device")
public class DeviceController {
    @Resource
    private DeviceService deviceService;
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
    public Result<?> save(@RequestBody Device device) {
        device.setDevicestatus("闲置中");
        device.setRentstatus(device.getOwner().equals("产能中心")?"未租用":"工厂设备");
        return Result.success(deviceService.save(device));
    }

    @PutMapping
    public Result<?> update(@RequestBody Device device) {
        return Result.success(deviceService.updateById(device));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        deviceService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(deviceService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(deviceService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String owner,
                                                @RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Device> query = Wrappers.<Device>lambdaQuery().orderByAsc(Device::getId);
//        for (int i = 0; i < 10; i++) {
//            System.out.println();
//        }
//        System.out.println("##  " + new Date() + "owner = " + owner);
        User user = userService.getById(owner);
        if(userService.isSuperAdmin(owner)){
            // 超级管理员
            query.like(Device::getDevicename, name);
            return Result.success(deviceService.page(new Page<>(pageNum, pageSize), query));
        }
//        System.out.println("$$$" +new Date()+"  not a sa");
        Factory factory = factoryService.getFactoryByUserId(owner);
        if(StrUtil.isNotBlank(name)){
            query.like(Device::getDevicename, name);
        }else {
            query.eq(Device::getOwner, factory.getFactoryname()).or().eq(Device::getOwner,"产能中心");
        }
        return Result.success(deviceService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("/available")
    public Result<?> getAvailableEquipment(@RequestParam(required = false)String userId){
        String factoryName = factoryService.getFactoryByUserId(userId).getFactoryname();
        List<Device> list = new ArrayList<>();
        for(Device device:deviceService.list()){
            if(device.getDevicestatus().equals("闲置中")){
                if(device.getOwner().equals("产能中心")){
                    if(device.getRentstatus().equals("已租用"))
                        list.add(device);
                }else if(device.getOwner().equals(factoryName)){
                    list.add(device);
                }
            }
        }
        return Result.success(list);
    }



    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Device> all = deviceService.list();
        for (Device obj : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("", obj.getId());
            row.put("设备名称", obj.getDevicename());
            row.put("设备类型", obj.getDevicetype());
            row.put("设备规格", obj.getNorms());
            row.put("设备描述", obj.getDescription());
            row.put("设备状态", obj.getDevicestatus());
            row.put("租用状态", obj.getRentstatus());
            row.put("所属工厂 ", obj.getOwner());

            list.add(row);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("设备信息", "UTF-8");
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
        List<Device> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            Device obj = new Device();
            obj.setDevicename((String) row.get(1));
            obj.setDevicetype((String) row.get(2));
            obj.setNorms((String) row.get(3));
            obj.setDescription((String) row.get(4));
            obj.setDevicestatus((String) row.get(5));
            obj.setRentstatus((String) row.get(6));
            obj.setOwner((String) row.get(7));

            saveList.add(obj);
        }
        deviceService.saveBatch(saveList);
        return Result.success();
    }

}

package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Device;
import com.example.entity.Order;
import com.example.entity.Scheduling;
import com.example.service.DeviceService;
import com.example.service.OrderService;
import com.example.service.SchedulingService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import com.example.exception.CustomException;
import cn.hutool.core.util.StrUtil;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.math.BigDecimal;

@RestController
@RequestMapping("/api/scheduling")
public class SchedulingController {
    @Resource
    private SchedulingService schedulingService;
    @Resource
    private OrderService orderService;
    @Resource
    private DeviceService deviceService;
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
    public Result<?> save(@RequestBody Scheduling scheduling) {
        String deviceName = scheduling.getDeviceid();
        String orderNo = scheduling.getOrderid();
        Device device = deviceService.getDeviceByName(deviceName);
        device.setDevicestatus("工作中");

        deviceService.updateById(device);
        Order order = orderService.getOrderByNo(orderNo);
        order.setOrderstatus("排产完成");
        orderService.updateById(order);
        return Result.success(schedulingService.save(scheduling));
    }

    @PutMapping
    public Result<?> update(@RequestBody Scheduling scheduling) {
        return Result.success(schedulingService.updateById(scheduling));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        schedulingService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(schedulingService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(schedulingService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Scheduling> query = Wrappers.<Scheduling>lambdaQuery().orderByDesc(Scheduling::getId);

        return Result.success(schedulingService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Scheduling> all = schedulingService.list();
        for (Scheduling obj : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("", obj.getBegindate());
            row.put("", obj.getDeviceid());
            row.put("", obj.getEnddate());
            row.put("", obj.getId());
            row.put("", obj.getOrderid());

            list.add(row);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("订单排产信息", "UTF-8");
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
        List<Scheduling> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            Scheduling obj = new Scheduling();
            obj.setBegindate((String) row.get(1));
            obj.setDeviceid((String) row.get(2));
            obj.setEnddate((String) row.get(3));
            obj.setOrderid((String) row.get(4));

            saveList.add(obj);
        }
        schedulingService.saveBatch(saveList);
        return Result.success();
    }

}

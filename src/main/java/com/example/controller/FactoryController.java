package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Factory;
import com.example.service.FactoryService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.service.UserService;
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
@RequestMapping("/api/factory")
public class FactoryController {
    @Resource
    private FactoryService factoryService;
    @Resource
    private UserService userService;

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
    public Result<?> save(@RequestBody Factory factory) {
        return Result.success(factoryService.save(factory));
    }

    @PutMapping
    public Result<?> update(@RequestBody Factory factory) {
        return Result.success(factoryService.updateById(factory));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        factoryService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(factoryService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(factoryService.list());
    }

    @GetMapping("/bidFactory")
    public Result<?> getFactoryByUserId(@RequestParam String userId){
        return Result.success(factoryService.getFactoryByUserId(userId));
    }


    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Factory> query = Wrappers.<Factory>lambdaQuery().orderByDesc(Factory::getId);
        query.like(Factory::getId, name);
        return Result.success(factoryService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Factory> all = factoryService.list();
        for (Factory obj : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("工厂名称", obj.getFactoryname());
            row.put("ID", obj.getId());
            row.put("工厂简介", obj.getIntroduction());
            row.put("工厂状态 ", obj.getStatus());
            row.put("管理员ID", obj.getUserid());

            list.add(row);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("云工厂信息", "UTF-8");
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
        List<Factory> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            Factory obj = new Factory();
            obj.setFactoryname((String) row.get(1));
            obj.setIntroduction((String) row.get(2));
            obj.setStatus((String) row.get(3));
            obj.setUserid((String) row.get(4));

            saveList.add(obj);
        }
        factoryService.saveBatch(saveList);
        return Result.success();
    }

}

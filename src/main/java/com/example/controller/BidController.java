package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Bid;
import com.example.entity.Order;
import com.example.service.BidService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.service.FactoryService;
import com.example.service.OrderService;
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
@RequestMapping("/api/bid")
public class BidController {
    @Resource
    private BidService bidService;
    @Resource
    private UserService userService;
    @Resource
    private OrderService orderService;
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
    public Result<?> save(@RequestBody Bid bid) {
        bid.setFactoryid("云工厂2");
        bid.setBidstatus("等待选标");
        return Result.success(bidService.save(bid));
    }

    @PutMapping
    public Result<?> update(@RequestBody Bid bid) {
        return Result.success(bidService.updateById(bid));
    }

    @PutMapping("/chooseBid")
    public Result<?> chooseBid(@RequestParam String orderNo, @RequestParam String factoryName){
        Bid bid = bidService.getBidByOrderNoAndFactoryName(orderNo,factoryName);
        for (Bid b : bidService.getBidListOfOrder(bid.getOrderid())) {
            if (!b.getId().equals(bid.getId())) {
                b.setBidstatus("竞标失败");
                bidService.updateById(b);
            }
        }
        Order o = orderService.getOrderByNo(bid.getOrderid());
        o.setOrderstatus("竞标完成");
        o.setFactoryid(bid.getFactoryid());
        o.setReceipt(bid.getBidprice());
        orderService.updateById(o);
        bid.setBidstatus("竞标成功");
        return Result.success(bidService.updateById(bid));
    }


    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        bidService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(bidService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(bidService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                              @RequestParam String userId,
                              @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                              @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Bid> query = Wrappers.<Bid>lambdaQuery().orderByAsc(Bid::getId);
        if(userService.isSuperAdmin(userId)){
            // 超级管理员查看所有数据
            query.like(Bid::getId, name);
            return Result.success(bidService.page(new Page<>(pageNum, pageSize), query));
        }
        // 云工厂管理员查看自己发出的所有投标信息
        String factoryName = factoryService.getFactoryByUserId(userId).getFactoryname();
        query.eq(Bid::getFactoryid, factoryName);
        if (StrUtil.isNotBlank(name)) {
            query.like(Bid::getId, name);
        }
        return Result.success(bidService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("/available")
    public Result<?> getBidsByOrderNo(@RequestParam String orderNo){
        return Result.success(bidService.getBidListOfOrder(orderNo));
    }



    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Bid> all = bidService.list();
        for (Bid obj : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("", obj.getId());
            row.put("订单编号", obj.getOrderid());
            row.put("投标工厂", obj.getFactoryid());
            row.put("竞标价格", obj.getBidprice());
            row.put("竞标状态", obj.getBidstatus());

            list.add(row);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("竞标信息", "UTF-8");
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
        List<Bid> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            Bid obj = new Bid();
            obj.setOrderid((String) row.get(1));
            obj.setFactoryid((String) row.get(2));
            obj.setBidprice((String) row.get(3));
            obj.setBidstatus((String) row.get(4));

            saveList.add(obj);
        }
        bidService.saveBatch(saveList);
        return Result.success();
    }

}

package com.example.controller;

import com.example.entity.Factory;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.Result;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.example.service.FactoryService;
import com.example.service.LogService;
import com.example.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/api/user")
public class UserController {
    public static final ConcurrentHashMap<String, User> MAP = new ConcurrentHashMap<>();

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


    /**
     * 登录
     *
     * @param user
     * @param request
     * @return
     */
    @PostMapping("/login")
    public Result<User> login(@RequestBody User user, HttpServletRequest request) {
        User res = userService.login(user);
        request.getSession().setAttribute("user", res);
        MAP.put(res.getUsername(), res);

        return Result.success(res);
    }

    // 注册
    @PostMapping("/register")
    public Result<User> register(@RequestBody String temp, HttpServletRequest request) {
        String[] arr = temp.split("%");
        Map<String, String> userMap = new HashMap<>();
        for (Map.Entry<String,Object> entry : (JSONObject.parseObject(arr[0])).entrySet()) {
            userMap.put(entry.getKey(), (String) entry.getValue());
        }
        User user = new User();
        user.setUsername(userMap.get("username"));
        user.setPassword(userMap.get("password"));
        user.setPhone(userMap.get("phone"));
        user.setEmail(userMap.get("email"));

        if(arr[0].length()<temp.length()){
            Map<String, String> factoryMap = new HashMap<>();
            user.setRole(CollUtil.newArrayList(2L, 3L));
            user.setNickName("云工厂管理员");
            user = userService.register(user);
            for(Map.Entry<String, Object> entry:(JSONObject.parseObject(arr[1])).entrySet()){
                factoryMap.put(entry.getKey(),(String) entry.getValue());
            }
            Factory factory = new Factory();
            factory.setFactoryname(factoryMap.get("name"));
            factory.setIntroduction(factoryMap.get("description"));
            factory.setStatus("运行");
            factory.setUserid(String.valueOf(user.getId()));
            factoryService.save(factory);
        } else {
            user.setRole(CollUtil.newArrayList(4L));
            user.setNickName("经销商");
            user = userService.register(user);
        }
        return Result.success(user);
    }

    @GetMapping("/logout")
    public Result<?> logout(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            request.getSession().removeAttribute("user");
            MAP.remove(user.getUsername());
        }
        return Result.success();
    }

    @GetMapping("/online")
    public Result<Collection<User>> online(HttpServletRequest request) {
        return Result.success(MAP.values());
    }

    @GetMapping("/session")
    public Result<User> session() {
        return Result.success(getUser());
    }

    @PostMapping
    public Result<?> save(@RequestBody User user) {
        if (user.getPassword() == null) {
            user.setPassword("123456");
        }
        return Result.success(userService.save(user));
    }

    @PutMapping
    public Result<?> update(@RequestBody User user) {
        return Result.success(userService.updateById(user));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        User user = userService.getById(id);

        userService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<User> findById(@PathVariable Long id) {
        return Result.success(userService.getById(id));
    }

    @GetMapping("/detail/{username}")
    public Result<User> findByUsername(@PathVariable String username) {
        return Result.success(userService.getbyUsername(username));
    }

    @GetMapping
    public Result<List<User>> findAll() {
        return Result.success(userService.list( Wrappers.<User>lambdaQuery().ne(User::getUsername, "admin")));
    }

    @GetMapping("/page")
    public Result<IPage<User>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                        @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                        @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery().ne(User::getUsername, "admin").like(User::getUsername, name).orderByDesc(User::getId);
        return Result.success(userService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<User> all = userService.list();
        for (User user : all) {
            Map<String, Object> row1 = new LinkedHashMap<>();
            row1.put("名称", user.getUsername());
            row1.put("手机", user.getPhone());
            row1.put("邮箱", user.getEmail());
            list.add(row1);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息", "UTF-8");
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
        List<User> saveList = new ArrayList<>();
        for (List<Object> row : lists) {
            User user = new User();
            user.setUsername((String) row.get(0));
            user.setNickName((String) row.get(1));
            user.setEmail((String) row.get(2));
            user.setPhone((String) row.get(3));
            saveList.add(user);
        }
        userService.saveBatch(saveList);
        return Result.success();
    }

}

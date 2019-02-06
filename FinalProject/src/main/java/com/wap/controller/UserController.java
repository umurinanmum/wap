package com.wap.controller;

import com.wap.dto.TaskDto;
import com.wap.dto.UserDto;
import com.wap.helper.JsonHelper;
import com.wap.helper.StringHelper;
import com.wap.service.TaskService;
import com.wap.service.UserService;
import lombok.var;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/User")
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idUserStr = req.getParameter("id");
        UserService userService = new UserService();
        if (!StringHelper.isNullOrEmpty(idUserStr)) {
            int idUser = 0;
            try {
                idUser = Integer.parseInt(idUserStr);
            } catch (Exception e) {
                return;
            }
            var result = userService.getById(idUser);
            resp.getWriter().write(result.asJson());
        } else {
            var result = userService.getAll();
            resp.getWriter().write(result.asJson());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String json = req.getParameter("source");
        try {
            UserDto userDto = (UserDto) JsonHelper.fromJson(json, UserDto.class);
            UserService userService = new UserService();
            var result = userService.save(userDto);
            resp.getWriter().write(result.asJson());
        } catch (Exception e) {

        }
    }
}

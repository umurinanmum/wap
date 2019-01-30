package com.wap.controller;

import com.wap.service.UserService;
import lombok.var;

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
        int idUser = 0;
        try {
            idUser = Integer.parseInt(idUserStr);
        } catch (Exception e) {
            return;
        }

        UserService userService = new UserService();
        var result = userService.getById(idUser);
        resp.getWriter().write(result.asJson());
    }
}

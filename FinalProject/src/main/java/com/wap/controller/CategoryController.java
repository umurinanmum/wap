package com.wap.controller;

import com.wap.helper.JsonHelper;
import com.wap.service.CategoryService;
import lombok.var;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Category")
public class CategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CategoryService categoryService = new CategoryService();
        var result = categoryService.getAll();
        resp.getWriter().write(result.asJson());

    }
}

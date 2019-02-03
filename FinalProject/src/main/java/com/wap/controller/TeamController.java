package com.wap.controller;

import com.wap.service.TeamService;
import lombok.var;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Team")
public class TeamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TeamService teamService = new TeamService();
        var result = teamService.getAll();
        resp.getWriter().write(result.asJson());
    }
}

package com.wap.controller;

import com.wap.helper.StringHelper;
import com.wap.service.TeamService;
import lombok.var;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Team")
public class TeamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idTeamStr = req.getParameter("idTeam");
        TeamService teamService = new TeamService();
        if (StringHelper.isNullOrEmpty(idTeamStr)) {
            var result = teamService.getAll();
            resp.getWriter().write(result.asJson());
        } else {
            //get all tasks in the team
            int idTeam = 0;
            try {
                idTeam = Integer.parseInt(idTeamStr);
            } catch (Exception e) {

            }
            if (idTeam != 0) {
                var result = teamService.getAllTaskInTheTeam(idTeam);
                resp.getWriter().write(result.asJson());
            }
        }

    }


}

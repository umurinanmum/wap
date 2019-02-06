package com.wap.controller;

import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import com.wap.helper.StringHelper;
import com.wap.model.WapResult;
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String subAction = req.getParameter("subAction");
        String idTeamStr = req.getParameter("idTeam");
        TeamService teamService = new TeamService();

        /*search team with some parameters*/
        if(!StringHelper.isNullOrEmpty(subAction)){
            if(subAction.equals("Search")) {
                String teamSearchByName = req.getParameter("teamSearchByName");
                String teamSortBy = req.getParameter("teamSortBy");
                String teamSortOrder = req.getParameter("teamSortOrder");
                var result = teamService.getAllSearch(teamSearchByName, teamSortBy, teamSortOrder);
                resp.getWriter().write(result.asJson());
            }
        }
        else {
            if (StringHelper.isNullOrEmpty(idTeamStr)) {
                var result = teamService.getAll();
                resp.getWriter().write(result.asJson());
            }
            else{
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String idTeamStr = req.getParameter("idTeam");
            String idUserStr = req.getParameter("idUser");
            int idTeam = 0;
            int idUser = 0;
            try {
                idTeam = Integer.parseInt(idTeamStr);
                idUser = Integer.parseInt(idUserStr);
            } catch (Exception e) {
                var result = new WapResult();
                result.setStatusCode(StatusCode.INVALID_PARAMETER);
                resp.getWriter().write(result.asJson());
                return;
            }

            if (idTeam != 0 && idUser != 0) {
                TeamService teamService = new TeamService();
                var result = teamService.joinTheTeam(idTeam, idUser);
                resp.getWriter().write(result.asJson());
            }
    }
}

package com.wap.service;

import com.wap.dao.TeamDao;
import com.wap.dto.TeamDto;
import com.wap.model.WapResultData;

import java.util.ArrayList;

public class TeamService {
    private TeamDao teamDao = new TeamDao();

    public WapResultData<ArrayList<TeamDto>> getAll() {
        return teamDao.getAll();
    }
}

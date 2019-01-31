package com.wap.service;

import com.wap.dao.UserDao;
import com.wap.dto.UserDto;
import com.wap.model.WapResult;
import com.wap.model.WapResultData;

public class UserService {

    private UserDao userDao = new UserDao();

    public WapResult joinTheTeam(int userId, int teamId){
        return userDao.joinTheTeam(userId,teamId);
    }

    public WapResultData<UserDto> getById(int id) {
        return userDao.getById(id);
    }
}

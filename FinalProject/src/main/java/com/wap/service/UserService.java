package com.wap.service;

import com.wap.dao.UserDao;
import com.wap.dto.UserDto;
import com.wap.model.WapResultData;

public class UserService {

    private UserDao userDao = new UserDao();

    public WapResultData<UserDto> getById(int id) {
        return userDao.getById(id);
    }
}

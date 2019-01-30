package com.wap.service;

import com.wap.dao.CategoryDao;
import com.wap.dto.CategoryDto;
import com.wap.model.WapResultData;

import java.util.ArrayList;

public class CategoryService {
    private CategoryDao categoryDao = new CategoryDao();

    public WapResultData<ArrayList<CategoryDto>> getAll() {
        return categoryDao.getAll();
    }
}

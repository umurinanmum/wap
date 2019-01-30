package com.wap.dto;

import com.wap.dto.interfaces.AbstractDto;
import com.wap.entity.CategoryEntity;
import lombok.Getter;
import lombok.Setter;

public class CategoryDto extends AbstractDto<CategoryEntity, CategoryDto> {

    public CategoryDto() {
        super.setDtoClass(CategoryDto.class);
        super.setEntityClass(CategoryEntity.class);
    }

    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    private String name;
}

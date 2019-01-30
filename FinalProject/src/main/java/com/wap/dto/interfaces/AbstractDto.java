package com.wap.dto.interfaces;

import com.wap.entity.interfaces.IEntity;
import org.modelmapper.ModelMapper;

public abstract class AbstractDto<TEntity extends IEntity, TDto extends AbstractDto> {

    private Class<TDto> dtoClass;
    private Class<TEntity> entityClass;


    private ModelMapper modelMapper = new ModelMapper();

    public TDto convertToDto(TEntity source) {
        TDto dto = modelMapper.map(source, dtoClass);
        return dto;
    }

    public TEntity convertToEntity(TDto source) {
        TEntity entity = modelMapper.map(source, entityClass);
        return entity;
    }

    public void setDtoClass(Class<TDto> dtoClass) {
        this.dtoClass = dtoClass;
    }

    public void setEntityClass(Class<TEntity> entityClass) {
        this.entityClass = entityClass;
    }
}

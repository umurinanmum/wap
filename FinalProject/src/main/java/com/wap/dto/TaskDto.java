package com.wap.dto;

import com.wap.dto.interfaces.AbstractDto;
import com.wap.entity.TaskEntity;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.ArrayList;


public class TaskDto extends AbstractDto<TaskEntity,TaskDto> {

    public TaskDto(){
        super.setDtoClass(TaskDto.class);
        super.setEntityClass(TaskEntity.class);
    }

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private Date requiredBy;

    @Getter
    @Setter
    private CategoryDto category;

    @Getter
    @Setter
    private int priority;

    @Getter
    @Setter
    private UserDto user;

    @Getter
    @Setter
    private boolean isCompleted;

    @Getter
    @Setter
    public ArrayList<NoteDto> noteList;
}

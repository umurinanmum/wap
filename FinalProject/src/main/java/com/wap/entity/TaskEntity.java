package com.wap.entity;


import com.wap.entity.interfaces.IEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class TaskEntity extends IEntity {

    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private Date requiredBy;

    @Getter
    @Setter
    private CategoryEntity category;

    @Getter
    @Setter
    private int priority;

    @Getter
    @Setter
    private UserEntity user;

    @Getter
    @Setter
    private boolean isCompleted;
}

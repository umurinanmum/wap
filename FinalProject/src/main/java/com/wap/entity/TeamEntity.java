package com.wap.entity;

import com.wap.entity.interfaces.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;

public class TeamEntity extends AbstractEntity {
    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private ArrayList<UserEntity> userList;
}

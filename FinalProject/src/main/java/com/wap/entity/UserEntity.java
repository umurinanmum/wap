package com.wap.entity;

import com.wap.entity.interfaces.IEntity;
import lombok.Getter;
import lombok.Setter;

public class UserEntity extends IEntity {

    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String lastname;

    @Getter
    @Setter
    private String username;

    @Getter
    @Setter
    private String password;

}

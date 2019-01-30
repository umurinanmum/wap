package com.wap.entity;

import com.wap.entity.interfaces.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

public class UserEntity extends AbstractEntity {

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

    @Getter
    @Setter
    private String mail;

    @Getter
    @Setter
    private String phone;

    @Getter
    @Setter
    private String lat;

    @Getter
    @Setter
    private String longg;

    @Getter
    @Setter
    private TeamEntity team;

}

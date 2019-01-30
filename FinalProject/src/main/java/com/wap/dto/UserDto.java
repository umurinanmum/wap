package com.wap.dto;

import com.wap.dto.interfaces.AbstractDto;
import com.wap.entity.UserEntity;
import lombok.Getter;
import lombok.Setter;

public class UserDto extends AbstractDto<UserEntity, UserDto> {

    public UserDto() {
        super.setDtoClass(UserDto.class);
        super.setEntityClass(UserEntity.class);
    }

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
    private TeamDto team;
}

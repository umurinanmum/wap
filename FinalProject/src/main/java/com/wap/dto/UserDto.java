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

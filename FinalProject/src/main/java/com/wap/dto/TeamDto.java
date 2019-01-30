package com.wap.dto;

import com.wap.dto.interfaces.AbstractDto;
import com.wap.entity.TeamEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;

public class TeamDto extends AbstractDto<TeamEntity, TeamDto> {
    public TeamDto() {
        super.setDtoClass(TeamDto.class);
        super.setEntityClass(TeamEntity.class);
    }

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private ArrayList<UserDto> userList;
}

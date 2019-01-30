package com.wap.dto;

import com.wap.dto.interfaces.AbstractDto;
import com.wap.entity.NoteEntity;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

public class NoteDto extends AbstractDto<NoteEntity, NoteDto> {
    public NoteDto() {
        super.setDtoClass(NoteDto.class);
        super.setEntityClass(NoteEntity.class);
    }

    @Getter
    @Setter
    private String note;

    @Getter
    @Setter
    private Date date;

    @Getter
    @Setter
    private TaskDto taskDto;

}

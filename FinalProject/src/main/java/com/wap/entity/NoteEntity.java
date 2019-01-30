package com.wap.entity;

import com.wap.entity.interfaces.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

public class NoteEntity extends AbstractEntity {

    @Getter
    @Setter
    private String note;

    @Getter
    @Setter
    private Date date;
}

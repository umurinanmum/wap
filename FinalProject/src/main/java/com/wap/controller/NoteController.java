package com.wap.controller;

import com.wap.dto.NoteDto;
import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import com.wap.helper.StringHelper;
import com.wap.model.WapResultData;
import com.wap.service.NoteService;
import lombok.var;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Note")
public class NoteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String idTaskStr = req.getParameter("idTask");
        if (StringHelper.isNullOrEmpty(idTaskStr)) {
            var result = new WapResultData<ArrayList<NoteDto>>();
            result.setStatusCode(StatusCode.MISSING_PARAMETER);
            resp.getWriter().write(result.asJson());
            return;
        }

        int idTask = 0;
        try {
            idTask = Integer.parseInt(idTaskStr);
        } catch (Exception e) {
            var result = new WapResultData<ArrayList<NoteDto>>();
            result.setStatusCode(StatusCode.INVALID_PARAMETER);
            resp.getWriter().write(result.asJson());
            return;
        }

        NoteService noteService = new NoteService();
        var result = noteService.getNotesByIdTask(idTask);
        resp.getWriter().write(result.asJson());
    }
}

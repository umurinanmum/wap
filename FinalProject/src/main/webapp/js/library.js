$(document).ready(function () {

    $.get("Category", function (data, status) {
        var res = JSON.parse(data);
        if (res.statusCode === "SUCCESS") {
            for (var i = 0; i < res.data.length; i++) {
                $('#categorySelectNew option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                $('#categorySelectUpdate option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
            }
        }
    });

    $.get("User", function (data, status) {
        var res = JSON.parse(data);
        if (res.statusCode === "SUCCESS") {
            for (var i = 0; i < res.data.length; i++) {
                $('#usersSelectNew option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                $('#usersSelectUpdate option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                $('#userSelectForFilter option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
            }
        }
    });

    $("#userSelectForFilter").change(function () {
        let idUser = this.value;
        if (idUser === "sel") {
            $.get("Task", function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    $("#taskListTableBody").empty();
                    generateTaskTable(res);
                }
            });
        } else {
            $.get("Task?idUser=" + idUser, function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    $("#taskListTableBody").empty();
                    generateTaskTable(res);
                }
            });
        }
    });


    $.get("Task", function (data, status) {
        var res = JSON.parse(data);
        if (res.statusCode === "SUCCESS") {
            generateTaskTable(res);
        }
    });

    function generateTaskTable(res) {
        for (let i = 0; i < res.data.length; i++) {
            $('#taskListTable tbody').append('<tr><td>' + (i + 1) + '</td><td>'
                + res.data[i].name
                + '</td><td>'
                + getDate(res.data[i].requiredBy)
                + '</td><td>'
                + res.data[i].category.name
                + '</td><td>'
                + res.data[i].priority
                + '</td><td>'
                + res.data[i].user.id
                + '</td><td>'
                + res.data[i].user.name + " " + res.data[i].user.lastname
                + '</td><td>'
                + res.data[i].completed
                + '</td><td><button class="btn btn-primary" id="editButton' + i + '"lang="' + res.data[i].id + '" data-toggle="modal" data-target="#updateTaskModal" data-backdrop="false"><span class="glyphicon glyphicon-edit"/></button>' +
                '<button class="btn btn-info" id="noteButton' + i + '"lang="' + res.data[i].id + '"><span class="glyphicon glyphicon-comment"></span></button>' +
                '<button type="button" class="btn btn-success" id="addNoteButton' + i + '"lang="' + res.data[i].id + '" data-toggle="modal" data-target="#addEditNoteModal" data-backdrop="false"><span class="glyphicon glyphicon-share"></span></button>' +
                '<button class="btn btn-danger" id="deleteButton' + i + '"lang="' + res.data[i].id + '"><span class="glyphicon glyphicon-remove-sign"></span></button> </td></tr>'
            );
            var deleteButtonId = "deleteButton" + i;
            $("#" + deleteButtonId).click(function () {
                let id = parseInt(this.lang);
                $.ajax({
                    url: 'Task?id=' + id,
                    method: 'DELETE',
                    contentType: 'application/json',
                    success: function (data) {
                        let res = JSON.parse(data);
                        if (res.statusCode === "SUCCESS") {
                            $("#taskListTable").remove();
                            location.reload();
                        } else {
                            //$.toast('Task can not be deleted');
                        }
                    },
                    error: function (request, msg, error) {
                        // handle failure
                    }
                });
            });


            $("#addTask").click(function () {
                $("input[name='nameNewTask']").val("");
                $("input[name='dateNewTask']").val(getDate((new Date()).getTime()));
                $("select[name='categoryNewTask']").val("sel");
                $("input[name='priorityNewTask']").val("");
                $("select[name='usersNewTask']").val("sel");
                $("input[name='completedNewTask']").attr("checked", false);
            });

            var editButtonId = "editButton" + i;
            $("#" + editButtonId).click(function () {
                $("#editFields").show();
                let id = parseInt(this.lang);
                $("#idTask").val(id);
                $.ajax({
                    url: 'Task?id=' + id,
                    method: 'GET',
                    contentType: 'application/json',
                    success: function (data) {
                        let res = JSON.parse(data);
                        if (res.statusCode === "SUCCESS") {
                            $("input[name='name']").val(res.data.name);
                            $("input[name='date']").val(getDate(res.data.requiredBy));
                            $("select[name='category']").val(res.data.category.id);
                            $("input[name='priority']").val(res.data.priority);
                            $("select[name='users']").val(res.data.user.id);
                            $("input[name='completedUpdate']").attr("checked", res.data.completed);
                        }
                    },
                    error: function (request, msg, error) {
                        // handle failure
                    }
                });
            });

            var noteButtonId = "notesButton" + i;
            $("#" + noteButtonId).click(function () {
                $("#notesDiv").show();
                let id = parseInt(this.lang);
                $.ajax({
                    url: 'Note?idTask=' + id,
                    method: 'get',
                    contentType: 'application/json',
                    success: function (result) {
                        var res = JSON.parse(result);
                        console.log(res);
                        for (var j = 0; j < res.data.length; j++) {
                            $('#noteListTable tbody').append('<tr><td>' + (j + 1) + '</td><td>'
                                + res.data[j].note
                                + '</td><td>'
                                + getDate(res.data[j].date)
                                + '</td></tr>'
                            );
                        }
                    },
                    error: function (request, msg, error) {
                        // handle failure
                    }
                });
            });
        }
    }

    function getDate(dateVal) {
        var date = new Date(dateVal);
        var day = ("0" + date.getDate()).slice(-2);
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        return date.getFullYear() + "-" + (month) + "-" + (day);
    }


    $('#newTaskSaveButton').click(function () {
        var taskDto = {
            "name": $("input[name='nameNewTask']").val(),
            "requiredBy": $("input[name='dateNewTask']").val(),
            "category": {
                "id": $("select[name='categoryNewTask']").val()
            },
            "priority": $("input[name='priorityNewTask']").val(),
            "user": {
                "id": $("select[name='usersNewTask']").val()
            },
            "completed": document.getElementById('completedNewTask').checked
        };

        //send to server
        $.ajax({
            type: 'post',
            url: 'Task',
            dataType: 'JSON',
            data: {
                source: JSON.stringify(taskDto)
            },
            success: function (data) {
                if (data.statusCode === "SUCCESS") {
                    location.reload();
                }
            },
            error: function (data) {
                console.log(data);
            }
        });
    });

    $('#updateTaskSaveButton').click(function () {
        let idTask = $('#idTask').val();
        var taskDto = {
            "id": idTask,
            "name": $("input[name='name']").val(),
            "requiredBy": $("input[name='date']").val(),
            "category": {
                "id": $("select[name='category']").val()
            },
            "priority": $("input[name='priority']").val(),
            "user": {
                "id": $("select[name='users']").val()
            },
            "completed": document.getElementById('completedUpdate').checked
        };

        //send to server
        $.ajax({
            type: 'post',
            url: 'Task',
            dataType: 'JSON',
            data: {
                source: JSON.stringify(taskDto)
            },
            success: function (data) {
                if (data.statusCode === "SUCCESS") {
                    location.reload();
                }
            },
            error: function (data) {
                console.log(data);
            }
        });
    });

});



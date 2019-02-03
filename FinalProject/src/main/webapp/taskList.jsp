<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

    <script>

        $(document).ready(function () {

            $.get("Category", function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (var i = 0; i < res.data.length; i++) {
                        $('#categorySelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    }
                }
            });

            $.get("User", function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (var i = 0; i < res.data.length; i++) {
                        $('#usersSelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
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
                        + '</td><td><input type="button" class="btn btn-danger" value="Delete" id="deleteButton' + i + '"alt="' + res.data[i].id + '"/>' +
                        '<input type="button" class="btn btn-warning" value="Edit" id="editButton' + i + '"alt="' + res.data[i].id + '"/>' +
                        '<input type="button" class="btn btn-primary" value="Notes" id="notesButton' + i + '"alt="' + res.data[i].id + '"/> </td></tr>'
                    );
                    var deleteButtonId = "deleteButton" + i;
                    $("#" + deleteButtonId).click(function () {
                        let id = parseInt(this.alt);
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

                    var editButtonId = "editButton" + i;
                    $("#" + editButtonId).click(function () {
                        $("#editFields").show();
                        let id = parseInt(this.alt);
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
                                    $("input[name='completed']").attr("checked", res.data.completed);
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
                        let id = parseInt(this.alt);
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

            $('#updateButton').click(function () {
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
                    }
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

                        }
                    },
                    error: function (data) {
                        console.log(data);
                    }
                });
            });

        });


    </script>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                Filter By :
            </div>
            <div class="col-md-2">
                <select name="userSelectForFilter" id="userSelectForFilter">
                    <option value="sel">Please Select</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="table-responsive">
            <table class="table table-dark" id="taskListTable">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Due</th>
                    <th>Category</th>
                    <th>Priority</th>
                    <th>User ID</th>
                    <th>User</th>
                    <th>Completed</th>
                </tr>
                </thead>
                <tbody id="taskListTableBody">

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8" id="editFields" style="display: none">
            <form>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-5">
                            <p> Name : </p>
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="name"/>
                        </div>
                        <div class="col-md-3" style="display: none">
                            <input type="text" name="id" id="idTask"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <p> Required By : </p>
                        </div>
                        <div class="col-md-3">
                            <input type="date" name="date"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <p> Category : </p>
                        </div>
                        <div class="col-md-3">
                            <select name="category" id="categorySelect">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <p> Priority : </p>
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="priority"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <p> User : </p>
                        </div>
                        <div class="col-md-3">
                            <select name="users" id="usersSelect">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <p> Completed : </p>
                        </div>
                        <div class="col-md-3">
                            <input type="checkbox" name="completed"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <input type="reset" value="Reset" class="btn btn-secondary"/>
                        </div>
                        <div class="col-md-3">
                            <input type="button" value="Update" id="updateButton" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4" id="notesDiv" style="display: none">
            <div class="table-responsive">
                <table class="table table-dark" id="noteListTable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Note</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

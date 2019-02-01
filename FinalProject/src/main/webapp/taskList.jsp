<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

    <script>

        $(document).ready(function () {

            /*  $.ajax({
                  type: 'get',
                  url: 'Task',
                  dataType: 'JSON',
                  success: function (data) {
                      console.log(data);
                  },
                  error: function (data) {
                      console.log(data);
                  }
              });*/

            $.get("Task", function (data, status) {
                debugger;
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (let i = 0; i < res.data.length; i++) {
                        $('#taskListTable tr:last').after('<tr><td>' + (i + 1) + '</td><td>'
                            + res.data[i].name
                            + '</td><td>'
                            + res.data[i].requiredBy
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
                        var delteteButtonId = "deleteButton" + i;
                        $("#" + delteteButtonId).click(function () {
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
                            let id = parseInt(this.alt);
                            debugger;
                            $.ajax({
                                url: 'Task?id='+id,
                                method: 'GET',
                                contentType: 'application/json',
                                success: function (data) {
                                    let res = JSON.parse(data);
                                    $( "input[name='name']" ).val(res.name);
                                    $( "input[name='date']" ).val(res.date);
                                    $( "input[name='category']" ).val(res.name);
                                    $( "input[name='priority']" ).val(res.name);
                                    $( "input[name='usersSelect']" ).val(res.usersSelect);
                                    $( "input[name='completed']" ).val(res.usersSelect);
                                },
                                error: function (request, msg, error) {
                                    // handle failure
                                }
                            });
                        });

                        var noteButtonId = "noteButton" + i;
                        $("#" + noteButtonId).click(function () {
                            let id = parseInt(this.alt);
                            let data = {id: id};
                            debugger;
                            $.ajax({
                                url: 'Task?id=' + id,
                                method: 'DELETE',
                                data: data,
                                contentType: 'application/json',
                                success: function (result) {
                                    alert("Deleted");
                                },
                                error: function (request, msg, error) {
                                    // handle failure
                                }
                            });
                        });
                    }


                    $("#editButton").click(function () {
                        let id = Integer.parseInt(this.alt);
                    });

                    $("#notesButton").click(function () {
                        let id = Integer.parseInt(this.alt);
                    });


                }
            });


        });


    </script>

</head>
<body>

<div class="container">
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
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-3">
                        <p> Name : </p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="name"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <p> Required By : </p>
                    </div>
                    <div class="col-md-3">
                        <input type="date" name="date"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <p> Category : </p>
                    </div>
                    <div class="col-md-3">
                        <select name="category" id="categorySelect">
                            <option value="sel">Please Select</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <p> Priority : </p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="priority"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <p> User : </p>
                    </div>
                    <div class="col-md-3">
                        <select name="users" id="usersSelect">
                            <option value="sel">Please Select</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <p> Completed : </p>
                    </div>
                    <div class="col-md-3">
                        <input type="checkbox" name="completed"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <input type="reset" value="Reset"/>
                    </div>
                    <div class="col-md-3">
                        <input type="submit" value="Save"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

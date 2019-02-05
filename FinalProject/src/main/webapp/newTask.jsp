<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $.get("User", function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (var i = 0; i < res.data.length; i++) {
                        $('#usersSelectNew option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    }
                }
            });

            $.get("Category", function (data, status) {
                console.log(data);
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (var i = 0; i < res.data.length; i++) {
                        $('#categorySelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    }
                }
            });

            $('#saveButton').click(function () {
                var taskDto = {
                    "name": $("input[name='name']").val(),
                    "requiredBy": $("input[name='date']").val(),
                    "category": {
                        "id": $("select[name='category']").val()
                    },
                    "priority": $("input[name='priority']").val(),
                    "user": {
                        "id": $("select[name='users']").val()
                    },
                    "completed": $("#completed").val() === "on" ? true : false
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

<form>
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
                <input type="checkbox" name="completed" id="completed"/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <input type="reset" value="Reset" class="btn btn-secondary"/>
            </div>
            <div class="col-md-3">
                <input type="button" class="btn btn-primary" value="Save" id="saveButton"/>
            </div>
        </div>
    </div>
</form>
</body>
</html>

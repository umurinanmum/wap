<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
                            + '</td><td><input type="button" class="btn btn-danger" value="Delete" id="deleteButton" alt="' + res.data[i].id + '"/></td></tr>'
                        );
                    }
                }
            });
        });

    </script>

</head>
<body>

<div class="container">
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

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDC5F2GSXQGW4KnGWSzN7xqE-fdgoVXlw0"></script>
    <script>

        $(document).ready(function () {
            var lat = 0;
            var longg = 0;

            $.get("Team", function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    for (var i = 0; i < res.data.length; i++) {
                        $('#teamsSelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    }
                }
            });

            $.get("User?id=" + 1, function (data, status) {
                var res = JSON.parse(data);
                if (res.statusCode === "SUCCESS") {
                    lat = res.data.lat;
                    longg = res.data.longg;

                    $("#nameP").val(res.data.name);
                    $("#lastnameP").val(res.data.lastname);
                    $("#usernameP").val(res.data.username);
                    $("#mailP").val(res.data.mail);
                    $("#phoneP").val(res.data.phone);
                    $("#latP").val(res.data.lat);
                    $("#longP").val(res.data.longg);

                    if (res.data.team != null && res.data.team != undefined) {
                        $.get("Team?idTeam=" + res.data.team.id, function (data, status) {
                            var res = JSON.parse(data);
                            if (res.statusCode === "SUCCESS") {
                                $("#taskListTableBody").empty();
                                generateTaskTable(res);
                            }
                        });
                    }

                    function getDate(dateVal) {
                        var date = new Date(dateVal);
                        var day = ("0" + date.getDate()).slice(-2);
                        var month = ("0" + (date.getMonth() + 1)).slice(-2);
                        return date.getFullYear() + "-" + (month) + "-" + (day);
                    }

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

                    function initialize() {
                        var prop = {
                            center: new google.maps.LatLng(lat, longg),
                            zoom: 16,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        var map = new google.maps.Map(document.getElementById("googleMap"), prop);
                        var markerCenter = new google.maps.LatLng(lat, longg);
                        var marker = new google.maps.Marker({
                            position: markerCenter,
                            animation: google.maps.Animation.BOUNCE,
                            label: res.data.mail + ' ' + res.data.phone
                        });
                        marker.setMap(map)
                    }

                    initialize();

                }
            });
        });


    </script>

</head>
<body>

    <div class="panel panel-info">
        <div class="panel-heading"><h4>User Profile</h4></div>
        <div class="panel-body">
            <div class="col-md-12">
                <div class="col-md-6">
                    <form method="post" class="form-horizontal" action="/">
                    <div class="well">Profile</div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="nameP">Name:</label>
                            <div class="col-md-9">
                                <input type="text" name="nameP" id="nameP" value="" class="form-control" placeholder="Name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="lastnameP">Last Name:</label>
                            <div class="col-md-9">
                                <input type="text" name="lastnameP" id="lastnameP" value="" class="form-control" placeholder="Last Name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="usernameP">Username:</label>
                            <div class="col-md-9">
                                <input type="text" name="usernameP" id="usernameP" value="" class="form-control" placeholder="Username" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="nameP">Mail:</label>
                            <div class="col-md-9">
                                <input type="text" name="mailP" id="mailP" value="" class="form-control" placeholder="Mail" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="phoneP">Phone:</label>
                            <div class="col-md-9">
                                <input type="text" name="phoneP" id="phoneP" value="" class="form-control" placeholder="Phone" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="latP">Latitude:</label>
                            <div class="col-md-9">
                                <input type="text" name="latP" id="latP" value="" class="form-control" placeholder="Latitude">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="longP">Longitude:</label>
                            <div class="col-md-9">
                                <input type="text" name="longP" id="longP" value="" class="form-control" placeholder="Longitude">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="teamsSelect">Team:</label>
                            <div class="col-md-9">
                                <select name="teams" id="teamsSelect" class="form-control">
                                    <option value="sel">Please Select</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Save</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="well">Map</div>
                    <div id="googleMap" style="height: 400px"></div>
                </div>
        </div>
    </div>
    </div>

</body>
</html>

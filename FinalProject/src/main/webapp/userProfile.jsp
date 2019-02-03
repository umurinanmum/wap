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

                    $("#nameP").text(res.data.name);
                    $("#lastnameP").text(res.data.lastname);
                    $("#usernameP").text(res.data.username);
                    $("#mailP").text(res.data.mail);
                    $("#phoneP").text(res.data.phone);

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
<div class="col-md-12">
    <div class="col-md-6">

        <div class="row">
            <div class="col-md-3">
                <p>Name</p>
            </div>
            <div class="col-md-3">
                <p id="nameP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Last Name</p>
            </div>
            <div class="col-md-3">
                <p id="lastnameP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Username</p>
            </div>
            <div class="col-md-3">
                <p id="usernameP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Mail</p>
            </div>
            <div class="col-md-3">
                <p id="mailP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Phone</p>
            </div>
            <div class="col-md-3">
                <p id="phoneP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Latitude</p>
            </div>
            <div class="col-md-3">
                <p id="latP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Longitude</p>
            </div>
            <div class="col-md-3">
                <p id="longP"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Team</p>
            </div>
            <div class="col-md-3">
                <select name="teams" id="teamsSelect">
                    <option value="sel">Please Select</option>
                </select>
            </div>
        </div>
    </div>
    <div id="googleMap" class="col-md-6" style="height: 400px"></div>
</div>

<div class="col-md-12">
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


</body>
</html>

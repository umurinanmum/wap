<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <%--<script src="js/library.js"></script>--%>

</head>
<body>

<div class="panel panel-info">
    <div class="panel-heading"><h4>User Profile</h4></div>
    <div class="panel-body">
        <div class="col-md-12">
            <div class="col-md-6">
                <form method="post" class="form-horizontal" action="/">

                    <div class="well">Profile :
                        <select name="users" id="userSelect">
                            <option value="sel">Please Select</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-md-3" for="nameP">Name:</label>
                        <div class="col-md-9">
                            <input type="text" name="nameP" id="nameP" value="" class="form-control" placeholder="Name"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="lastnameP">Last Name:</label>
                        <div class="col-md-9">
                            <input type="text" name="lastnameP" id="lastnameP" value="" class="form-control"
                                   placeholder="Last Name" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="usernameP">Username:</label>
                        <div class="col-md-9">
                            <input type="text" name="usernameP" id="usernameP" value="" class="form-control"
                                   placeholder="Username" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="nameP">Mail:</label>
                        <div class="col-md-9">
                            <input type="text" name="mailP" id="mailP" value="" class="form-control" placeholder="Mail"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="phoneP">Phone:</label>
                        <div class="col-md-9">
                            <input type="text" name="phoneP" id="phoneP" value="" class="form-control"
                                   placeholder="Phone" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="latP">Latitude:</label>
                        <div class="col-md-9">
                            <input type="text" name="latP" id="latP" value="" class="form-control"
                                   placeholder="Latitude">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3" for="longP">Longitude:</label>
                        <div class="col-md-9">
                            <input type="text" name="longP" id="longP" value="" class="form-control"
                                   placeholder="Longitude">
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

                    <div class="col-md-3" style="display: none">
                        <input type="text" name="id" id="idUser"/>
                    </div>

                    <button type="button" id="joinTeam" class="btn btn-primary btn-block">Join Team</button>
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

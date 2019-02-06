<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDC5F2GSXQGW4KnGWSzN7xqE-fdgoVXlw0"></script>
    <script src="js/library.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">TaskList</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="#" name="idTaskM">Task</a></li>
                <li><a href="#" name="idTeamM">Team</a></li>
                <li><a href="#" name="idMemberM">Member</a></li>
                <li><a href="#" name="idLogoutM">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xs">
            <img src="images/profile.png" class="img-responsive img-rounded">
            <div><h3>Member Name</h3></div>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" name="idTaskM">Task</a></li>
                <li><a href="#" name="idTeamM">Team</a></li>
                <li><a href="#" name="idMemberM">Member</a></li>
                <li><a href="#" name="idLogoutM">Logout</a></li>
            </ul>
            <br>
        </div>
        <br>
        <div class="col-sm-10" id="mainDiv">
        </div>
    </div>
</div>

<div class="modal fade" id="noteListModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Note of Task</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="notes">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>


</body>

</html>

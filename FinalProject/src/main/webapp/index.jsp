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
                <li><a href="#">Task</a></li>
                <li><a href="#">Team</a></li>
                <li><a href="#">Member</a></li>
                <li><a href="#">Logout</a></li>
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
                <li><a href="#" class="active">Task</a></li>
                <li><a href="#">Team</a></li>
                <li><a href="#">Member</a></li>
                <li><a href="#">Logout</a></li>
            </ul><br>
        </div>
        <br>
        <div class="col-sm-10">
            <div class="panel panel-info">
                <div class="panel-heading">Task List</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-2">
                            <button type="button" class="btn btn-primary" title="Add Task">Add Task</button>
                            </div>
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

                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" title="Edit"> <span class="glyphicon glyphicon-edit"></span></button>
                        <button type="button" class="btn btn-info" title="Note"> <span class="glyphicon glyphicon-comment"></span> </button>
                        <button type="button" class="btn btn-success" title="Share"> <span class="glyphicon glyphicon-share"></span> </button>
                        <button type="button" class="btn btn-danger" title="Delete"> <span class="glyphicon glyphicon-remove-sign"> </span></button>
                    </div>

                    <ul class="pager">
                        <li><a href="#">Previous</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>

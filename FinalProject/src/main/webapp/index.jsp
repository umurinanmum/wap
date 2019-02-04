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
    <script src="js/library.js" ></script>
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
                <li class="active"><a href="#">Task</a></li>
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
                <li class="active"><a href="#">Task</a></li>
                <li><a href="#">Team</a></li>
                <li><a href="#">Member</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
            <br>
        </div>
        <br>
        <div class="col-sm-10">
            <div class="panel panel-info">
                <div class="panel-heading"><b>Task List</b></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-2">
                                <button type="button" class="btn btn-primary" id="addTask" title="Add Task" data-toggle="modal"
                                        data-target="#addEditTaskModal" data-backdrop="false">Add Task
                                </button>
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
                            <table class="table table-striped" id="taskListTable">
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
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody id="taskListTableBody">
                                <%--<tr>
                                    <td>#</td>
                                    <td>Name</td>
                                    <td>Due</td>
                                    <td>Category</td>
                                    <td>data</td>
                                    <td>data</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary" title="Edit"
                                                    data-toggle="modal" data-target="#addEditTaskModal"
                                                    data-backdrop="false"><span class="glyphicon glyphicon-edit"></span>
                                            </button>
                                            <button type="button" class="btn btn-info" title="Note" data-toggle="modal"
                                                    data-target="#addEditNoteModal" data-backdrop="false"><span
                                                    class="glyphicon glyphicon-comment">(7)</span></button>
                                            <button type="button" class="btn btn-success" title="Share"><span
                                                    class="glyphicon glyphicon-share"></span></button>
                                            <button type="button" class="btn btn-danger" title="Delete"
                                                    data-toggle="modal" data-target="#deleteTaskModal"
                                                    data-backdrop="false"><span
                                                    class="glyphicon glyphicon-remove-sign"></span></button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#</td>
                                    <td>Name</td>
                                    <td>Due</td>
                                    <td>Category</td>
                                    <td>data</td>
                                    <td>data</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                    data-toggle="dropdown">
                                                Events <span class="caret"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Edit Task</a></li>
                                                <li><a href="#">Notes of Task</a></li>
                                                <li><a href="#">Share Task</a></li>
                                                <li><a href="#">Delete Task</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--<div class="row">
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
                                            <input type="button" value="Update" id="updateButton"
                                                   class="btn btn-primary"/>
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
                    </div>--%>

                    <ul class="pager">
                        <li><a href="#">Previous</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addEditTaskModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add/Edit Task</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-3">
                            <p> Name : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="name" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Required By : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="date" name="date" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Category : </p>
                        </div>
                        <div class="col-md-8">
                            <select name="category" id="categorySelect" class="form-control">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Priority : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="priority" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> User : </p>
                        </div>
                        <div class="col-md-8">
                            <select name="users" id="usersSelect" class="form-control">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Completed : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="checkbox" name="completed" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <input type="reset" value="Reset" class="form-control btn-success"/>
                        </div>
                        <div class="col-md-6">
                            <input type="submit" value="Save" class="form-control btn-primary"/>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" value="Close" class="form-control btn-danger" data-dismiss="modal"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addEditNoteModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add/Edit Note</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-3">
                            <p>Note : </p>
                        </div>
                        <div class="col-md-8">
                            <textarea rows="3" id="note" name="note" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p>Post Date : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="date" name="date" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <input type="reset" value="Reset" class="form-control btn-success"/>
                        </div>
                        <div class="col-md-6">
                            <input type="submit" value="Save" class="form-control btn-primary"/>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" value="Close" class="form-control btn-danger" data-dismiss="modal"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteTaskModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete Task</h4>
            </div>
            <div class="modal-body">
                <h4>Are you sure?</h4>
            </div>
            <div class="modal-footer center">
                <div class="col-md-5">
                    <input type="reset" value="Yes" class="form-control btn-success"/>
                </div>
                <div class="col-md-5">
                    <input type="submit" value="No" class="form-control btn-danger" data-dismiss="modal"/>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>

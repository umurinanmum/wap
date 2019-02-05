<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<div class="col-sm-10" id="mainDiv">
    <div class="panel panel-info">
        <div class="panel-heading"><b>Task List</b></div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary" id="addTask" title="Add Task"
                                data-target="#newTaskModal" data-backdrop="false" data-toggle="modal">Add Task
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

                        </tbody>
                    </table>
                </div>
            </div>

            <ul class="pager">
                <li><a href="#">Previous</a></li>
                <li><a href="#">Next</a></li>
            </ul>

        </div>
    </div>
</div>


<div class="modal fade" id="newTaskModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Task</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-3">
                            <p> Name : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="nameNewTask" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Required By : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="date" name="dateNewTask" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Category : </p>
                        </div>
                        <div class="col-md-8">
                            <select name="categoryNewTask" id="categorySelectNew" class="form-control">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Priority : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="priorityNewTask" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> User : </p>
                        </div>
                        <div class="col-md-8">
                            <select name="usersNewTask" id="usersSelectNew" class="form-control">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Completed : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="checkbox" name="completedNewTask" id="completedNewTask" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <input type="reset" value="Reset" class="form-control btn-success"/>
                        </div>
                        <div class="col-md-6">
                            <input type="button" value="Save" id="newTaskSaveButton" class="form-control btn-primary"/>
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

<div class="modal fade" id="updateTaskModal" role="dialog">
    <div class="col-md-3" style="display: none">
        <input type="text" name="id" id="idTask"/>
    </div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Update Task</h4>
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
                            <select name="category" id="categorySelectUpdate" class="form-control">
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
                            <select name="users" id="usersSelectUpdate" class="form-control">
                                <option value="sel">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <p> Completed : </p>
                        </div>
                        <div class="col-md-8">
                            <input type="checkbox" name="completedUpdate" id="completedUpdate" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <input type="reset" value="Reset" class="form-control btn-success"/>
                        </div>
                        <div class="col-md-6">
                            <input type="button" value="Save" id="updateTaskSaveButton"
                                   class="form-control btn-primary"/>
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
                <form>F
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
                            <input type="date" name="dateNote" id="dateNote" class="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <input type="reset" value="Reset" class="form-control btn-success"/>
                        </div>
                        <div class="col-md-6">
                            <input type="submit" value="Save" id="noteSaveButton" class="form-control btn-primary"/>
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

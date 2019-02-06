<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Team List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>



</head>
<body>

<div class="col-sm-10" id="mainDiv">
    <div class="panel panel-info">
        <div class="panel-heading"><b>Team List</b></div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary" id="addTeam" title="Add Team"
                                data-target="#newTeamModal" data-backdrop="false" data-toggle="modal">Add Team
                        </button>
                    </div>
                    <div class="col-md-2">
                        Sort by :
                    </div>
                    <div class="col-md-2">
                        <select name="teamSortBy" id="teamSortBy">
                            <option value="name">Name</option>
                            <option value="hasMember">hasMember</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        Order by :
                    </div>
                    <div class="col-md-2">
                        <select name="teamSortOrder" id="teamSortOrder">
                            <option value="ascending">Ascending</option>
                            <option value="descending">Descending</option>
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
                            <th>hasMember</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="teamListTableBody">

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

</body>
</html>

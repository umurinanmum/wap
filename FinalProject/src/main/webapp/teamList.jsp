<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Team List</title>
</head>
<body>


    <div class="panel panel-info">
        <div class="panel-heading"><b>Team List</b></div>
        <div class="panel-body">
            <div class="row">
                <form action="/" method="post">
                    <div class="col-md-12">
                        <div class="col-md-2">
                            <label>Search name: </label><br>
                            <input type="text" id="teamSearchByName" name="teamSearchByName" placeholder="Name" value="">
                        </div>
                        <div class="col-md-2">
                            <label>Sort by: </label><br>
                            <select name="teamSortBy" id="teamSortBy">
                                <option value="id">id</option>
                                <option value="name">Name</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label>Order by: </label><br>
                            <select name="teamSortOrder" id="teamSortOrder">
                                <option value="asc">Ascending</option>
                                <option value="desc">Descending</option>
                            </select>
                        </div>
                        <div class="col-md-2"><br>
                            <button type="button" class="btn btn-primary" id="searchTeamBtn" name="searchTeamBtn" title="Search team">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-striped" id="teamListTable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
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


</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
</head>
<body>


<div class="modal fade" id="addEditNoteModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Note of Task</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <form>
                                <div class="col-md-9">
                                    <label>Note: </label><br>
                                    <input type="text" id="note" name="note" class="form-control"></textarea>
                                </div>
                                <div class="col-md-2"><br>
                                    <input type="submit" value="Save" class="btn-primary form-control"/>
                                </div>
                            </form>
                        </div>

                        <div class="row">
                            <div class="media">
                                <div class="media-left">
                                    <img src="images/profile.png" class="media-object" style="width:50px">
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Member1 <small>
                                        <i>Posted on February 19, 2019</i></small></h4>
                                    <p>note ntoe ntoen toe</p>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="media">
                                <div class="media-left">
                                    <img src="images/profile.png" class="media-object" style="width:50px">
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Member2 <small>
                                        <i>Posted on February 19, 2019</i></small></h4>
                                    <p>note ntoe ntoen toe</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>

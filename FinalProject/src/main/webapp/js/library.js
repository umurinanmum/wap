$(document).ready(function () {

    $("a[name='idTeamM']").click(function (event) {

        $("#mainDiv").load("teamList.jsp", function () {
            //$.get("Team", function (data, status) {
            //    var res = JSON.parse(data);
            //    if (res.statusCode === "SUCCESS") {
            //        console.log(res);
            //        generateTeamTable(res);
            //    }
            //});

            $("#searchTeamBtn").click(function (evt) {
                evt.preventDefault();
                let teamSearchByName = $("#teamSearchByName").val();
                let teamSortBy = $("#teamSortBy").val();
                let teamSortOrder = $("#teamSortOrder").val();

                $.ajax({
                    url: "Team",
                    data: {
                        "subAction": "Search",
                        "teamSearchByName": teamSearchByName,
                        "teamSortBy": teamSortBy,
                        "teamSortOrder": teamSortOrder
                    },
                    method: 'GET',
                    contentType: 'application/json',
                    success: function (data) {
                        var res = JSON.parse(data);
                        console.log(res);
                        if (res.statusCode === "SUCCESS") {
                            $("#teamListTableBody").empty();
                            generateTeamTable(res);
                        }
                    },
                    error: function (request, msg, error) {
                        console.log(error + ': ' + msg);
                    }
                });
            });
        });
    });

    function generateTeamTable(res) {
        for (let i = 0; i < res.data.length; i++) {
            $('#teamListTable tbody').append('<tr><td>' + res.data[i].id + '</td><td>'
                + res.data[i].name
                + '</td></tr>'
            );
        }
    }

    $("a[name='idMemberM']").click(function (event) {
        $("#mainDiv").load("userProf.jsp", function () {
            loadUser();
            $("#userSelect").change(function () {
                let idUser = this.value;
                $.get("User?id=" + idUser, function (data, status) {
                    var res = JSON.parse(data);
                    if (res.statusCode === "SUCCESS") {
                        $("#idUser").val(res.data.id);
                        $("#nameP").val(res.data.name);
                        $("#lastnameP").val(res.data.lastname);
                        $("#usernameP").val(res.data.username);
                        $("#mailP").val(res.data.mail);
                        $("#phoneP").val(res.data.phone);
                        $("#latP").val(res.data.lat);
                        $("#longP").val(res.data.longg);
                        $("select[name='teams']").val(res.data.team.id);

                        lat = res.data.lat;
                        longg = res.data.longg;
                        initialize(res.data.lat, res.data.longg, res.data.mail, res.data.phone);
                    }
                });
            });
        });
    });

    $("a[name='idTaskM']").click(function (event) {
        $("#mainDiv").load("tasks.jsp", function () {
            loadInitialTasks();
        });
    });


    $("#mainDiv").load("tasks.jsp", function () {
        loadInitialTasks();
    });



    function loadCategories() {
        $.get("Category", function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                for (var i = 0; i < res.data.length; i++) {
                    $('#categorySelectNew option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    $('#categorySelectUpdate option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                }
            }
        });
    }
    function loadUsers() {
        $.get("User", function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                for (var i = 0; i < res.data.length; i++) {
                    $('#usersSelectNew option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    $('#usersSelectUpdate option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                    $('#userSelectForFilter option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                }
            }
        });
    }


    function loadInitialTasks() {


        $.get("Task", function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                generateTaskTable(res);
                loadUsers();
                loadCategories();

                $("#orderedByRequiredBy").change(function () {
                    if (this.checked) {
                        $.get("Task?orderedByRequiredBy=" + true, function (data, status) {
                            var res = JSON.parse(data);
                            if (res.statusCode === "SUCCESS") {
                                $("#taskListTableBody").empty();
                                generateTaskTable(res);
                            }
                        });
                    } else {
                        $.get("Task", function (data, status) {
                            var res = JSON.parse(data);
                            if (res.statusCode === "SUCCESS") {
                                $("#taskListTableBody").empty();
                                generateTaskTable(res);
                            }
                        });
                    }
                });
                $("#userSelectForFilter").change(function () {
                    let idUser = this.value;
                    if (idUser === "sel") {
                        $.get("Task", function (data, status) {
                            var res = JSON.parse(data);
                            if (res.statusCode === "SUCCESS") {
                                $("#taskListTableBody").empty();
                                generateTaskTable(res);
                            }
                        });
                    } else {
                        $.get("Task?idUser=" + idUser, function (data, status) {
                            var res = JSON.parse(data);
                            if (res.statusCode === "SUCCESS") {
                                $("#taskListTableBody").empty();
                                generateTaskTable(res);
                            }
                        });
                    }
                });
            }
        });
    }

    function generateTaskTable(res) {
        for (let i = 0; i < res.data.length; i++) {
            $('#taskListTable tbody').append('<tr id="taskRow'+ i +'"><td>' + (i + 1) + '</td><td>'
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
                + '</td><td><button class="btn btn-primary" id="editButton' + i + '"lang="' + res.data[i].id + '" data-toggle="modal" data-target="#updateTaskModal" data-backdrop="false"><span class="glyphicon glyphicon-edit"/></button>' +
                '<button class="btn btn-info" id="noteButton' + i + '"lang="' + res.data[i].id + '"><span class="glyphicon glyphicon-comment"data-toggle="modal" data-target="#noteListModal" data-backdrop="false"></span></button>' +
                '<button type="button" class="btn btn-success" id="addNoteButton' + i + '"lang="' + res.data[i].id + '" data-toggle="modal" data-target="#addEditNoteModal" data-backdrop="false"><span class="glyphicon glyphicon-share"></span></button>' +
                '<button class="btn btn-danger" id="deleteButton' + i + '"lang="' + res.data[i].id + '"><span class="glyphicon glyphicon-remove-sign"></span></button> </td></tr>'
            );

            if(res.data[i].completed) {
                $("#taskRow"+i).css("background-color","#2ECC40");
            }

            if(getDate(res.data[i].requiredBy) < getDate((new Date()).getTime())) {
                $("#taskRow"+i).css("background-color","#FF4136");
            }
            var deleteButtonId = "deleteButton" + i;
            $("#" + deleteButtonId).click(function () {
                let id = parseInt(this.lang);
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


            $("#addTask").click(function () {
                $("input[name='nameNewTask']").val("");
                $("input[name='dateNewTask']").val(getDate((new Date()).getTime()));
                $("select[name='categoryNewTask']").val("sel");
                $("input[name='priorityNewTask']").val("");
                $("select[name='usersNewTask']").val("sel");
                $("input[name='completedNewTask']").attr("checked", false);
            });

            var editButtonId = "editButton" + i;
            $("#" + editButtonId).click(function () {
                $("#editFields").show();
                let id = parseInt(this.lang);
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
                            $("input[name='completedUpdate']").attr("checked", res.data.completed);
                        }
                    },
                    error: function (request, msg, error) {
                        // handle failure
                    }
                });
            });

            var addNoteButtonId = "addNoteButton" + i;
            $("#" + addNoteButtonId).click(function () {
                let id = parseInt(this.lang);
                $("#idTask").val(id);
            });

            var noteButtonId = "noteButton" + i;
            $("#" + noteButtonId).click(function () {
                //$("#notesDiv").show();
                let id = parseInt(this.lang);
                $("#idTask").val(id);

                $.ajax({
                    url: 'Note?idTask=' + id,
                    method: 'get',
                    contentType: 'application/json',
                    success: function (result) {
                        var res = JSON.parse(result);
                        $('#notes').empty();
                        for (var j = 0; j < res.data.length; j++) {
                            $('#notes').append('<div class="row">\n' +
                                '                                <div class="media">' +
                                '                                    <div class="media-left">' +
                                '                                        <img src="images/note.png" class="media-object" style="width:50px">' +
                                '                                    </div>' +
                                '                                    <div class="media-body">' +
                                '                                        <h4 class="media-heading">' +
                                '                                            <small>' +
                                '                                                <i>Posted on ' + getDate(res.data[j].date) + '</i></small>\n' +
                                '                                        </h4>' +
                                '                                        <p>' + res.data[j].note + '</p>' +
                                '                                    </div>' +
                                '                                </div>' +
                                '                            </div>');

                        }
                    },
                    error: function (request, msg, error) {
                        // handle failure
                    }
                });
            });
        }

        $('#newTaskSaveButton').click(function () {
            var taskDto = {
                "name": $("input[name='nameNewTask']").val(),
                "requiredBy": $("input[name='dateNewTask']").val(),
                "category": {
                    "id": $("select[name='categoryNewTask']").val()
                },
                "priority": $("input[name='priorityNewTask']").val(),
                "user": {
                    "id": $("select[name='usersNewTask']").val()
                },
                "completed": document.getElementById('completedNewTask').checked
            };

            //send to server
            $.ajax({
                type: 'post',
                url: 'Task',
                dataType: 'JSON',
                data: {
                    source: JSON.stringify(taskDto)
                },
                success: function (data) {
                    if (data.statusCode === "SUCCESS") {
                        location.reload();
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });

        $('#noteSaveButton').click(function () {
            let idTask = $('#idTask').val();
            var noteDto = {
                "note": $("textarea[name='note']").val(),
                "date": $("input[name='dateNote']").val(),
                "taskDto": {
                    "id": idTask
                }
            };

            //send to server
            $.ajax({
                type: 'post',
                url: 'Note',
                dataType: 'JSON',
                data: {
                    source: JSON.stringify(noteDto)
                },
                success: function (data) {
                    if (data.statusCode === "SUCCESS") {
                        //location.reload();
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });


        $('#updateTaskSaveButton').click(function () {
            let idTask = $('#idTask').val();
            var taskDto = {
                "id": idTask,
                "name": $("input[name='name']").val(),
                "requiredBy": $("input[name='date']").val(),
                "category": {
                    "id": $("select[name='category']").val()
                },
                "priority": $("input[name='priority']").val(),
                "user": {
                    "id": $("select[name='users']").val()
                },
                "completed": document.getElementById('completedUpdate').checked
            };

            //send to server
            $.ajax({
                type: 'post',
                url: 'Task',
                dataType: 'JSON',
                data: {
                    source: JSON.stringify(taskDto)
                },
                success: function (data) {
                    if (data.statusCode === "SUCCESS") {
                        location.reload();
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        });

    }

    function getDate(dateVal) {
        var date = new Date(dateVal);
        var day = ("0" + date.getDate()).slice(-2);
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        return date.getFullYear() + "-" + (month) + "-" + (day);
    }


    // $.get("Team", function (data, status) {
    //     var res = JSON.parse(data);
    //     if (res.statusCode === "SUCCESS") {
    //         for (var i = 0; i < res.data.length; i++) {
    //             $('#teamsSelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
    //         }
    //     }
    // });


    function loadUser(id) {
        if (id == null || id === undefined) {
            id = 1;
        }

        $.get("User", function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                for (var i = 0; i < res.data.length; i++) {
                    $('#userSelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                }
            }
        });

        $.get("Team", function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                for (var i = 0; i < res.data.length; i++) {
                    $('#teamsSelect option:last').after('<option value="' + res.data[i].id + '">' + res.data[i].name + '</option>');
                }
            }
        });

        $("#joinTeam").click(function () {
            let idUser = $("#idUser").val();
            let idTeam = $("#teamsSelect").val();
            $.ajax({
                url: 'Team?idTeam=' + idTeam + "&idUser=" + idUser,
                method: 'POST',
                contentType: 'application/json',
                success: function (data) {

                },
                error: function (request, msg, error) {
                    // handle failure
                }
            });
        });

        $("#saveUserBtn").click(function () {

            var userDto = {
                "name": $("#nameP").val(),
                "lastname": $("#lastnameP").val(),
                "username": $("#usernameP").val(),
                "mail": $("#mailP").val(),
                "phone": $("#phoneP").val(),
                "lat": $("#latP").val(),
                "longg": $("#longP").val(),
                "team": {
                    "id": $("select[name='teams']").val()==="sel" ? null : $("select[name='teams']").val()
                }
            };


            $.ajax({
                url: 'User',
                method: 'POST',
                data: {
                    source: JSON.stringify(userDto)
                },
                success: function (data) {

                },
                error: function (request, msg, error) {
                    // handle failure
                }
            });
        });


        $.get("User?id=" + id, function (data, status) {
            var res = JSON.parse(data);
            if (res.statusCode === "SUCCESS") {
                $("#idUser").val(res.data.id);
                $("#nameP").val(res.data.name);
                $("#lastnameP").val(res.data.lastname);
                $("#usernameP").val(res.data.username);
                $("#mailP").val(res.data.mail);
                $("#phoneP").val(res.data.phone);
                $("#latP").val(res.data.lat);
                $("#longP").val(res.data.longg);
                $("select[name='teams']").val(res.data.team.id);

                // if (res.data.team != null && res.data.team != undefined) {
                //     $.get("Team?idTeam=" + res.data.team.id, function (data, status) {
                //         var res = JSON.parse(data);
                //         if (res.statusCode === "SUCCESS") {
                //             $("#taskListTableBody").empty();
                //             generateTaskTable(res);
                //         }
                //     });
                // }

                function getDate(dateVal) {
                    var date = new Date(dateVal);
                    var day = ("0" + date.getDate()).slice(-2);
                    var month = ("0" + (date.getMonth() + 1)).slice(-2);
                    return date.getFullYear() + "-" + (month) + "-" + (day);
                }

                // function generateTaskTable(res) {
                //     for (let i = 0; i < res.data.length; i++) {
                //         $('#taskListTable tbody').append('<tr><td>' + (i + 1) + '</td><td>'
                //             + res.data[i].name
                //             + '</td><td>'
                //             + getDate(res.data[i].requiredBy)
                //             + '</td><td>'
                //             + res.data[i].category.name
                //             + '</td><td>'
                //             + res.data[i].priority
                //             + '</td><td>'
                //             + res.data[i].user.id
                //             + '</td><td>'
                //             + res.data[i].user.name + " " + res.data[i].user.lastname
                //             + '</td><td>'
                //             + res.data[i].completed
                //             + '</td><td><input type="button" class="btn btn-danger" value="Delete" id="deleteButton' + i + '"alt="' + res.data[i].id + '"/>' +
                //             '<input type="button" class="btn btn-warning" value="Edit" id="editButton' + i + '"alt="' + res.data[i].id + '"/>' +
                //             '<input type="button" class="btn btn-primary" value="Notes" id="notesButton' + i + '"alt="' + res.data[i].id + '"/> </td></tr>'
                //         );
                //         var deleteButtonId = "deleteButton" + i;
                //         $("#" + deleteButtonId).click(function () {
                //             let id = parseInt(this.alt);
                //             $.ajax({
                //                 url: 'Task?id=' + id,
                //                 method: 'DELETE',
                //                 contentType: 'application/json',
                //                 success: function (data) {
                //                     let res = JSON.parse(data);
                //                     if (res.statusCode === "SUCCESS") {
                //                         $("#taskListTable").remove();
                //                         location.reload();
                //                     } else {
                //                         //$.toast('Task can not be deleted');
                //                     }
                //                 },
                //                 error: function (request, msg, error) {
                //                     // handle failure
                //                 }
                //             });
                //         });
                //
                //         var editButtonId = "editButton" + i;
                //         $("#" + editButtonId).click(function () {
                //             $("#editFields").show();
                //             let id = parseInt(this.alt);
                //             $("#idTask").val(id);
                //             $.ajax({
                //                 url: 'Task?id=' + id,
                //                 method: 'GET',
                //                 contentType: 'application/json',
                //                 success: function (data) {
                //                     let res = JSON.parse(data);
                //                     if (res.statusCode === "SUCCESS") {
                //                         $("input[name='name']").val(res.data.name);
                //                         $("input[name='date']").val(getDate(res.data.requiredBy));
                //                         $("select[name='category']").val(res.data.category.id);
                //                         $("input[name='priority']").val(res.data.priority);
                //                         $("select[name='users']").val(res.data.user.id);
                //                         $("input[name='completed']").attr("checked", res.data.completed);
                //                     }
                //                 },
                //                 error: function (request, msg, error) {
                //                     // handle failure
                //                 }
                //             });
                //         });
                //
                //         var noteButtonId = "notesButton" + i;
                //         $("#" + noteButtonId).click(function () {
                //             $("#notesDiv").show();
                //             let id = parseInt(this.alt);
                //             $.ajax({
                //                 url: 'Note?idTask=' + id,
                //                 method: 'get',
                //                 contentType: 'application/json',
                //                 success: function (result) {
                //                     var res = JSON.parse(result);
                //                     console.log(res);
                //                     for (var j = 0; j < res.data.length; j++) {
                //                         $('#noteListTable tbody').append('<tr><td>' + (j + 1) + '</td><td>'
                //                             + res.data[j].note
                //                             + '</td><td>'
                //                             + getDate(res.data[j].date)
                //                             + '</td></tr>'
                //                         );
                //                     }
                //                 },
                //                 error: function (request, msg, error) {
                //                     // handle failure
                //                 }
                //             });
                //         });
                //     }
                // }


                initialize(res.data.lat, res.data.longg, res.data.mail, res.data.phone);

            }
        });
    }

    function initialize(lat, longg, mail, phone) {
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
            label: mail + ' ' + phone
        });
        marker.setMap(map)
    }

});





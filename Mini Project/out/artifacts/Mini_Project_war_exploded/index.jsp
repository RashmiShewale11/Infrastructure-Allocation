<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/main.css">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.10/css/mdb.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.10/js/mdb.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

</head>

<%
    if (request.getSession().getAttribute("user_name") != null) {
        response.sendRedirect("booking.jsp");
    }
%>
<body id="login">
<!-- Default form login -->
<div class="row">
    <div class="col-lg-4"></div>
    <div class="col-lg-4 col-md-12">
        <div class="card-fat mt-2">
            <div class="card-body text-center">
                <form class="p-3" method="post"
                      action="auth_user">
                    <div class="fa fa-user fa-5x"></div>
                    <p class="h4 mb-4">Sign in</p>

                    <!-- Email -->

                    <input type="text" id="txt_id" name="txt_id" class="form-control mb-4" placeholder="MIS Id">

                    <!-- Password -->

                    <input type="password" id="txt_pass" name="txt_pass" class="form-control mb-4"
                           placeholder="Password">

                    <%--list--%>

                    <select class="form-control mb-4" name="type">
                        <option value="user">User</option>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                    </select>

                    <!-- Sign in button -->
                    <input type="submit" class="btn btn-info btn-block my-4" value="Sign In">
                    <div style="color:red">
                        <%
                            if(session.getAttribute("errorMessage")=="type"){
                                out.print("<p>Select type of user!</p>");
                            }
                            if (session.getAttribute("errorMessage") != null && session.getAttribute("errorMessage") !="type")
                                out.print("<p>Invalid Username or Password, Try Again!</p>");
                        %>
                    </div>
                    <!-- Register -->
                    <p>Not a member?
                        <a href="sign_up.jsp">Register</a>
                    </p>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.10/js/mdb.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

</head>


<body>

<div class="row">
    <div class="col-lg-4"></div>
    <div class="col-lg-4 col-md-12">

        <!-- Default form register -->
        <form class="text-center border border-light mt-5 p-5" style=" box-shadow: 5px 10px 8px #888888;" method="post"
              action="register_user">

            <p class="h4 mb-4">Sign up</p>

            <div class="form-row mb-4">
                <div class="col">
                    <!-- First name -->
                    <input type="text" name="fname" class="form-control" placeholder="First name" required>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <input type="text" name="mname" class="form-control" placeholder="Middle name">
                </div>
                <div class="col">
                    <!-- Last name -->

                    <input type="text" name="lname" class="form-control" placeholder="Last name" required>
                </div>
            </div>
            <!-- MIS ID -->
            <input type="text" name="mis_id" class="form-control mb-4" placeholder="MIS ID" required>
            <!-- E-mail -->
            <input type="email" name="email" class="form-control mb-4" placeholder="E-mail" required>

            <!-- Password -->
            <input type="password" name="pass" class="form-control" placeholder="Password" required>
            <small id="pass" class="form-text text-muted mb-4">
                At least 8 characters and 1 digit
            </small>

            <!-- Phone number -->
            <input type="text" name="mobile" class="form-control" placeholder="Phone number" required>

            <!-- Sign up button -->
            <input type="submit" value="Sign Up" class="btn btn-info my-4 btn-block">

            <hr>

        </form>
        <!-- Default form register -->
    </div>
</div>

</body>

</html>

<?php
require_once('dbConnection.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/loginregister.css" rel="stylesheet">


    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <script src="js/loginregister.js"></script>



    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


  
  <link rel="stylesheet" href="css/style.css" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <!-- remember, jQuery is completely optional -->
  <!-- <script type='text/javascript' src='js/jquery-1.11.1.min.js'></script> -->
  <script type='text/javascript' src='./jquery.particleground.js'></script>
  <script type='text/javascript' src='js/demo.js'></script>

</head>
<body>

<div id="particles">
 <div id="intro">

<div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#" class="active" id="login-form-link">Login</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="#" id="register-form-link">Register</a>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form id="login-form" action="login.php" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <form id="register-form" action="signup.php" method="post" role="form" style="display: none;">
                                    <div class="form-group">
                                        <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="firstname" id="firstname" tabindex="2" class="form-control" placeholder="First Name" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="lastname" id="lastname" tabindex="3" class="form-control" placeholder="Last Name" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="email" id="email" tabindex="4" class="form-control" placeholder="Email Address" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="dob" id="dob" tabindex="5" class="form-control" placeholder="Date of Birth" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="filter">Role</label>
                                        <select class="form-control" id="role" name="role">
                                            <?php $sql = 'SELECT * FROM Roles';
                                                    foreach ($db->query($sql) as $row) { ?>
                                                <option value="<?php echo $row['role_id']; ?>">
                                                    <?php echo htmlspecialchars($row['role']); ?>
                                                </option>
                                                <?php } ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" tabindex="6" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="confirm-password" id="confirm-password" tabindex="7" class="form-control" placeholder="Confirm Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="errorlog" style="visibility:hidden"></div>
    
    <?php
        if(isset($_GET['val'])){
            if($_GET['val']=="success"){
                echo "<script>
                        $(function() {
                            $('#errorlog').text('Registration Successful!').css('background-color','#006400').css('visibility','visible');
                            $('#errorlog').delay(4000).fadeOut('slow');
                        });
                     </script>";
            }else{
                $errString;
                if($_GET['val']==1){
                    $errString = 'Passwords do not match!';
                }else if($_GET['val']==2){
                    $errString = 'Missing inputs!';
                }else{
                    $errString = 'Username or email already exists!';
                }

                echo "<script>
                        $(function() {
                            $('#errorlog').text('".$errString."').css('background-color','#FF072D').css('visibility','visible');
                            $('#errorlog').delay(3000).fadeOut('slow');
                            $('#login-form').fadeOut(8);
                            $('#register-form').delay(10).fadeIn(10);
                            $('#login-form-link').removeClass('active');
                            $('#register-form-link').addClass('active');
                        });
                     </script>";
            }
        }

    ?>

</div>
</div>

</body>
</html>
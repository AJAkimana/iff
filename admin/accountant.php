<?php
	session_start();
    require_once('php-includes/config.php');
    $userident = $_SESSION['userident'];
	
	if(!isset($_SESSION['id'])) {
		header('Location:../index.php');
	}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>IFF</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include('php-includes/menu.php'); ?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Admin Page</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <a href='adduser.php' class='btn btn-primary' style="float: right;">ADD USER</a><br><br>
                        <div class="panel-heading">
                        <b>Accountant Accounts</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Pin</th>
                                        <th>Names</th>
                                        <th>No ID</th>
                                        <th>Telephone</th>
                                        <th>Address</th>
                                        <th>User Status</th>
                                        <!-- <th>Action</th> -->
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                        $result=$dbh->prepare("Select * From accountant Order By Names ASC");
                                        $result->execute();
                                        while($row = $result->fetch(PDO::FETCH_ASSOC)){	
                                            echo "<tr>";
                                            echo "<td>".$row['userident']."</td>";
                                            echo "<td>".$row['Names']."</td>";
                                            echo "<td>".$row['NationalID']."</td>";
                                            echo "<td>".$row['mobile']."</td>";
                                            echo "<td>".$row['address']."</td>";
                                            if($row['user_status']=='Active') {
                                                echo "<td><a href='update_status_acc.php?userid=$row[id]' class='btn btn-success'>".$row['user_status']."</a></td>";
                                            }else{
                                                echo "<td><a href='update_status_acc.php?userid=$row[id]' class='btn btn-warning'>".$row['user_status']."</a></td>";
                                            }
                                            // echo "<td><a href='editformacc.php?edit_id=$row[id]' class='btn btn-danger'>Edit</a></td>";
                                            echo "</tr>";
                                        }
                                    ?>
                                   
                                </tbody>
                            </table>
                            
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

            


            
          
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>

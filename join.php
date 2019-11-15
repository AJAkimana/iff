<?php
include('php-includes/connect.php');
include('php-includes/check-login.php');
$userident = $_SESSION['userident'];
$capping = 5000;
$capping2 =6000;
?>
<?php
//User cliced on join
if(isset($_GET['join_user'])){
	$matching=0;
	$side='';
	$pin = mysqli_real_escape_string($con,$_GET['pin']);
	$names = mysqli_real_escape_string($con,$_GET['names']);
	$natio_id = mysqli_real_escape_string($con,$_GET['natio_id']);
	$mobile = mysqli_real_escape_string($con,$_GET['mobile']);
	$address = mysqli_real_escape_string($con,$_GET['address']);
	$under_userpin = mysqli_real_escape_string($con,$_GET['under_userpin']);
	$side = mysqli_real_escape_string($con,$_GET['side']);
	$sponsor = mysqli_real_escape_string($con,$_GET['sponsor']);
	$password = mysqli_real_escape_string($con,$_GET['pass1']);
	// $password = md5($password);
	$date = date("y-m-d");
	$user_status= "Active";
	$picture="images.png";
	
	$flag = 0;
	
	if($pin!='' && $mobile!='' && $address!='' && $under_userpin!='' && $side!=''){
		//User filled all the fields.
		if(pin_check($pin)){
			// pin is ok
			// if(userExist_check($userident)){
				//user exist is ok
				if(!userExist_check($under_userpin)){
					//under user is ok
					if(side_check($under_userpin,$side)){
						//side check is ok
						$flag=1;
					}
					else{
						echo '<script>alert("The side you selected is not available");</script>';
					}
				}
				else{
					//check under user id
					echo '<script>alert("Invalid Under User Id");</script>';
				}
			// }
			// else{
			// 	//check that user exist
			// 	echo '<script>alert("this user is arleady available");</script>';
			// }
			
		}
		else{
			//check pin
			echo '<script>alert("Invalid Pin");</script>';
		}
	}
	else{
		//check all fields are fill
		echo '<script>alert("Please fill all the fields.");</script>';
	}
	
	//Now we are heree
	//It means all the information is correct
	//Now we will save all the information
	if($flag==1){
		
		//Insert into User profile
		$query = mysqli_query($con,"insert into user(`userident`,`Names`,`NationalID`,`password`,`mobile`,`address`,`under_userpin`,`side`,`user_status`,`picture`,`date`) values('$pin','$names','$natio_id','$password','$mobile','$address','$under_userpin','$side','$user_status','$picture','$date')");
		
		//Insert into Tree
		//So that later on we can view tree.
		$query = mysqli_query($con,"insert into tree(`userident`,`Names`,`date`) values('$pin','$names','$date')");
		
		//Insert to side
		$query = mysqli_query($con,"update tree set `$side`='$pin' where userident='$under_userpin'");
		
		//Update pin status to close
		$query = mysqli_query($con,"update pin_list set status='close' where pin='$pin'");
		
		//Inset into Icome
		$query = mysqli_query($con,"insert into income (`userident`,`date`) values('$pin','$date')");
		echo mysqli_error($con);
		//This is the main part to join a user\
		//If you will do any mistake here. Then the site will not work.
		
		//Update count and Income.
		$temp_sponsor = $sponsor;
		$temp_under_userpin = $under_userpin;
		$temp_side = $side;
		$temp_side_count = $side.'count'; //leftcount or rightcount
	
		$total_count=1;
		// $i=1;

		//Loop

		while($total_count>0){
			// $i;
			$q = mysqli_query($con,"select * from tree where userident='$temp_under_userpin'");
			$r = mysqli_fetch_array($q);
			$current_temp_side_count = $r[$temp_side_count]+1;
			// $temp_under_userpin;
			// $temp_side_count;
			mysqli_query($con,"update tree set `$temp_side_count`=$current_temp_side_count where userident='$temp_under_userpin'");
			
			//income
			if($temp_sponsor!=""){
				$income_data1 = income($temp_sponsor);
				$income_data2 = income($temp_under_userpin);
				
				
					$tree_data = tree($temp_under_userpin);

					$temp_left_count = $tree_data['leftcount'];
					$temp_right_count = $tree_data['rightcount'];
					
						
					
				
				//change under_userpin
				$next_under_userpin = getUnderId($temp_under_userpin);
				$temp_side = getUnderIdPlace($temp_under_userpin);
				$temp_side_count = $temp_side.'count';
				$temp_under_userpin = $next_under_userpin;	
				
				// $i++;
			}
			
			//Chaeck for the last user
			if($temp_under_userpin==""){
				$total_count=0;
			}
			
		}//Loop
		
		if ($temp_sponsor!="")
		{
			$income_data = income($temp_sponsor);

			$new_day_bal = $income_data['day_bal']+5000;
			$new_current_bal = $income_data['current_bal']+5000;
			$new_total_bal = $income_data['total_bal']+5000;
								
			//update income
			mysqli_query($con,"update income set day_bal='$new_day_bal', current_bal='$new_current_bal', total_bal='$new_total_bal' where userident='$temp_sponsor' limit 1");
		}
		
		
		
		echo mysqli_error($con);
		if($temp_left_count === $temp_right_count && $temp_left_count!='' && $temp_right_count!='' && ($temp_left_count + $temp_right_count) % 2 ==0 )
		{

			// $matching=$matching+2;
			// if($matching===2){
				
			// }
			
		}
		
		echo '<script>alert("User Registered successfully.");</script>';
		echo $matching;
	}
	
}
?><!--/join user-->
<?php 
//functions
function pin_check($pin){
	global $con,$userident;
	
	$query =mysqli_query($con,"select * from pin_list where pin='$pin' and userident='$userident' and status='open'");
	if(mysqli_num_rows($query)>0){
		return true;
	}
	else{
		return false;
	}
}
function userExist_check($userident){
	global $con;
	 
	$query =mysqli_query($con,"select * from user where userident='$userident'");
	if(mysqli_num_rows($query)>0){
		return false;
	}
	else{
		return true;
	}
}
function side_check($userident,$side){
	global $con;
	
	$query =mysqli_query($con,"select * from tree where userident='$userident'");
	$result = mysqli_fetch_array($query); 
	$side_value = $result[$side];
	if($side_value==''){
		return true;
	}
	else{
		return false;
	}
}
function income($userident){
	global $con;
	$data = array();
	$query = mysqli_query($con,"select * from income where userident='$userident'");
	$result = mysqli_fetch_array($query);
	$data['day_bal'] = $result['day_bal'];
	$data['current_bal'] = $result['current_bal'];
	$data['total_bal'] = $result['total_bal'];
	
	return $data;
}
function tree($userident){
	global $con;
	$data = array();
	$query = mysqli_query($con,"select * from tree where userident='$userident'");
	$result = mysqli_fetch_array($query);
	$data['left'] = $result['left'];
	$data['right'] = $result['right'];
	$data['leftcount'] = $result['leftcount'];
	$data['rightcount'] = $result['rightcount'];
	
	return $data;
}
function getUnderId($userident){
	global $con;
	$query = mysqli_query($con,"select * from user where userident='$userident'");
	$result = mysqli_fetch_array($query);
	return $result['under_userpin'];
}
function getUnderIdPlace($userident){
	global $con;
	$query = mysqli_query($con,"select * from user where userident='$userident'");
	$result = mysqli_fetch_array($query);
	return $result['side'];
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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

 

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include('php-includes/menu.php'); ?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Join The User</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-lg-4">
                    	<form method="get">
                            <div class="form-group">
                                <label>Pin</label>
                                <input type="text" name="pin" class="form-control" required>
                            </div>
							<div class="form-group">
                                <label>Names</label>
                                <input type="text" name="names" class="form-control" required>
                            </div>
							<div class="form-group">
                                <label>National Id</label>
                                <input type="number" name="natio_id" class="form-control" required>
                            </div>
							<div class="form-group">
                                <label>Password</label>
                                <input type="text" name="pass1" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mobile</label>
                                <input type="phone" name="mobile" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>UpLine Pin</label>
                                <input type="pin" name="under_userpin" class="form-control" required>
                            </div>
							<div class="form-group">
                                <label>Sponsor Pin</label>
                                <input type="text" name="sponsor" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Side</label><br>
                                <input type="radio" name="side" value="left"> Left
                                <input type="radio" name="side" value="right"> Right
                            </div>
                            
                            <div class="form-group">
                        	<input type="submit" name="join_user" class="btn btn-primary" value="Join">
                        </div>
                        </form>
                    </div>
                </div><!--/.row-->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
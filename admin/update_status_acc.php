<?php
	session_start();
	if(!isset($_SESSION['id'])) {
		header('Location:../index.php');
	}
	include('php-includes/check-login.php');
	require_once('php-includes/config.php');
	$userident = $_SESSION['userident'];
	
	$get_userid = $_GET['userid'];
	
	$result=$dbh->prepare("Select * From accountant Where id='$get_userid'");
	$result->execute();
	while($row = $result->fetch(PDO::FETCH_ASSOC)){	
		echo $curr_status = $row['user_status'];
	}
		
	if($curr_status == "Active") {
		$sql = "UPDATE accountant 
        SET user_status=?
		WHERE id=?";
		
		$this_status = "Deactive";
		$q = $dbh->prepare($sql);
		$q->execute(array($this_status, $get_userid));
		header("location: accountant.php");
	} else {
		$sql = "UPDATE accountant
        SET user_status=?
		WHERE id=?";
		
		$this_status = "Active";
		$q = $dbh->prepare($sql);
		$q->execute(array($this_status, $get_userid));
		header("location: accountant.php");
	}
?>
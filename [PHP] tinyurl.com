<?php 
function &tinyurl($url)  {  

	$url = urlencode($url); // Encoded URL
	
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,'http://tinyurl.com/api-create.php?url='.$url);  
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);  
	curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,5);  
	$data = curl_exec($ch);  
	curl_close($ch);

	if ($data == 'Error') {
	  	return 'error';
	  }  else {
	  	return $data;
	  }
	  
}
?>

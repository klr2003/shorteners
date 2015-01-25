<?php
function &post($url) {
	
	$apiKey = '2E7183E5-1BB0-41BD-ACEA-31B94B5B6xxx'; // PO.ST ApiKey
	$url = urlencode($url); // Encoded URL

    $result = file_get_contents("http://po.st/api/shorten?longUrl=".$url."&apiKey=".$apiKey);
    $json = json_decode($result);

    if ($json->{'status_code'} == "0") { 
    	return $json->{'short_url'};
    } else { 
    	return 'error'; 
    }

}
?>

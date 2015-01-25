<?php
function &shst($url){

$id = 'd1c4d0cf18111b12a936130ac2a2axxx'; // sh.st ApiToken
$apiurl="https://api.shorte.st/v1/data/url";
$url = urlencode($url); // Encoded URL

$ch = curl_init();
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_URL, $apiurl);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT' );
curl_setopt($ch, CURLOPT_HTTPHEADER, array('public-api-token: '.$id,'X-HTTP-Method-Override: PUT')); 
curl_setopt($ch, CURLOPT_POSTFIELDS, "urlToShorten=".$url);
$data = curl_exec($ch);
curl_close($ch); 
$obj = json_decode($data);

if ($obj->{'status'} == 'ok') {
	return $obj->{'shortenedUrl'};
} else {
	return 'error';
}

}
?>

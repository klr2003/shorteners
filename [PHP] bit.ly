<?php
function bitly($url) {

    $login = "tricirrecsquare"; // Bit.ly UserName
    $appkey = "R_29a2648e0a5243bfbbcca43c1fdf6a9d"; // Bit.ly AppKey, can be found at 'https://bitly.com/a/settings/advanced'
    $format='json'; // Response format (JSON|XML|TXT, optional)
    
    $bitly_api = 'http://api.bit.ly/v3/shorten?login='.$login.'&apiKey='.$appkey.'&uri='.urlencode($url).'&format='.$format;
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$bitly_api);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,5);
    $data = curl_exec($ch);

    $json = json_decode($data);

    curl_close($ch);

    if ($json->{'status_code'} == '200') {
    	echo $json->data->{'url'};
    } else {
    	echo 'error';
    }

}
?>

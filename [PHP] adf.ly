<?php
function &adfly($url, $title, $folder, $fb_image, $type = "int", $domain = "adf.ly") {
	
	$id = '4089xxx'; // ADFLY UserID
	$key = '6d42667367400d22c5deed273169bxxx'; // ADFLY UserSecretKey
	$url = urlencode($url); // Encoded URL
  $title = urlencode($title); // Title Encoded (optional)
  $folder = urlencode($folder); // FolderName Encoded (optional)
  $fb_image = urlencode($fb_image); // FBImageThumbnail URL Encoded (optional)

    $result = file_get_contents("http://api.adf.ly/api.php?key=".$key."&uid=".$id."&folder=".$folder."&title=".$title."&fb_image=".$fb_image."&advert_type={$type}&domain={$domain}&url=".$url);

    if ($result == "error") { 
    	return "error"; 
    } else { 
    	return $result; 
    }

}
?>

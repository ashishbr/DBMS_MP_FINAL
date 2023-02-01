<?php

include "../connection.php";

$id = $_GET["id"];
mysqli_query($data, "DELETE FROM `user_info`.`organization` where `id`=$id;");

?>

<script type="text/javascript">
window.location = "organizations.php";
</script>
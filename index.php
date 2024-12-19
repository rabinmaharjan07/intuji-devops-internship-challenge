<?php

require_once __DIR__ . '/vendor/autoload.php';  // Include Composer's autoloader

use Silarhi\Hello;  // Use the Hello class from the Silarhi namespace

// Instantiate the Hello class and call the display method
$hello = new Hello();
echo $hello->display() . "\n";  // Should output: "Hello World vlatest"

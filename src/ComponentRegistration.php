<?php
/**
 * Copyright © 2016 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */

$pathList[] = __DIR__ . '/*/*/cli_commands.php';
$pathList[] = __DIR__ . '/*/*/registration.php';
foreach ($pathList as $path) {
    // Sorting is disabled intentionally for performance improvement
    $files = glob($path, GLOB_NOSORT);
    if ($files === false) {
        throw new \RuntimeException('glob() returned error while searching in \'' . $path . '\'');
    }
    foreach ($files as $file) {
        include $file;
    }
}

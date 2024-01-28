<?php
/*
 * This is needed for cookie based authentication to encrypt password in
 * cookie
 */
$cfg['blowfish_secret'] = 'xampp'; /* YOU SHOULD CHANGE THIS FOR A MORE SECURE COOKIE AUTH! */

/*
 * Servers configuration
 */
$i = 0;

/*
 * First server
 */
$i++;

/* Authentication type and info */
$cfg['Servers'][$i]['verbose'] = 'Local Database';
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = $_ENV["MYSQL_USER"];
$cfg['Servers'][$i]['password'] = $_ENV["MYSQL_PASSWORD"];
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Lang'] = '';

/* Bind to the localhost ipv4 address and tcp */
$cfg['Servers'][$i]['host'] = $_ENV["MYSQL_HOSTNAME"];
$cfg['Servers'][$i]['connect_type'] = 'tcp';

$i++;

/* Authentication type and info */
$cfg['Servers'][$i]['verbose'] = 'Local Database Root';
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = $_ENV["MYSQL_ROOT_PASSWORD"];
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Lang'] = '';

/* Bind to the localhost ipv4 address and tcp */
$cfg['Servers'][$i]['host'] = $_ENV["MYSQL_HOSTNAME"];
$cfg['Servers'][$i]['connect_type'] = 'tcp';

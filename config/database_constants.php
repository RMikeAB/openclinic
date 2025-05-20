<?php
/**
 * database_constants.php
 *
 * Definition of database connection variables
 *
 * Licensed under the GNU GPL. For full terms see the file LICENSE.
 *
 * @package   OpenClinic
 * @copyright 2002-2025 jact
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL
 * @author    jact <jachavar@gmail.com>
 */

  require_once(dirname(__FILE__) . "/../lib/exe_protect.php");
  executionProtection(__FILE__);

/**
 * A T T E N T I O N !
 *
 * Please modify the following database connection variables to match
 * the MySQL database and user that you have created for OpenClinic.
 */
  define("OPEN_HOST",       "db");
  define("OPEN_DATABASE",   "openclinic");
  define("OPEN_USERNAME",   "openclinic_user");
  define("OPEN_PWD",        "openclinic_pass");
  define("OPEN_PERSISTENT", true);
  define("OPEN_PORT",       3306);

?>

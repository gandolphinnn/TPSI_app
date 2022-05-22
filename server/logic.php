<?php
require_once("db_access.php");

class Logic {
	function __construct() {
		$this->db = new DbAccess();
	}

	public function getData() {
		//debug(json_encode($this->db->getData()));
		return $this->db->getData();
	}

	public function getApp() {
		return $this->db->select();
	}

	/* public function create($todo) {
		$result = $this->db->create($todo['title'], $todo['date']);
		return $result;
	} */
}
$l = new Logic();
$l->getData();
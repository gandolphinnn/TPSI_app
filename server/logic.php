<?php
require_once("db_access.php");

class Logic {
	function __construct() {
		$this->db = new DbAccess();
	}

	public function getData() {
		return $this->db->getData();
	}

	public function getApp() {
		return $this->db->select();
	}

	public function create($values) {
		return $this->db->create($values);
	}
}
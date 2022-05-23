<?php
	class DbAccess {
		function __construct() {
			$servername = "127.0.0.1";
			$database = "db_immobiliare";
			$username = "root";
			$password = "";
			$this->conn = mysqli_connect($servername, $username, $password, $database);
			if ($this->conn->connect_error) {
				die("Connection failed: " . $this->conn->connect_error);
			}
		}
		public function close() {
			mysqli_close($this->conn);
		}
		private function processQuery($sql) {
			$result = mysqli_query($this->conn, $sql);
			if (mysqli_num_rows($result) > 0):
				$data = [];
				while($row = mysqli_fetch_assoc($result)):
					$data[] = $row;
				endwhile;
				return $data;
			else:
				return false;
			endif;
		}
		public function select($filters) {
			$sql = 'SELECT indirizzo, piano, locali, metratura, canone FROM appartamento ap 
			NATURAL JOIN edificio LEFT JOIN affitto af ON ap.id_appartamento = af.id_appartamento
			WHERE id_affitto IS NOT NULL
			AND ('.$filters['min_metratura'].' IS NULL OR metratura >= '.$filters['min_metratura'].')
			AND ('.$filters['max_metratura'].' IS NULL OR metratura <= '.$filters['max_metratura'].')
			AND ('.$filters['min_locali'].' IS NULL OR locali >= '.$filters['min_locali'].')
			AND ('.$filters['max_locali'].' IS NULL OR locali <= '.$filters['max_locali'].')
			AND ('.$filters['min_canone'].' IS NULL OR canone >= '.$filters['min_canone'].')
			AND ('.$filters['max_canone'].' IS NULL OR canone <= '.$filters['max_canone'].');';
			return $this->processQuery($sql);
		}

		public function getData() {
			$sql = 'SELECT id_cliente, codice_fiscale, cognome, nome FROM cliente';
			$res['clienti'] = $this->processQuery($sql);
			$sql = 'SELECT id_appartamento, indirizzo, piano FROM appartamento NATURAL JOIN edificio';
			$res['appartamenti'] = $this->processQuery($sql);
			return $res;
		}
		
		public function create($values) {
			$sql = 'INSERT INTO affitto (data_inizio, canone, id_appartamento, id_cliente)
					values ("'.$values['inizio'].'", '.$values['canone'].', '
					.$values['appartamento'].', '.$values['cliente'].')';
			$result = mysqli_query($this->conn, $sql);
			return $result;
		}
	}
?>
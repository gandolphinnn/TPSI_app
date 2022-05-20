<?php
	class DbAccess {
		function __construct() {
			$servername = "127.0.0.1";
			$database = "db_immobiliare";
			$username = "root";
			$password = "";
			$this->conn = mysqli_connect($servername, $username, $password, $database);
			// echo '<pre>'.print_r($this->conn, true).'</pre>';
			if ($this->conn->connect_error) {
				die("Connection failed: " . $this->conn->connect_error);
			}
		}
		public function close() {
			mysqli_close($this->conn);
		}
		public function select($filters) {
			$filters = ['min_metratura' => 'null',
						'max_metratura' => 'null',
						'min_locali' => 'null',
						'max_locali' => 'null',
						'min_mensilità' => 'null',
						'max_mensilità' => 'null'];
			$sql = 'SELECT locali, piano, metratura, indirizzo FROM appartamento ap
			NATURAL JOIN edificio
			LEFT JOIN affitto af ON ap.id_appartamento = af.id_appartamento
			WHERE id_affitto IS NULL
			AND ('.$filters['min_metratura'].' IS NULL OR metratura > '.$filters['min_metratura'].')
			AND ('.$filters['max_metratura'].' IS NULL OR metratura < '.$filters['max_metratura'].')
			AND ('.$filters['min_locali'].' IS NULL OR locali > '.$filters['min_locali'].')
			AND ('.$filters['max_locali'].' IS NULL OR locali < '.$filters['max_locali'].')
			AND ('.$filters['min_mensilità'].' IS NULL OR mensilità > '.$filters['min_mensilità'].')
			AND ('.$filters['max_mensilità'].' IS NULL OR mensilità < '.$filters['max_mensilità'].');';
			// die($sql);
			$result = mysqli_query($this->conn, $sql);
			$list = array();
			while ($row = $result->fetch_assoc()) {
				$appartamento = [
					'id_appartamento' => $row['id_appartamento'],
					'locali' => $row['locali'],
					'piano' => $row['piano'],
					'metratura' => $row['metratura'],
				];
				$list[] = $appartamento;
			}
			$this->close($this->conn);
			return $list;
		}
		public function create($inizio, $mensilità, $id_appartamento, $id_cliente) {
			$sql = "INSERT INTO affitto (inizio, mensilità, id_appartamento, id_cliente)
					values ('$inizio', '$mensilità', '$id_appartamento', '$id_cliente')";
			$result = mysqli_query($this->conn, $sql);
			$this->close($this->conn);
			return $result;
		}
	}
	$db = new DbAccess();
	$db->select(0);
?>
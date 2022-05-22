<?php
require_once("logic.php");
/*
*	URL endpoints:
*	[GET] ./mw.php -> dati su appartamenti e clienti
*	[POST] ./mw.php -> inserimento nouovo affitto
*/
class RestService {
	private $httpVersion = "HTTP/1.1";

	private function setHttpHeaders($contentType, $statusCode){
		http_response_code($statusCode);		
		header("Content-Type:". $contentType);
		header("Access-Control-Allow-Origin: *");
	}

	public function returnOk() {
		$this->setHttpHeaders("application/json", 200);
		echo "{\"result\": \"ok\"}";
	}

	public function returnErr($statusCode) {
		$this->setHttpHeaders("application/json", $statusCode);
		echo "{\"result\": \"err\"}";
	}

	public function parseRequest() {
		try {
			$logic = new Logic();
			switch($_SERVER['REQUEST_METHOD']) {
				case 'GET':
					if (isset($_GET['data'])):
						$result = $logic->getData();
					elseif (isset($_GET['app'])):	
						$result = $logic->getApp();
					endif;
					$this->setHttpHeaders("application/json", 200);
					$jsonResponse = json_encode($result);
					echo $jsonResponse;
				break;
				case 'POST':
					$data = json_decode(file_get_contents('php://input'), true);
					$result = $logic->create($data);
					if ($result) {
						$this->returnOk();
					} else {
						$this->returnErr(400);
					}
				break;
			}
		} catch (Exception $e) {
			echo $e->getMessage();
		}	
	}
}

$restService = new RestService();
$restService->parseRequest();
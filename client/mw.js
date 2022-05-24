class Middleware {
	constructor() {
		this.url = '../../server/mw.php';
	}
	//* inserisci nuovo affitto
	create(data) {
		const body = JSON.stringify(data);
		this.connect('POST', this.url, body, (res) => {
			if (res) {
				alert('Affitto aggiunto correttamente')
			}
			else {
				alert('Errore');
			}
		})
	}
	//* ottieni gli appartamenti
	getApp(callback, filters) {
		let action = (response) => {
			const data = JSON.parse(response);
			callback(data);
		};
		this.connect('GET', this.url + '?app=true' + filters, null, action);
	}
	//* ottieni i dati su app e clienti per la INSERT
	getData(callback) {
		let action = (response) => {
			const data = JSON.parse(response);
			callback(data);
		};
		this.connect('GET', this.url + '?data', null, action);
	}
	//* connettiti al server
	connect(method, url, body, callback) {
		const xhr = new XMLHttpRequest();
		xhr.open(method, url);
		xhr.onload = () => {
			if (xhr.status != 200) { 
				alert(`Error ${xhr.status}: ${xhr.statusText}`);
			} else { 
				callback(xhr.response);
			}
		}
		xhr.send(body);
	}
}
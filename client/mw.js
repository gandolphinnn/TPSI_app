class Middleware {
	constructor() {
		this.url = '../../server/mw.php';
	}
	create(data) {
		const body = JSON.stringify(data);
		this.connect('POST', this.url, body, (res) => {
			if (res) {
				if(confirm('Affitto aggiunto correttamente, vuoi tornare alla home?')) {
					window.location.href = "../";
				}
			}
			else {
				alert('Errore');
			}
		})
	}
	getApp(callback, filters) {
		let action = (response) => {
			console.log(response);
			const data = JSON.parse(response);
			callback(data);
		};
		this.connect('GET', this.url + '?app=true&' + filters, null, action);
	}
	getData(callback) {
		let action = (response) => {
			const data = JSON.parse(response);
			callback(data);
		};
		this.connect('GET', this.url + '?data', null, action);
	}
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
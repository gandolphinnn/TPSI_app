class Middleware {
	constructor() {
		this.url = '../../server/mw.php';
	}
	/* create(todo, callback) {
		const body = JSON.stringify(todo);
		this.connect('POST', this.url, body, () => {
		})
		callback(); 
	}
	getApp(callback) {
		let action = (response) => {
			console.log(response);
			const data = JSON.parse(response);
			callback(data);
		};
		this.connect('GET', this.url + '?app', null, action);
	} */
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
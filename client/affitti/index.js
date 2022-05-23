class Presenter {
	constructor() {
		this.middleware = new Middleware();
		this.middleware.getData(this.init);
	}
	//* init della view con gli eventi e i dati
	init() {
		document.querySelector("#inizio").value = new Date().toISOString().split('T')[0];
		document.querySelector("#conferma").addEventListener('click', () => {
			this.add();
		});
		document.querySelector("#reset").addEventListener('click', () => {
			document.querySelector("#cliente").value = '';
			document.querySelector("#appartamento").value = '';
			document.querySelector("#inizio").value = '';
			document.querySelector("#canone").value = '';
		});

		let template = '<option value="%VALUE">%TITLE</option>';
		data.clienti.forEach(cl => {
			let option = template.replace("%VALUE", cl.id_cliente);
			let titolo = 'id: '+cl.id_cliente+', '+cl.cognome+' '+cl.nome+', '+cl.codice_fiscale;
			option = option.replace('%TITLE', titolo);
			document.querySelector('#cliente').innerHTML += option;
		});
		
		data.appartamenti.forEach(app => {
			let option = template.replace("%VALUE", app.id_appartamento);
			let titolo = 'id: '+app.id_appartamento+', '+app.indirizzo+' '+app.piano+' piano';
			option = option.replace('%TITLE', titolo);
			document.querySelector('#appartamento').innerHTML += option;
		});
	}
	//* nuovo affitto
	add() {
		const data = {
			cliente: document.querySelector("#cliente").value,
			appartamento: document.querySelector("#appartamento").value,
			inizio: document.querySelector("#inizio").value,
			canone: document.querySelector("#canone").value
		};
		this.middleware.create(data);
	}
}
window.onload = () => {
	let presenter = new Presenter();
}
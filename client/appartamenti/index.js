class Presenter {
	constructor() {
		this.filtersArr = [];
		this.init();
		this.middleware = new Middleware();
		this.middleware.getApp(this.refresh, '');
	}
	init() {
		document.querySelectorAll('input').forEach(input => {
			this.filtersArr.push({
				key: input.id,
				value: ''
			});
			input.onkeyup = () => {
				this.filter(input.id, input.value);
			}
			input.onclick = () => {
				this.filter(input.id, input.value);
			}
		});
	}
	filter(id, value) {
		let filters = '';

		this.middleware.getApp(this.refresh, filters);
	}
	refresh(data) {
		const template = '<tr><td>%INDIRIZZO</td><td>%PIANO</td><td>%LOCALI</td><td>%METRATURA</td><td>%CANONE</td></tr>'
		data.forEach(appartamento => {
			let row = template.replace('%INDIRIZZO', appartamento.indirizzo);
			row = row.replace('%PIANO', appartamento.piano);
			row = row.replace('%LOCALI', appartamento.locali);
			row = row.replace('%METRATURA', appartamento.metratura);
			row = row.replace('%CANONE', appartamento.canone);
			document.querySelector('#appartamenti').innerHTML += row;
		});
	}
}

let presenter;
window.onload = () => {
	presenter = new Presenter();
}
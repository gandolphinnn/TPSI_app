class Presenter {
	constructor() {
		this.middleware = new Middleware();
		this.filtersArr = {}; //* array di filtri
		this.init();
	}
	//* inizializza la vista
	init() {
		document.querySelectorAll('input').forEach(input => {
			this.filtersArr[input.id] = 'null';
			input.onkeyup = () => {
				if (input.value < 0) input.value = 0;
				this.filtersArr[input.id] = (input.value != ''? input.value : 'null');
				this.update();
			}
			input.onclick = () => {
				if (input.value < 0) input.value = 0;
				this.filtersArr[input.id] = (input.value != ''? input.value : 'null');
				this.update();
			}
		});
		this.update();
	}
	//* update dei filtri
	update() {
		let filterGet = '';
		Object.entries(this.filtersArr).forEach(filter => {
			let oppositeFilter;
			if (filter[0].slice(0, 3) == 'min') {
				oppositeFilter = 'max' + filter[0].slice(3);
			}
			else {
				oppositeFilter = 'min' + filter[0].slice(3);
			}
			document.querySelector('#' + oppositeFilter).setAttribute(filter[0].slice(0, 3), filter[1]);
			if (filter[1] != '') {
				filterGet += '&'+filter[0]+'='+(filter[1] < 0? 'null' : filter[1]);
			}
		});
		this.middleware.getApp(this.refresh, filterGet);
	}
	//* refresh della view
	refresh(data) {
		if (!data) {
			document.querySelector('#appartamenti').innerHTML = '<tr>Nessun appartamento trovato</tr>';
			return;
		}
		const template = '<tr><td>%INDIRIZZO</td><td>%PIANO</td><td>%LOCALI</td><td>%METRATURA</td><td>%CANONE</td></tr>'
		document.querySelector('#appartamenti').innerHTML = '';
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
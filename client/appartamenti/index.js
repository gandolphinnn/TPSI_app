const titolo = document.getElementById('titolo');
const contenuto = document.getElementById('contenuto');
class Presenter {
	constructor() {
		this.init();
		this.middleware = new Middleware();
		this.middleware.read(this.refresh);
	}

	init() {
		document.querySelector("#date").value = new Date().toISOString().split('T')[0];
		document.querySelector("#send")
		.addEventListener('click', () => {
			this.add();
		});
	}

	add() {
		const todo = {
			title: document.querySelector("#title").value,
			date: document.querySelector("#date").value
		}
		document.querySelector("#title").value = "";
		this.middleware.create(todo, this.refresh);
	}

	remove(index) {
		this.middleware.delete(index, this.refresh);
	}

	complete(index) {
		this.middleware.complete(index, this.refresh);
	}

	refresh(list) {
		let template = `
			<li class="element">
				<div class="title %COMPLETE">%TITLE</div>
				<button class="complete" onclick="presenter.complete(%ID)">V</button>
				<button class="delete" onclick="presenter.remove(%ID)">X</button>
			</li>
		`;
		let html = "";
		list.forEach(element => {
			let date = new Date(element.date);

			let row = template.replace("%TITLE", date.toLocaleDateString() + ": " + element.title);
			row = row.replace("%ID", element.id);
			row = row.replace("%ID", element.id);
			row = row.replace("%COMPLETE", element.completed == '1' ? "complete" : "");
			row = row.replace("%COMPLETE", element.completed == '1' ? "complete" : "");
			html += row;
		});
		document.querySelector('ul').innerHTML = html;
	}
}

let presenter;
window.onload = () => {
	presenter = new Presenter();
}
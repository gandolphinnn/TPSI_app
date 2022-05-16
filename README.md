# TPSI_app

# testo
	Una agenzia immobiliare gestisce gli affitti di appartamenti di una zona della
	città.
	Gli appartamenti sono ubicati in palazzi identificati tramite codice, e
	caratterizzati da numero di locali, un piano, una metratura. Gli affitti hanno
	una data di partenza, una durata, un canone mensile che varia da
	appartamento ad appartamento, e sono associati ad un cliente, identificato da
	un codice fiscale.
	Scrivere una applicazione distribuita che:
	- permetta di inserire un nuovo affitto noti il codice dell'appartamento, il
	codice del cliente, canone, data di partenza;
	- permetta di ricercare gli appartamenti non affittati con metratura tra indice
	minimo e massimo impostati dall'utente, e/o numero di locali tra minimo e
	massimo impostati dall'utente, e/o infine un canone compreso tra un minimo
	ed un massimo impostati dall'utente.

# entità
	Utente: (id_utente PK, username U, password);
	Edificio: (id_edificio PK, indirizzo U, piani, appartamenti);
	Appartamento: (id_appartamento PK, locali, piano, metratura, id_edificio FK);
	Affitto: (id_affitto PK, inizio, fine, mensilità, mesi_pagati, id_appartamento FK, id_cliente FK);
	Cliente: (id_cliente PK, CF U, nome, cognome, data_nascità, contatto U);

# root
 |__!db
 |	 |__db_appartamenti.sql
 |
 |__auth
 |	 |__login
 |	 |__logout
 |
 |__admin
 |	 |__index.php
 |	 |__appartments
 |	 |	 |__* showAll !!
 |	 |	 |__add
 |	 |	 |__edit
 |	 |__rents
 |		 |__* showAll
 |		 |__add !!
 |		 |__edit
 |
 |__includes
	 |__fontend
	 |	 |__style.css
	 |__backend
		 |__main.php
		 |__config.php
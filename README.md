# TPSI_app

# Ruoli
	Gandolfi	: project manager, backend developer
	Ademi		: database administrator
	Di Florio	: frontend developer

# Testo
	Una agenzia immobiliare gestisce gli affitti di appartamenti di una zona della
	città.
	Gli appartamenti sono ubicati in palazzi identificati tramite codice, e
	caratterizzati da numero di locali, un piano, una metratura. Gli affitti hanno
	una data di partenza, una durata, un canone mensile che varia da
	appartamento ad appartamento, e sono associati ad un cliente, identificato da
	un codice fiscale.
	Scrivere una applicazione distribuita che:
	1) permetta di inserire un nuovo affitto noti il codice dell'appartamento, il
	codice del cliente, canone, data di partenza;
	2) permetta di ricercare gli appartamenti non affittati con metratura tra indice
	minimo e massimo impostati dall'utente, e/o numero di locali tra minimo e
	massimo impostati dall'utente, e/o infine un canone compreso tra un minimo
	ed un massimo impostati dall'utente.

# Entità
	Utente: (id_utente PK, username U, password);
	Edificio: (id_edificio PK, indirizzo U, piani, appartamenti);
	Appartamento: (id_appartamento PK, locali, piano, metratura, id_edificio FK);
	Affitto: (id_affitto PK, inizio, fine, mensilità, mesi_pagati, id_appartamento FK, id_cliente FK);
	Cliente: (id_cliente PK, CF U, nome, cognome, data_nascità, contatto U);
	image.png

# Query
	1) INSERT INTO affitto (inizio, mensilità, id_appartamento, id_cliente)
		VALUES($inizio, $mensilità, $id_appartamento, $id_cliente)

	2) //SELECT ap.* FROM appartamento ap LEFT JOIN affitto af WHERE
	SELECT * FROM abitazione ab LEFT JOIN affitto af ON af.id_abitazione = ab.id_appartamento;

# Root
 |__!db
 |	 |__db_appartamenti.sql
 |
 |__server
 |	 |__
 |
 |__client
	 |__index.html
	 |__index.html
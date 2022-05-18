# Team
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
	Edificio: (id_edificio PK, codice U, indirizzo, piani, appartamenti);
	Appartamento: (id_appartamento PK, locali, piano, metratura, id_edificio FK);
	Affitto: (id_affitto PK, data_inizio, data_fine, mensilità, mesi_pagati,
		id_appartamento FK, id_cliente FK);
	Cliente: (id_cliente PK, codice_fiscale U, nome, cognome, data_nascita, telefono U);

# Query
	1) INSERT INTO affitto (inizio, mensilità, id_appartamento, id_cliente)
	VALUES($inizio, $mensilità, $id_appartamento, $id_cliente)

	2) SELECT ap.* FROM appartamento ap LEFT JOIN affitto af ON ap.id_appartamento = af.id_appartamento
		WHERE id_affitto IS NULL
		AND ($min_metratura IS NULL OR $max_metratura IS NULL
			OR metratura BETWEEN $min_metratura AND $max_metratura)
		AND ($min_locali IS NULL OR $max_locali IS NULL
			OR locali BETWEEN $min_locali AND $max_locali)
		AND ($min_mensilità IS NULL OR $max_mensilità IS NULL
			OR mensilità BETWEEN $min_mensilità AND $max_mensilità);

# Root
	|__!db
	|	 |__db_immobiliare.sql		(file di creazione db)			(Ademi)
	|	 |__db_schema.png		(schema logico db)			(Ademi)
	|
	|__server
	|	 |__db_access.php		(accesso al db)				(Ademi)
	|	 |__logic.php			(logica di accesso al db)		(Gandolfi)
	|	 |__mw.php			(middleware server)			(Gandolfi)
	|
	|__client
		|__index.html			(view)					(Di Florio)
		|__index.js			(view presenter)			(Di Florio / Gandolfi)
		|__mw.js			(middleware  client)			(Gandolfi)
		|__style.css			(css)					(Di Florio)
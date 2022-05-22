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
	Affitto: (id_affitto PK, data_inizio, data_fine, canone, mesi_pagati,
		id_appartamento FK, id_cliente FK);
	Cliente: (id_cliente PK, codice_fiscale U, nome, cognome, data_nascita, telefono U);

# Query
	pre 1) SELECT id_appartamento, indirizzo, piano FROM appartamento NATURAL JOIN edificio;
	pre 1) SELECT id_cliente, codice_fiscale, cognome, nome FROM cliente;
	1) INSERT INTO affitto (inizio, canone, id_appartamento, id_cliente)
	VALUES($inizio, $canone, $id_appartamento, $id_cliente)

	2) SELECT ap.* FROM appartamento ap LEFT JOIN affitto af ON ap.id_appartamento = af.id_appartamento
		WHERE id_affitto IS NULL
		AND ($min_metratura IS NULL OR metratura > $min_metratura)
		AND ($max_metratura IS NULL OR metratura < $max_metratura)
		AND ($min_locali IS NULL OR locali > $min_locali)
		AND ($max_locali IS NULL OR locali < $max_locali)
		AND ($min_canone IS NULL OR canone > $min_canone)
		AND ($max_canone IS NULL OR canone < $max_canone);

# Root
	|___!db
	|	|___db_immobiliare.sql	(file di creazione db)		(Ademi)
	|	|___db_schema.png	(schema logico db)		(Ademi)
	|
	|___server
	|	|___db_access.php	(accesso al db)			(Ademi)
	|	|___logic.php		(logica di accesso al db)	(Gandolfi)
	|	|___mw.php		(middleware server)		(Gandolfi)
	|
	|___client
		|___index.html		(homepage)			(Di Florio)
		|___mw.js		(middleware  client)		(Gandolfi)
		|___style.css		(css)				(Di Florio)
		|___affitti
		|	|___index.html	(view)				(Di Florio)
		|	|___index.js	(view presenter)		(Di Florio / Gandolfi)
		|___appartamenti
			|___index.html	(view)				(Di Florio)
			|___index.js	(view presenter)		(Di Florio / Gandolfi)

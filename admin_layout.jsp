<%@page import="java.util.LinkedList" %>

<%@page import="java.util.List" %>

<%@page import="start.ConnectionDB" %>

<!DOCTYPE html>
<html>
<head>
	<title>sozialraumApp</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style type="text/css">
	.spacer{ min-height: 50px; }
</style>


	<nav class="navbar navbar-default " id="scrollMenu">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="index.jsp">Sozialraum</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Sozialraum</a></li>
					<li><a href="#">Angebote</a></li>
					<li><a href="#">Logout</a></li>
					<li><a href="impressum.html">Impressum</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- Eintrag anlegen -->
	<div class="row">
		<div class="container text-center">
			<div class="col-xs-12">
				<h2>
					Eintrag erstellen
				</h2>
			</div>
			<div class="spacer"></div>
			<form ACTION="" METHOD="">
				<div class="form-group col-xs-12">
					<div class="col-xs-12 col-sm-3">
						<label for="traeger">Veranstalter/Träger:</label>
						<input type="text" class="form-control" id="traeger">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="straße">Straße:</label>
						<input type="text" class="form-control" id="straße">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="hausnummer">Hausnummer:</label>
						<input type="text" class="form-control" id="hausnummer">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="plz">Postleitzahl:</label>
						<input type="text" class="form-control" id="plz">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="tel">Telefonnummer:</label>
						<input type="text" class="form-control" id="tel">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="fax">Faxnummer:</label>
						<input type="text" class="form-control" id="fax">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="mail">Kontakt e-Mail:</label>
						<input type="text" class="form-control" id="mail">
					</div>
					<div class="col-xs-12 col-sm-3">
						<label for="website">Webseite:</label>
						<input type="text" class="form-control" id="website">
					</div>
					<div class="spacer col-xs-12"></div>
					<div class="col-xs-12">
						<label for="beschreibung">Angebotsbeschreibung inkl. Sprache und Zielgruppe (max 700 Zeichen):</label>
						<textarea class="form-control" maxlength="700" rows="5" id="beschreibung"></textarea>
					</div>
					<div class="spacer col-xs-12"></div>
					
					<div class="col-xs-12">
						<form ACTION="" METHOD="post">
							<div class="col-xs-6">
								<span class="col-xs-12"> Einfügen in:</span>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<select class="form-control" id="sel1" name="unterkat_options">
										<%
										ConnectionDB con = new ConnectionDB();
										List<String> unterkategorien = new LinkedList<String>();
										unterkategorien = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
										for(String uk : unterkategorien)
										{
										%>
										<option><%= uk %></option>
										<%} %>
									</select>
								</div>
							</div>
						</form>
					</div>
					
					<div class="spacer col-xs-12"></div>
					<div class="col-xs-12 text-center">
						<div class="col-sm-4 hidden-xs"></div>
						<button class="btn btn-success col-xs-12 col-sm-4 ">Eintragen</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr>
<!-- Kategorie anlegen/löschen verwaltung -->
	<div class="row">
		<div class="container text-center">
			<div class="col-xs-12">
				<h2>Kategorie erstellen</h2>
			</div>
			<div class="col-xs-12 col-sm-6">
				<h3>Oberkategorie wählen</h3>

				<div class="col-xs-12">
					<form ACTION="oberkategorie_hinzufuegen.jsp" METHOD="post">
						<div class="col-xs-6">
							<div class="form-group">
								<input type="text" class="form-control" id="uk" name="oberkat">
							</div>
						</div>
						<div class="col-xs-6">
							<button class="btn btn-success col-xs-12"> Hinzufügen</button>
						</div>
					</form>
				</div>
				<div class="col-xs-12">
					<form ACTION="oberkategorie_delete.jsp" METHOD="post">
						<div class="col-xs-6">
							<div class="form-group">
							  <select class="form-control" id="sel1" name="oberkat_options">
							  <%
							  	ConnectionDB con2 = new ConnectionDB();
								List<String> oberkategorie = new LinkedList<String>();
								oberkategorie = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
								for(String ok : oberkategorie)
								{
							  %>
							     <option><%= ok %></option>
							   <%} %>
							  </select>
							</div>
						</div>
						<div class="col-xs-6">
							<button class="btn btn-danger col-xs-12"> Löschen</button>
						</div>
					</form>
				</div>

			</div>

			<div class="col-xs-12 col-sm-6">
				<h3>Unterkategorie wählen</h3>
				<div class="col-xs-12">
					<form ACTION="unterkategorie_hinzufuegen.jsp" METHOD="post">
						<div class="col-xs-6">
							<div class="form-group">
								<input type="text" class="form-control" id="uk" name="unterkat">
							</div>
						</div>
						<div class="col-xs-6">
							<button class="btn btn-success col-xs-12"> Hinzufügen</button>
						</div>
					</form>
				</div>
				<div class="col-xs-12">
					<form ACTION="unterkategorie_delete.jsp" METHOD="post">
						<div class="col-xs-6">
							<div class="form-group">
							  <select class="form-control" id="sel1" name="unterkat_options">
							  <%
							  	
								List<String> unterkategorien_add = new LinkedList<String>();
								unterkategorien_add = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
								for(String uk : unterkategorien_add)
								{
							  %>
							     <option><%= uk %></option>
							   <%} %>
							  </select>
							</div>
						</div>
						<div class="col-xs-6">
							<button class="btn btn-danger col-xs-12"> Löschen</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<div class="spacer"></div>
	
	<hr>

	<!-- Eintrag löschen -->
	<div class="row text-center">
		<div class="container">
			<div class="col-xs-12">
				<h2>
					Eintrag löschen
				</h2>
				<div class="spacer"></div>
			</div>
			<!-- auswählen der Ober- Unterkategorie-->
			<div class="spacer"></div>
			<form ACTION="" METHOD="post">
				<div class="col-xs-12 col-sm-6">
					<div class="col-xs-6 col-xs-offset-3">
						<div class="form-group">
							<label for="options">
								Aus folgender Oberkategorie:
							</label>
							<select class="form-control" id="sel1" name="options">
								<%
									
									List<String> oberkategorien = new LinkedList<String>();
									oberkategorien = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
									for(String ok : oberkategorien)
									{
								%>
								<option><%= ok %></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div class="col-xs-6 col-xs-offset-3">
						<div class="form-group">
							<label for="unterkat_options"> und ggf. Unterkategorie:</label>
							<select class="form-control" id="sel1" name="unterkat_options">
								<%
								
								List<String> unterkategorien_delete = new LinkedList<String>();
								unterkategorien_delete = con.data("SELECT * FROM sozialraum_db.kategorie;","name");
								for(String uk : unterkategorien_delete)
								{
								%>
								<option><%= uk %></option>
								<%} %>
							</select>
						</div>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="spacer"></div>
					<div class=" col-sm-4"></div>
					<div class="col-sm-4">
						<button class="btn btn-success col-xs-12"> Anzeigen</button>
					</div>
				</div>
				
			</form>
			<!-- auswählen des zu löschenden Beitrags -->
			<div class="col-xs-12">
				<form ACTION="" METHOD="">
					<div class="form-group">
						<div class="spacer"></div>
						<label for="sel2">Wähle die zu löschenden Einträge aus</label>
						<div class="spacer"></div>
						<%
		
						String traegername = "/*mySQL anfrage zu */";
						int plz = 12345;
						String straßeNr = "/*mySQL anfrage zu */";
						String telefon = "/*mySQL anfrage zu */";
						String fax = "/*mySQL anfrage zu */";
						String ansprechpartner = "/*mySQL anfrage zu */";
						String mailadresse = "/*mySQL anfrage zu */";
						String website= "/*mySQL anfrage zu */";
						String angebot= "/*mySQL anfrage zu */";
						while (true){
						//schleife um die Einträge aus der Datenbank zu holen 
						%>
						<div class="checkbox col-xs-12">
							<input type="checkbox" value="">
							<div class="row well text-left">	
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-8">
										<h4>Träger :</h4>
										<span><%= traegername%></span>
									</div>
									<div class="col-xs-12 col-sm-4">
										<h4>Wo:</h4>
										<span><%= straßeNr%></span>
										<span><%= plz%></span>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="col-xs-12 col-sm-8">
										<h4>Beschreibung: </h4>
										<span><%= angebot%></span>
									</div>
									<div class="col-xs-12 col-sm-4">
										<h4>Ansprechpartner;</h4>
										<span><%= ansprechpartner%></span>
										<span><%= telefon%></span>
										<span><%= fax%></span>
										<span><%= mailadresse%></span>
										<span><%= website%></span>
									</div>
								</div>
							</div>
						</div>
						<%
							break;}
						%>

					<div class="spacer"></div>
					<div class=" col-sm-4"></div>
					<div class="col-sm-4">
						<button class="btn btn-danger col-xs-12"> Einträge löschen</button>
					</div>
					<div class="col-xs-12" style="height: 75px;" ></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

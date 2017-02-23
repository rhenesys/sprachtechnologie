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
	body{
	padding: 0px;
	margin: 0px;
}
.row {
	margin:0px;
}
p{
	padding: 25px;
	font-size: 2em;
}
img{
	border-radius: 500px;
	margin-left: auto;
	margin-right: auto;
}
button, 
input,
select{
	padding: 10px;
}
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
        <li><a href="#">Admin</a></li>
      	<li><a href="impressum.html">Impressum</a></li>
      </ul>
    </div>
  </div>
</nav>
	<!-- Kategorie anlegen/löschen -->
	<div class="row">
		<div class="container text-center">
			<div class="col-xs-12 col-sm-6">
				<h2>Oberkategorie wählen</h2>
				
				<div class="col-xs-12">
					<form ACTION="oberkategorie_delete.jsp" METHOD="post">
					<div class="col-xs-6">
						<button class="btn btn-danger col-xs-12"> Löschen</button>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
						  <select class="form-control" id="sel1" name="options">
						  <%
						  	ConnectionDB con = new ConnectionDB();
							List<String> oberkategorien = new LinkedList<String>();
							oberkategorien = con.data("SELECT * FROM sozialraum_db.oberkategorien;","oberkategorie");
							for(String ok : oberkategorien)
							{
						  %>
						    <option><%= ok %></option>
						   <%} %>
						  </select>
						</div>
					</div>
					</form>
				</div>
				
				<div class="col-xs-12">
					<form ACTION="oberkategorie_hinzufuegen.jsp" METHOD="post">
						<div class="col-xs-6">
							<button class="btn btn-success col-xs-12"> Hinzufügen</button>
						</div>
						<div class="col-xs-6">
							<input type="text" class="form-control" id="ok" name="oberkat">
						</div>
					</form>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6">
				<h2>Unterkategorie wählen</h2>
				<div class="col-xs-12">
				<form ACTION="unterkategorie_delete.jsp" METHOD="post">
					<div class="col-xs-6">
						<button class="btn btn-danger col-xs-12"> Löschen</button>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
						  <select class="form-control" id="sel1" name="unterkat_options">
						  <%
						  	ConnectionDB con2 = new ConnectionDB();
							List<String> unterkategorien = new LinkedList<String>();
							unterkategorien = con.data("SELECT * FROM sozialraum_db.unterkategorien;","unterkategorie");
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
				
				<div class="col-xs-12">
				<form ACTION="unterkategorie_hinzufuegen.jsp" METHOD="post">
					<div class="col-xs-6">
						<button class="btn btn-success col-xs-12"> Hinzufügen</button>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<input type="text" class="form-control" id="uk" name="unterkat">
						</div>
					</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<div class="spacer"></div>
	<!-- Eingabefelder -->
	<div class="row">
		<div class="container">
			
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
					<label for="beschreibung">Angebotsbeschreibung inkl. Sprache und Zielgruppe:</label>
					<textarea class="form-control" rows="5" id="beschreibung"></textarea>
				</div>
				<div class="spacer col-xs-12"></div>
				<div class="col-xs-12 text-center">
					<div class="col-sm-4 hidden-xs"></div>
					<button class="btn btn-success col-xs-12 col-sm-4 ">Eintragen</button>
				</div>
			</div>

		</div>
	</div>

	
</body>
</html>

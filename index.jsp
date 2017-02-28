
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="start.Unter_Kategorie" %>

<%@page import="java.util.LinkedList" %>

<%@page import="java.util.List" %>

<%@page import="start.ConnectionDB" %>





<!DOCTYPE html>
<html>
<head>
	<title>SozialraumApp</title>
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
	#toplevel{
	margin-top: 60px;
	}
</style>
<nav class="navbar navbar-default navbar-fixed-top"  id="scrollMenu">
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
					<li><a href="neuhier.html">Neu hier?</a></li>
					<li><a href="angebote.jsp">Angebote</a></li>
					<li><a href="feedback.jsp">Feedback</a></li>
					<li><a href="admin_layout.jsp">Admin</a></li>
					<li><a href="impressum.html">Impressum</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="row" id="toplevel">
		<div class="container text-center">
			<h1>SozialraumApp</h1>
		<div>
		<%
			ConnectionDB conn = new ConnectionDB();
			List<String> kategorien = new LinkedList<String>();
			kategorien = conn.data("SELECT * FROM sozialraum_db.kategorie WHERE id IN(SELECT kat_id from sozialraum_db.kategorie_mapping WHERE parent_id = 1);","name");
			for(int i = 0; i < kategorien.size(); ++i)
			{
				String oberkategorie = kategorien.get(i);
			//schleife um die Einträge aus der Datenbank zu holen und die Bilder zu bezeichnen
		%>
		
		<div class="col-xs-12 col-sm-4">
			 <img src="zeigeKategorieBilder.jsp" name="Sozialraum" width="150" height="150">  
			<!-- <img src="https://placehold.it/300x300?text=OK" class="img-responsive .img-circle">  -->
			<!-- href von unterkategorien speisen lassen damit die links funktionieren -->
			<p><a href="unterkat_index.jsp?oberkategorie=<%=oberkategorie %>" id=<%=oberkategorie%>><%= oberkategorie%></a></p>
		</div>
		<% }%>

	</div>
	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	

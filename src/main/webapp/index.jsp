<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello World!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>

	<p>
		This was triggered by Jenkins with a CI/CD Pipeline via AWS ElasticBeanstalk CLI!
	</p>
</body>
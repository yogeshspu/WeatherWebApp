<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Properties"  %>

<%@ page import="java.util.Enumeration"  %>

<%@ page import="java.io.FileInputStream"  %>

<!DOCTYPE html PUBLIC  "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

</head>

 

<script>

 

function getCityWeatherInfo() {

 

       

   	//alert (document.getElementById("City").value);


   	var xmlObj = new XMLHttpRequest();
   	//String location = "nome, ak";
   	//String YQL = String.format("select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"%s\")", location);
   	//String endpoint = String.format("https://query.yahooapis.com/v1/public/yql?q=%s&format=json",Uri.encode(YQL));	
   	var reqURL = "https://api.forecast.io/forecast/cb5ecf87bd42d63b9112b9a409e3c018/33.8688,151.2093";
   	System.out.println("HTTP REQUEST for URL" + reqURL );
   	xmlObj.open("GET",reqURL,fasle);
   	
   	System.out.println("HTTP RESPONSE RECEIVED: " +xmlObj.responseText);
   	
   	var r = JSON.parse(xmlObj.response);
   	

       document.getElementById("U1").innerHTML = "";

       document.getElementById("WT1").innerHTML = "";

       document.getElementById("T1").innerHTML = "";

       document.getElementById("W1").innerHTML = "";

}

 

</script>

 

<body>

 

<Table>

<% Properties cityProps = new Properties();
String appPath = application.getRealPath("");
String pathSeparator = System.getProperty("separator");

appPath = appPath +"\\" + "Cities.properties";
//System.out.println(" ERROR NEW : " + application.getRealPath(request.getContextPath()));
FileInputStream in = new FileInputStream(appPath);

cityProps.load(in);
in.close();

 

Enumeration codesandCities = cityProps.propertyNames();

   

   

%>

 

 

<tr><td>City</td> <td> <select name="Cities" id="City" onchange="getCityWeatherInfo()">

  <option value="">Select a City</option>

  <% while (codesandCities.hasMoreElements()) {

         String key = (String) codesandCities.nextElement();

         %>

  

  <option value="<%=key %> "> <%=cityProps.getProperty(key) %></option>

  <% } %>

</select></td></tr>

<tr><td>Updated time</td><td> <div id="U1"> Thursday 11:00 AM </div> </td></tr>

<tr><td>Weather</td><td><div id="WT1">Mostly Cloudy </div> </td></tr>

<tr><td>Temperature</td><td><div id="T1"> 9°C </div> </td></tr>

<tr><td>Wind</td><td> <div id="W1"> 32km/h </div> </td></tr>



</Table>

 

</body>

</html>

 



 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Weather WebApp </title>

</head>

<script> 

function getCityWeatherInfo() {

       
 var cityWOEID = document.getElementById("City").value;
      
 var apiKey ="9b6aa2ae3806c58d086542b07819d232";

 var xmlObj = new XMLHttpRequest();

 var reqURL = "http://api.openweathermap.org/data/2.5/weather?id=" + cityWOEID + "&appid=" + apiKey;

 // http://api.openweathermap.org/data/2.5/weather?id=2147714&appid=9b6aa2ae3806c58d086542b07819d232
 
 xmlObj.open("GET",reqURL,false);
 xmlObj.send();
 
 var resp = xmlObj.responseText;
 var r = JSON.parse(resp);
 

 var tmp = r.main.temp;
  var wind = r.wind.speed;
 var weather = r.weather[0].description;
 var updatedTime = r.dt;
  
 document.getElementById("T1").innerHTML = tmp;
 document.getElementById("W1").innerHTML = wind;
 document.getElementById("WT1").innerHTML = weather;
 document.getElementById("U1").innerHTML = updatedTime ;

}

</script>

<body>
<Table>
<tr><td>City</td> <td> <select name="Cities" id="City" onchange="getCityWeatherInfo()">

  <option value="">Select a City</option>

  <option value="2147714">Sydney</option>

  <option value="2158177">Melbourne</option>

  <option value="7839791">Wollongong</option>

</select></td></tr>
<tr><td>Updated time </td><td> <div id="U1">  </div> </td></tr>

<tr><td>Weather </td><td><div id="WT1"> </div> </td></tr>

<tr><td>Temperature </td><td><div id="T1">  </div> </td></tr>

<tr><td>Wind </td><td> <div id="W1">  </div> </td></tr>

</Table>

 
</body>

</html>



# Brilliant Labs Cloud API


*  [HTTP Communication](#head_http_communication)
    *  [Overview](#head_http_overview)
    *  [Headers](#head_http_headers)
    *  [Examples](#head_http_examples)
*  [Variables](#head_variables)
    *  [Overview](#head_overview)
    *  [Create Variable](#head_create_variable)
    *  [Erase Variable](#head_erase_variable)
    *  [Set Variable](#head_set_variable)
    *  [Get Variable](#head_get_variable)
*  [Charts](#head_charts)
    *  [Overview](#head_charts_overview)
    *  [Create Chart](#head_create_chart)
    *  [Erase Chart](#head_erase_chart)
    *  [Erase Chart Data](#head_erase_chart_data)
    *  [Add Chart Point](#head_add_chart_point)
    
 

## <a name="head_http_communication"></a> HTTP Communication
#### <a name="head_http_overview"></a> Overview

Communicating to the Brilliant Labs Cloud can be done threw a **GET** https request, whereas the content of the body is a json string with a given command. The primary use case for communicating threw https is for devices that do not have the capabilities of communicating threw a websocket connection. The server only accepts connections over SSL.

**The URL for https requests: **: https://cloud.brilliantlabs.ca/api

#### <a name="head_http_headers"></a> Headers
The required headers:

| Header | Value |
| ------ | ------ |
| Content-Type | application/json |
#### <a name="head_http_examples"></a> Examples

**Command Line cURL**
```terminal
curl -d '{"cmd":"CREATE_VARIABLE", "key":"123","value":5, "name":"TestVariable"}' -H "Content-Type: application/json" -X GET  https://cloud.brilliantlabs.ca/api
```
response
```terminal
{"meta":{"revision":0,"created":1563162485390,"version":0},"results":{"TestVariable":5}} 
```

If you don't have cURL installed, you can check how to do so <a href="https://www.luminanetworks.com/docs-lsc-610/Topics/SDN_Controller_Software_Installation_Guide/Appendix/Installing_cURL_for_Ubuntu_1.html">here</a>

You can also use an API development tool like <a href="https://www.getpostman.com">Postman</a> or <a href="https://insomnia.rest/">Insomnia</a>
## <a name="head_variables"></a> Variables

#### <a name="head_overview"></a> Overview

|Command            |Parameters|Type     |Description                           |
|-------------------|----------|---------|--------------------------------------|
|**CREATE_VARIABLE**|name      |String   |Name of the variable to create.       |
|                   |value     |Any      |Value to initialize the variable to.  |
|**ERASE_VARIABLE** |name      |String   |Name of the variable to erase.        |
|**SET_VARIABLE**   |name      |String   |Name of the variable to erase.        |
|                   |value     |Any      |Value to set the variable to.         |
|**GET_VARIABLE**   |name      |String   |Name of the variable to read.         |

#### <a name="head_create_variable">Create Variable

Command that creates a variable that can be set and read.

|Command            |Parameters|Type     |Description                           |
|-------------------|----------|---------|--------------------------------------|
|**CREATE_VARIABLE**|name      |String   |Name of the variable to create.       |
|                   |value     |Any      |Value to initialize the variable with.|

##### Example 1 (No Value)
*Request:*
```json
{
  "key": "XXXXXXXXXXXXXX",
  "cmd": "CREATE_VARIABLE",
  "name": "Test"
}
```
*Response:*
```json
{
  "meta":{
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  },
  "result": {
    "Test": null
  }
}
```
##### Example 2 (Value Provided)
*Request:*
```json
{
  "key": "XXXXXXXXXXXXXX",
  "cmd": "CREATE_VARIABLE",
  "name": "Test",
  "value": 12345678
}
```
*Response:*
```json
{
  "meta":{
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  },
  "result": {
    "Test": 12345678
  }
}
```


#### <a name="head_erase_variable"> Erase Variable

Command that erases a stored variable. 

|Command            |Parameters|Type     |Description                           |
|-------------------|----------|---------|--------------------------------------|
|**ERASE_VARIABLE** |name      |String   |Name of the variable to erase.        |

##### Example

*Request:*
```json
{
  "key": "XXXXXXXXXXXXXX",
  "cmd": "ERASE_VARIABLE",
  "name": "Test"
}
```

*Response:*
```json
{
  "result": true,
   "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```

#### <a name="head_set_variable"> Set Variable

Command that sets the value of a variable.

|Command            |Parameters|Type    |Description                            |
|-------------------|----------|--------|---------------------------------------|
|**SET_VARIABLE**   |name      |String  |Name of the variable to set.           |
|                   |value     |Any     |Value to set the variable to.          |

##### Example
*Request:*
```json
{
  "key": "XXXXXXXXXXXXXX",
  "cmd": "SET_VARIABLE",
  "name": "Test",
  "value": 87654321
}
```
*Response:*
```json
{
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  },
  "result": {
    "Test": 87654321
  }
}
```

#### <a name="head_get_variable"> Get Variable

Command that gets the value of a variable.

|Command            |Parameters|Type     |Description                           |
|-------------------|----------|---------|--------------------------------------|
|**GET_VARIABLE**   |name      |String   |Name of the variable to read.          |

##### Example
*Request*
```json
{
  "key": "XXXXXXXXXXXXXX",
  "cmd": "GET_VARIABLE", 
  "name": "Test"
}
```
*Response*
```json
{
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  },
  "result": {
    "Test": 87654321
  }
}
```


## <a name="head_charts">Charts
#### <a name="head_charts_overview"> Overview
#### <a name="head_create_chart"> Create Chart
##### This command creates a **Bar**, **Pie**, **Scatter**, **Line** or **Histrogram** Chart.
|Command                   |Parameters|Type     |Description                              |
|--------------------------|----------|---------|-----------------------------------------|
|**CREATE_CHART**          |name      |String   |Name of the chart to create.             |
|                          |type      |String   |Type of chart to create. ['BAR', 'PIE', 'SCATTER', 'LINE', 'HISTOGRAM']        |
|                          |start     |Number   |Start range of the histogram chart.  (Histogram)   |
|                          |stop      |Number   |Stop range of the histogram chart.   (Histogram)   |


##### Example 1 (Line Chart, Bar, Pie, Scatter)
*Request*
```json
{ 
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "CREATE_CHART",
  "name": "Temperature Chart",
  "type": "LINE"
}
```
*Response*
```json
{
  "result":{
    "created": 1563162485390,
    "entries": 0,
    "id": "cu2495n20cn20c",
    "name": "Temperature Chart",
    "type": "LINE"
  },
  "meta":{
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```
##### Example 2 (Histogram)
*Request*
```json
{ 
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "CREATE_CHART",
  "name": "Age Distribution",
  "type": "HISTOGRAM"
  "start": 0,
  "stop": 120
}
```
*Response*
```json
{
  "result": {
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 0,
    "name": "Age Distribution",
    "type": "HISTOGRAM"
    "start": 0,
    "stop": 120
  },
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```


#### <a name="head_erase_chart"> Erase Chart
##### This function erases a chart. 
|Command                    |Parameters|Type     |Description                   |
|-------------------------- |----------|---------|------------------------------|
|**ERASE_CHART**            |name      |String   |Name or ID of the chart to erase.   |

##### Example 1 (Name) 
*Request*
```json
{
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "ERASE_CHART",
  "name": "Temperature Chart",
}
```
*Response*
```json
{
  "result": true,
   "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```
##### Example 1 (ID) 
*Request*
```json
{
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "ERASE_CHART",
  "name": "cu2495n20cn20c",
}
```
*Response*
```json
{
  "result": true,
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```




#### <a name="head_erase_chart_data"> Erase Chart Data
##### This command erases the data associated with a chart. 
|Command                    |Parameters|Type     |Description                   |
|-------------------------- |----------|---------|------------------------------|
|**ERASE_CHART_DATA**       |name      |String   |Name or ID of the chart to erase data from.|
|                           |range     |Any      |Entry range to erase.  "ALL", "{0,100}", 5 |


##### Example 1 (Line Chart Erase 1 Entry 5 Entries)
Example Data: 
```json
{
  0: {
    "y": 34
  },
  1: {
    "y": 32
  },  
  2: {
    "y": 30
  },  
  3: {
    "y": 39
  },  
  4: {
    "y": 28
  }
}
```
*Request*
```json
{
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "ERASE_CHART_DATA",
  "name": "Temperature Chart"
  "range": 3
}
```
*Response*
```json
{
"result": {
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 4,
    "name": "Temperature Chart",
    "type": "Line"
  },
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```
Result Data: 
```json
{
  0: {
    "y": 34
  },
  1: {
    "y": 32
  },  
  2: {
    "y": 30
  },  
  3: {
    "y": 28
  }
}
```
##### Example 2 (Line Chart Erase All 5 Entries)
Example Data: 
```json
{
  0: {
    "y": 34
  },
  1: {
    "y": 32
  },  
  2: {
    "y": 30
  },  
  3: {
    "y": 39
  },  
  4: {
    "y": 28
  }
}
```
*Request*
```json
{
  "key":"XXXXXXXXXXXXXXXX",
  "cmd":"ERASE_CHART_DATA",
  "name": "Temperature Chart"
  "range": "all"
}
```
*Response*
```json
{
  "result": {
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 0,
    "name": "Tmperature Chart",
    "type": "Line"
  },
  "meta": {
    "revision": 0,
    "created": 1563162485390,
    "version": 0
  }
}
```
RESULT DATA: 
```json
{
  
}
```
##### Example 3 Line Chart Erase Range (5 Entries)
DATA: 
```json
{
  0:{
    "y": 34
  },
  1:{
    "y": 32
  },  
  2:{
    "y": 30
  },  
  3:{
    "y": 39
  },  
  4:{
    "y": 28
  }
}
```
*Request*
```json
{
  "key": "XXXXXXXXXXXXXXXX",
  "cmd": "ERASE_CHART_DATA",
  "name": "Temperature Chart"
  "range": {
    "start": 1,
    "end": 3
  }
}
```
*Response*
```json
{
"result":{
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 2,
    "name": "Tmperature Chart",
    "type": "Line"
  },
  "meta":{
    "revision":0,
    "created":1563162485390,
    "version":0
  }
}
```
RESULT DATA: 
```json
{
  0:{
    "y": 34
  },
  1:{
    "y": 28
  }
}
```




#### <a name="head_add_chart_point"> Add Chart Point
##### This commands adds a data point to a chart. 
|Command                     |Parameters|Type       |Description                                      |
|----------------------------|----------|-----------|-------------------------------------------------|
|**ADD_CHART_POINT**.        |name      |String     |Name or ID of the chart to add the data point to.|
|                            |point     |String     |Name of the data point.  (Pie, Bar)        |
|                            |value     |Number     |Value of the data point. (Pie, Line, Bar)        |
|                            |x         |Number     |Value of the X coordinate.  (Scatter, Histogram) |
|                            |y         |Number     |Value of the Y coordinate.  (Scatter, Histogram) |


##### Example 1 (Pie, Bar)
DATA: 
```json
{
  0:{
    "point": "Mortgage"
    "value": 540.23
  },
  1:{
    "point": "Travel"
    "value": 250
  },  
  2:{
    "point": "Utilities"
    "value": 320.99
  }  
}
```
*Request*
```json
{
  "key":"XXXXXXXXXXXXXXXX",
  "cmd":"ADD_CHART_POINT",
  "name": "Monthly Budget Pie Chart",
  "point": "Food",
  "value": 234.23
}
```
*Response*
```json
{
"result":{
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 4,
    "name": "Monthly Budget Pie Chart",
    "type": "PIE"
  },
  "meta":{
    "revision":0,
    "created":1563162485390,
    "version":0
  }
}
```
RESULT DATA: 
```json
{
  0:{
    "point": "Mortgage"
    "value": 540.23
  },
  1:{
    "point": "Travel"
    "value": 250
  },  
  2:{
    "point": "Utilities"
    "value": 320.99
  },
  3:{
    "point": "Food",
    "value": 234.23
  }
}
```

##### Example 2 (Line)
DATA: 
```json
{
  0:{
    "value": 540.23
  },
  1:{
    "value": 250
  },  
  2:{
    "value": 320.99
  }  
}
```
*Request*
```json
{
  "key":"XXXXXXXXXXXXXXXX",
  "cmd":"ADD_CHART_POINT",
  "name": "Monthly Budget Pie Chart",
  "value": 234.23
}
```
*Response*
```json
{
"result":{
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 4,
    "name": "Stock Price",
    "type": "LINE"
  },
  "meta":{
    "revision":0,
    "created":1563162485390,
    "version":0
  }
}
```
RESULT DATA: 
```json
{
  0:{
    "value": 540.23
  },
  1:{
    "value": 250
  },  
  2:{
    "value": 320.99
  },
  3:{
    "value": 234.23
  }    
}
```

##### Example 1 (Pie, Bar)
DATA: 
```json
{
  0:{
    "point": "Mortgage"
    "value": 540.23
  },
  1:{
    "point": "Travel"
    "value": 250
  },  
  2:{
    "point": "Utilities"
    "value": 320.99
  }  
}
```
*Request*
```json
{
  "key":"XXXXXXXXXXXXXXXX",
  "cmd":"ADD_CHART_POINT",
  "name": "Monthly Budget Pie Chart",
  "point": "Food",
  "value": 234.23
}
```
*Response*
```json
{
"result":{
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 4,
    "name": "Monthly Budget Pie Chart",
    "type": "PIE"
  },
  "meta":{
    "revision":0,
    "created":1563162485390,
    "version":0
  }
}
```
RESULT DATA: 
```json
{
  0:{
    "point": "Mortgage"
    "value": 540.23
  },
  1:{
    "point": "Travel"
    "value": 250
  },  
  2:{
    "point": "Utilities"
    "value": 320.99
  },
  3:{
    "point": "Food",
    "value": 234.23
  }
}
```

##### Example 3 (Scatte)
DATA: 
```json
{
  0:{
    "x": 43,
    "y": -23
  },
  1:{
    "x": 32,
    "y": -22
  },  
  2:{
    "x": 43,
    "y": -33
  }  
}
```
*Request*
```json
{
  "key":"XXXXXXXXXXXXXXXX",
  "cmd":"ADD_CHART_POINT",
  "name": "Humidity in function of temperature chart",
  "x": 34.23,
}
```
*Response*
```json
{
"result":{
    "id": "0cwejc09wej0rv",
    "created": 1563162485390,
    "entries": 4,
    "name": "Stock Price",
    "type": "LINE"
  },
  "meta":{
    "revision":0,
    "created":1563162485390,
    "version":0
  }
}
```
RESULT DATA: 
```json
{
  0:{
    "value": 540.23
  },
  1:{
    "value": 250
  },  
  2:{
    "value": 320.99
  },
  3:{
    "value": 234.23
  }    
}
```












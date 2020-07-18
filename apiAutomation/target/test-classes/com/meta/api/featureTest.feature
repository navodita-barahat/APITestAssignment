Feature: AM Admin Login
 
  #Scenario: Login as Admin to AM and get token
   
    Given url 'https://reqres.in/api/users'
    And request { name: 'Billie' }
    When method POST
    Then status 201
    
    
  Scenario: Login as Admin to AM and get token
   
    * url baseURL
    * path 'countries'
    * method GET
    * status 200
    
    
  Scenario: Login as Admin to AM and get token
   
    * url 'http://prodapi.deposit-book.com/clients/add'
    * request {user: {"first_name":"faba","last_name":"bacona","email":"fbaconab@mail.com","password":"abcd1234@","landline_country_code":"us","landline_number":"1234567890123","mobile_country_code":"us","mobile_number":"1234567890123","designation":"Associate"},"client":{"category":"CORPORATE","name":"axisab","country":"United Arab Emirates","regulator_name":"RBA","mailing_address":"Bur Dubai, Dubai, UAE"}}
    * method POST
    * status 200  
    
    
    Scenario: Click on Register
   
    * configure retry = { count: 5, interval: 0 }
    * url baseURL
    * path 'countries'
    * retry until responseStatus == 200
    * method GET
    * status 200
    #* match response.data.countries contains 'Afghanistan'
    * match response == read('page.json')
    
    Scenario: Register User with relevant details
   
    * url baseURL
    * path 'clients', 'add'
    * request {user: {"first_name":"firstAPI","last_name":"last","email":"#(mail)","password":"#(password)","landline_country_code":"us","landline_number":"1234567890123","mobile_country_code":"us","mobile_number":"1234567890123","designation":"Associate"},"client":{"category":"CORPORATE","name":"axisab","country":"United Arab Emirates","regulator_name":"RBA","mailing_address":"Bur Dubai, Dubai, UAE"}}
    * method POST
    * status 200  
    
    
    Scenario: Login with registered client
  
  	* url baseURL
    * path 'login'
    * request { "application_id":"sHPPirW86SuOwDOfhxmag1fZ9oRCpHFS24wrZj00","username":"firstapi@test.com","password":"abcd1234@","grant_type":"password"}
    * method POST
    * status 400  
    
    
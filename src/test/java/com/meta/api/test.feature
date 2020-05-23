Feature: Test

      
  Scenario: Registering a Partner
  	
  	* url baseURL
    * request {"property":"Sites","report_type":"ALL"}
    * method POST
    * status 200 
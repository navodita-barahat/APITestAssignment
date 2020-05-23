Feature: Register partner

  Background:
  * def mail = 'thirdclient@test.com'
  * def password = 'abcd1234@'
 
  
  Scenario: Pooled Campaign page
  
  	* url baseURL
    * path 'poolCampaigns'
    * header Authorization = 'Bearer' + 'JvghBu117TMiZ5zR3auxXFAeNTwrli'
    * method GET
    * status 200  
    
    
  Scenario: Offers Page
  
  	* url baseURL
    * path 'depositOffers'
    * header Authorization = 'Bearer' + 'JvghBu117TMiZ5zR3auxXFAeNTwrli'
    * request {}
    * method POST
    * status 200    
  
    
    
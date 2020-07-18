Feature: ReverseQuery
 
  	Scenario: Login to Client
  	
  	* url baseURL
    * path 'login'
    * header Content-Type = 'application/json;charset=UTF-8' 
    * header origin = 'https://devclient.deposit-book.com' 
    * request '{"grant_type": "password","application_id": "sHPPirW86SuOwDOfhxmag1fZ9oRCpHFS24wrZj00","username": "abtestcd@test.com","password": "abcd1234@"}'
    * method POST
    * status 200  
 	* def accessToken = response.data.access_token
  	* print accessToken
    * path 'reverseQueries'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + accessToken
    * header origin = 'https://devclient.deposit-book.com' 
    * request '{"amount" : "10000000","min_interest_rate" : "5.2","currency" : "USD","tenor_value"    : "14","tenor_type" : "DAYS","deposit_type" : "FIXED_DEPOSIT","partner_list" : ["15116d09-1461-4c66-a650-af73850fadde","95f04b2e-4b08-4076-a5da-ba8931296724","18c12c7f-6b15-4d81-a521-ec56c7916d98","70bff4ec-e196-438f-aff1-8aab7a1787b6","eaf071fe-ce8e-4529-99a9-698031e237a5","ac731d54-8316-4ac9-9c1f-280af2942442","51acff7b-e56e-4d8e-9abd-3df5d204d426"],"message" : "","valid_upto" : "2020-01-22T06:30:00.000Z"}'
    * method POST
    * status 200  
    
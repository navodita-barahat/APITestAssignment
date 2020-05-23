Feature: Onboard partner

      
  Scenario: Registering a Partner
  	
  	* url baseURL
    * path 'stakeholder/add'
    * request {"user": {"first_name": "AsinAPI", "last_name": "Last", "email": "asinapi@mail.com", "landline_number": "3333338733", "mobile_number": "3333338933", "landline_country_code": "in", "mobile_country_code": "in", "password": "abcd1234@", "designation": "Bank Manager"}, "partner": { "name": "ArgentinaAPI Bank", "country": "Argentina", "regulator_name": "ARC"}}
    * method POST
    * status 200 
    
    * def stakeholder_id = response.stakeholder_id 
    * def partner_id = response.partner_id
    * def partner_auth_id = response.access_token
    * def email = response.email
    * def user_id - response.user.id
    
    # Login to manage portal
    
    * url baseURL
    * path 'login'
    * header Content-Type = 'application/json'
    * request '{ "grant_type": "password", "application_id": "zvfLGhAouYqljFhG5R14WS37jm783pdt9Uc6P0sL", "username": "depositbook@mailinator.com", "password": "gridle123"}'
    * method POST
    * status 200  
    
    * def authId = response.access_token
    
    
    
  #Scenario: Verify Details
  
  	* url baseURL
    * path 'stakeholder/verify{{stakeholder_id}}?stakeholder=PARTNER'
    * header Authorization = 'Bearer' + authId
    * request '{}'
    * method POST
    * status 200  
    
    
  Scenario: Update Details
  
  	* url baseURL
    * path 'stakeholder/{{stakeholder_id}}?stakeholder=PARTNER'
    * header Authorization = 'Bearer' + authId
    * request {"partner_id" : partner_id, "name" : "Corporate Bank", "country_of_incorporation" : "Argentina", "regulator_name" : "RBI"}
    * method PUT
    * status 200  
    
  Scenario: Email Verification
   
  	* url baseURL
    * path 'users/emailConfirmation/verifyToken?email_id=atit@mail.com&access_token=2ae9fdd8-d22d-46ef-8ed9-ddb9bc84a72b'
    * method GET
    * status 200 
    
  #Scenario: Start Onboarding  
   
    * url baseURL
    * path 'partners/onboarding/{{stakeholder_id}}'
    * header Authorization = 'Bearer' + partner_auth_id
    * header Content-Type = application/json
    * request '{}'
    * method POST
    * status 200  
    
    Scenario: Login(partner)
    
    * url baseURL
    * path 'login'
    * header Content-Type = application/json
    * request {"grant_type" : "password", "application_id" : "cuOt3raxH9ClbCrbbgP68iU6ssfO2N78TplxwlMq", "username" : email, "password" : "abcd1234@"}
    * method POST
    * status 200 
    
  Scenario: Add Super User by partner(use partner token)
  
    * url baseURL
    * path 'stakeholder{{stakeholder_id}}/user/{{user_id}}4?stakeholder=PARTNER'
    * request {"first_name":"Super", "last_name":"Havmor", "designation":"Manager", "email":"superhavmor@mail.com", "password":"samplepass@1", "landline_country_code":"us", "landline_number":"8719891801", "mobile_country_code":"us", "mobile_number":"1718918918", "invitation_token":"fd5bd5fd-a6d2-485d-8756-6a91d8b32ea5"}
    * method PUT
    * status 200  
    
  Scenario: Delete Super User by partner(use partner token)
  
    * url baseURL
    * path 'partnerOnboardingPipelines/{{pipeline_id}}/user/{{user_id}}'
    * method DELETE
    * status 200    
      
  Scenario: Add Super User by partner(use partner token)
  
    * url baseURL
    * path 'stakeholder{{stakeholder_id}}/user/{{user_id}}4?stakeholder=PARTNER'
    * request {"first_name":"Super", "last_name":"Havmor", "designation":"Manager", "email":"superhavmor@mail.com", "password":"samplepass@1", "landline_country_code":"us", "landline_number":"8719891801", "mobile_country_code":"us", "mobile_number":"1718918918", "invitation_token":"fd5bd5fd-a6d2-485d-8756-6a91d8b32ea5"}
    * method PUT
    * status 200      
      
  Scenario: Verify Super user email 
 
  	* url baseURL
    * path 'users/emailConfirmation/verifyToken?email_id=atit@mail.com&access_token=2ae9fdd8-d22d-46ef-8ed9-ddb9bc84a72b'
    * method GET
    * status 200 
    
   Scenario: Upload Documents by Partner bank 
 
  	* url baseURL
    * path 'userOnboardingPipelines/uploadDocument/{{pipeline_id}}?stakeholder=PARTNER'
    * header Authorization = 'Bearer' + CjNxw4YAmkBWwb3gkOHjK5f5W9bKtO
    * header Content-Type = application/x-www-form-urlencoded
    * request {document.file="digital_india_internship_scheme.pdf", pipeline_document_id="371fb57c-c68a-4dad-9817-a3d363cc9b42"}
    * method POST
    * status 200  
    
     Scenario: Delete Documents by Partner user
 
  	* url baseURL
    * path 'userOnboardingPipelines/deleteDocument/{{pipeline_id}}?stakeholder=PARTNER'
    * header Authorization = 'Bearer' + CjNxw4YAmkBWwb3gkOHjK5f5W9bKtO
    * header Content-Type = application/json
    * request {"document_id":"371fb57c-c68a-4dad-9817-a3d363cc9b42"}
    * method DELETE
    * status 200  
    
  Scenario: Add custodian by Partner bank 
 
  	* url baseURL
    * path 'userOnboardingPipelines/uploadDocument/{{pipeline_id}}?stakeholder=PARTNER'
    * header Authorization = 'Bearer' + CjNxw4YAmkBWwb3gkOHjK5f5W9bKtO
    * header Content-Type = application/x-www-form-urlencoded
    * request {document.file="digital_india_internship_scheme.pdf", pipeline_document_id="371fb57c-c68a-4dad-9817-a3d363cc9b42"}
    * method POST
    * status 200   
     
  Scenario: Add User by DB(use DB token)
  
    * url baseURL
    * path 'stakeholder{{stakeholder_id}}/user/{{user_id}}4?stakeholder=DepositBook'
    * request {"first_name":"Super", "last_name":"Havmor", "designation":"Manager", "email":"superhavmor@mail.com", "password":"samplepass@1", "landline_country_code":"us", "landline_number":"8719891801", "mobile_country_code":"us", "mobile_number":"1718918918", "invitation_token":"fd5bd5fd-a6d2-485d-8756-6a91d8b32ea5"}
    * method PUT
    * status 200 
    
    Scenario: Delete Documents by DB  
 
  	* url baseURL
    * path 'userOnboardingPipelines/uploadDocument/{{pipeline_id}}?stakeholder=DepositBook'
    * header Authorization = 'Bearer' + CjNxw4YAmkBWwb3gkOHjK5f5W9bKtO
    * header Content-Type = application/json
    * request {"document_id":"371fb57c-c68a-4dad-9817-a3d363cc9b42"}
    * method DELETE
    * status 200    
    
    Scenario: Upload Documents by DB  
 
  	* url baseURL
    * path 'userOnboardingPipelines/uploadDocument/{{pipeline_id}}?stakeholder=DepositBook'
    * header Authorization = 'Bearer' + CjNxw4YAmkBWwb3gkOHjK5f5W9bKtO
    * header Content-Type = application/x-www-form-urlencoded
    * request {document.file="digital_india_internship_scheme.pdf", pipeline_document_id="371fb57c-c68a-4dad-9817-a3d363cc9b42"}
    * method POST
    * status 200 
    
  Scenario: Verify details by DB
  
  	* url baseURL
    * path 'partnerOnboardingPipelines/verifyAccountSetup/{{pipeline_id}}'
    * header Authorization = 'Bearer' + 8BSulCJEqXIXIdBK9wBeQOP756V1QJ
    * header Content-Type = application/x-www-form-urlencoded
    * request {}
    * method POST
    * status 200  
  
  Scenario: Make Partner bank account Live
  
  	* url baseURL
    * path 'partnerOnboardingPipelines/verifyAccountSetup/{{pipeline_id}}'
    * header Authorization = 'Bearer' + 8BSulCJEqXIXIdBK9wBeQOP756V1QJ
    * header Content-Type = application/x-www-form-urlencoded
    * request {}
    * method POST
    * status 200  
  
  
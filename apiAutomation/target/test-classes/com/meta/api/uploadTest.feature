Feature: upload receipt
  	
  Scenario: uplaod custodian receipt
  	
  	* url baseURL
    * path '/depositRequestPipelines/9fb90005-2aaa-4c2c-89ee-82e5a57bfb32/custodianReceipt'
    And multipart file file = { read: 'pdf-test.pdf', filename: 'document', contentType: 'application/pdf' }
	* header Authorization = 'Bearer ' + 'IIWDcrnZq4CWeuXuu6XR9CJjadnktK'
	#And origin = 'https://devclient.deposit-book.com'
	When method post
	Then status 200
    
Feature: Macfit Login Caller API endpoint test

  Background:
    * url 'https://testapi.macfit.com.tr:8080/api'

  Scenario: Auth sends OTP Token
    Given path '/auth/sendToken'
    And request { userName: '+905377777777' }
    When method post
    Then status 200
    * print 'Auth sends OTP Token: Endpoint responded with status 200'

  Scenario: Auth Login
    Given path '/auth/login'
    And request { userName: '+905377777777', otpToken: '112233' }
    When method post
    Then status 200
    * print 'Full response:', response
    * def token = response.result ? response.result.accessToken : (response.accessToken ? response.accessToken : response.token) // Farklı yerlerde arıyoruz
    * karate.log('authToken:', token)

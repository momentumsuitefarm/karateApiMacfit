Feature: Macfit Login API endpoint test

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

  Scenario: Auth CMS Login
    Given path '/auth/cmsLogin'
    And request { UserName: 'hq.user', OtpToken: 'HqM@rs21!' }
    When method post
    Then status 200
    * print 'CMS Login: Endpoint responded with status 200'

  Scenario: Auth flushCache
    Given path '/auth/flushCache'
    And header secret = 'Q9Vj#%rG5V2!S4uJ'
    When method get
    Then status 200
    * print 'flushCache: Endpoint responded with status 200'

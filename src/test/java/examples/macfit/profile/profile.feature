Feature: Macfit Profile API endpoint test

  Background:
    * url apiUrl // karate-config.js dosyasındaki url'i kullanıyoruz
    * header Authorization = 'Bearer ' + authToken // karate-config.js'den gelen token

  Scenario: Get MyProfile
    Given path 'members/MyProfile'
    When method get
    Then status 200
    * print 'MyProfile data fetched successfully'

  Scenario: Get Member Profile by ID
    Given path 'members/Profile/6484'
    When method get
    Then status 200
    * print 'Profile data for member 6484 fetched successfully'

  Scenario: Bilerek Yazılmış Hatalı Case
    Given path 'members/Profile/6484'
    When method get
    Then status 400
    * print 'Profile data for member 6484 fetched successfully'

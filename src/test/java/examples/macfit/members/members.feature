Feature: Macfit Members API endpoint test

  Background:
    * url apiUrl // karate-config.js dosyasındaki url'i kullanıyoruz
    * header Authorization = 'Bearer ' + authToken // karate-config.js'den gelen token

  Scenario: Get GetLeaderBoard
    Given path 'members/LeaderBoard'
    When method get
    Then status 200
    * print 'MyProfile data fetched successfully'

  Scenario: Get Leaderboard Monthly
    Given path '/members/GetLeaderBoardMonthly'
    And request { date: '2024-09-01T00:00:00+03:00' }
    When method post
    Then status 200
    * print 'GetLeaderBoardMonthly: Endpoint responded with status 200'

  Scenario: GetLeaderBoardYearly
    Given path '/members/GetLeaderBoardYearly'
    And request { date: '2024-09-01T00:00:00+03:00' }
    When method post
    Then status 200
    * print 'GetLeaderBoardYearly: Endpoint responded with status 200'

  Scenario: GetTrainerDetail
    Given path '/members/GetTrainerDetail'
    And request { id: '5738' }
    When method post
    Then status 200
    * print 'GetTrainerDetail: Endpoint responded with status 200'

Feature: Macfit Activity API endpoint test

  Background:
    * url apiUrl // karate-config.js dosyasındaki url'i kullanıyoruz
    * header Authorization = 'Bearer ' + authToken // karate-config.js'den gelen token

  Scenario: GetActivityById
    Given path 'activity/GetActivityById/22540'
    When method get
    Then status 200
    And match response.message == 'OK'
    And match response.result.id == 22540
    * print 'GetActivityById data fetched successfully'

  Scenario: GetActivityList
    Given path 'activity/GetActivityList'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetActivityList data fetched successfully'

  Scenario: GetActivityListForGoldOrFitMember
    Given path 'activity/GetActivityListForGoldOrFitMember'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetActivityListForGoldOrFitMember data fetched successfully'

  Scenario: GetSearchActivityWithPaging
    Given path 'activity/GetSearchActivityWithPaging'
    And request { "filter": [], "page": 1, "size": 10 }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'GetSearchActivityWithPaging data fetched successfully'

  Scenario: SearchActivityList
    Given path 'activity/SearchActivityList'
    And request { "filter": [ { "KEY": "ClubIds", "VALUE": "91" }, { "KEY": "TimeRange", "VALUE": 3 }, { "KEY": "DATE", "VALUE": "2023-01-23T00:00:00+03:00" } ], "page": 1, "size": 10 }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'SearchActivityList data fetched successfully'

  Scenario: GetActivityTypeById
    Given path 'activity/GetActivityTypeById/1'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetActivityTypeById data fetched successfully'

  Scenario: GetMobileActivityTypeList
    Given path 'activity/GetMobileActivityTypeList'
    When method get
    Then status 200
    And match response.message == 'OK'
    And match response.result[0].activityTypeName == 'Özel Ders Aktivitesi -60 dakika'
    And match response.result[1].activityTypeName == 'UAT Grup Ders Test- Eğitmen kulüp özel dersleri'
    * print 'GetMobileActivityTypeList data fetched successfully'

  Scenario: GetSession
    Given path 'activity/GetSession/22540'
    When method get
    Then status 200
    And match response.message == 'OK'
    And match response.result.id == 22540
    And match response.result.lessonName == 'Fit Start Ölçüm'
    * print 'GetSession/22540 data fetched successfully'

  Scenario: GetMobileFitOrGoldStartList
    Given path 'activity/GetMobileFitOrGoldStartList'
    When method get
    Then status 200
    And match response.message == 'OK'
    And match response.result[2].activityTypeName == 'Fit Start'
    And match response.result[3].activityTypeName == 'Gold Fit Start'
    * print 'GetMobileFitOrGoldStartList data fetched successfully'

  Scenario: GetCommunityList
    Given path 'activity/GetCommunityList'
    When method get
    Then status 200
    And match response.message == 'OK'
    And match response.result[0].name == 'MAC Runners'
    And match response.result[1].name == 'MAC Bikers'
    * print 'GetCommunityList data fetched successfully'

  Scenario: GetGroupLessonFilter
    Given path 'activity/GetGroupLessonFilter'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetGroupLessonFilter data fetched successfully'

  Scenario: GetOutdoorGroupLessonFilter
    Given path 'activity/GetOutdoorGroupLessonFilter'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetOutdoorGroupLessonFilter data fetched successfully'

  Scenario: GetTabsForSearch
    Given path 'activity/GetTabsForSearch'
    And request { "text": "macfit" }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'GetTabsForSearch data fetched successfully'

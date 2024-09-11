Feature: Macfit Members API endpoint test

  Background:
    * url apiUrl // karate-config.js dosyasındaki url'i kullanıyoruz
    * header Authorization = 'Bearer ' + authToken // karate-config.js'den gelen token

  Scenario: LeaderBoard
    Given path 'members/LeaderBoard'
    When method get
    Then status 200
    * print 'LeaderBoard data fetched successfully'

  Scenario: GetLeaderBoard
    Given path 'members/GetLeaderBoard'
    When method get
    Then status 200
    * print 'GetLeaderBoard data fetched successfully'

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

  Scenario: Get GetCard
    Given path 'members/GetCard'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetCard data fetched successfully and message is OK'

  Scenario: Get GetMembership
    Given path 'members/GetMembership'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetMembership data fetched successfully and message is OK'

  Scenario: Get GetVisit
    Given path 'members/GetVisit'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetVisit data fetched successfully and message is OK'

  Scenario: UpdatePushToken
    Given path '/members/UpdatePushToken'
    And request { PushToken: 'PushTokentestw' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'UpdatePushToken: Endpoint responded with status 200'

  Scenario: GetTrainerDetail
    Given path '/members/GetTrainerDetail'
    And request { id: '1166' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'GetTrainerDetail: Endpoint responded with status 200'

  Scenario: UpdateName
    Given path '/members/UpdateName'
    And request { name: 'batuhan', surname: 'aygormez' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'UpdateName: Endpoint responded with status 200'

  Scenario: GetMemberMeasurementList
    Given path '/members/GetMemberMeasurementList'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetMemberMeasurementList: Endpoint responded with status 200'

  Scenario: Search
    Given path '/members/Search'
    And request { FullName: 'test' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'Search: Endpoint responded with status 200'

  Scenario: Search By Paging
    Given path '/members/SearchByPaging'
    And request { "filter": [{ "KEY": "FULLNAME", "VALUE": "MEHMET" }], "orderBy": { "key": "FullName", "value": "desc" }, "page": 1, "size": 20 }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'SearchByPaging: Endpoint responded with status 200'

  Scenario: PtSearch
    Given path '/members/PtSearch'
    And request { "filter": [{ "key": "FullName", "value": "ali" }, { "key": "ClubIds", "value": "17" }, { "key": "Gender", "value": 1 }], "orderBy": { "key": "FullName", "value": "desc" }, "page": 1, "size": 10 }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'PtSearch: Endpoint responded with status 200'

  Scenario: ReplyTrainerRequest
    Given path '/members/ReplyTrainerRequest'
    And request { "Id": [3, 9], "Status": 2 }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'ReplyTrainerRequest: Endpoint responded with status 200'

  Scenario: MemberFriendLeaderBoard
    Given path '/members/MemberFriendLeaderBoard'
    And request { type: '3', date: '2024-07-12T00:00:00+03:00' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'MemberFriendLeaderBoard: Endpoint responded with status 200'

  Scenario: GetFeedInfo
    Given path '/members/GetFeedInfo'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetFeedInfo: Endpoint responded with status 200'

  Scenario: GetProfileInfo
    Given path '/members/GetProfileInfo'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetProfileInfo: Endpoint responded with status 200'

  Scenario: GetProfileInfoDetail
    Given path '/members/GetProfileInfoDetail'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetProfileInfoDetail: Endpoint responded with status 200'

  Scenario: GetWaitingTrainerRequests
    Given path '/members/GetWaitingTrainerRequests'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetWaitingTrainerRequests: Endpoint responded with status 200'

  Scenario: UpdatePermissions
    Given path '/members/UpdatePermissions'
    And request { MembershipAgreement: 'true', CommunicationConditions: 'false' }
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'UpdatePermissions: Endpoint responded with status 200'

  Scenario: SubscriptionRenewalProcess
    Given path '/members/SubscriptionRenewalProcess'
    And request { Description: 'test'}
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'SubscriptionRenewalProcess: Endpoint responded with status 200'

  Scenario: SubscriptionRenewalProcess
    Given path '/members/SubscriptionRenewalProcess'
    And request { Description: 'test'}
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'SubscriptionRenewalProcess: Endpoint responded with status 200'

  Scenario: AddClubToFavorite
    Given path '/members/AddClubToFavorite'
    And request { clubId: '1'}
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'AddClubToFavorite: Endpoint responded with status 200'

  Scenario: GetLandingPage
    Given path '/members/GetLandingPage'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetLandingPage: Endpoint responded with status 200'

  Scenario: GetAtClubPage
    Given path '/members/GetAtClubPage'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetAtClubPage: Endpoint responded with status 200'

  Scenario: GetAtHomePage
    Given path '/members/GetAtHomePage'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetAtHomePage: Endpoint responded with status 200'

  Scenario: GetOutdoorPage
    Given path '/members/GetOutdoorPage'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetOutdoorPage: Endpoint responded with status 200'

  Scenario: GetCreditAndInvitationCode
    Given path '/members/GetCreditAndInvitationCode'
    When method get
    Then status 200
    And match response.message == 'OK'
    * print 'GetCreditAndInvitationCode: Endpoint responded with status 200'

  Scenario: CreateMemberInvitationCode
    Given path '/members/CreateMemberInvitationCode'
    When method get
    Then status 200
    And match response.message == 'Zaten aktif bir kodunuz bulunmamaktadır.'
    * print 'CreateMemberInvitationCode: Endpoint responded with status 200'

  Scenario: UseInvitationCode
    Given path '/members/UseInvitationCode'
    And request { code: '15638768'}
    When method post
    Then status 200
    And match response.message == 'Yetkili değilsin.'
    * print 'UseInvitationCode: Endpoint responded with status 200'

  Scenario: UpdatePrivacy
    Given path '/members/UpdatePrivacy'
    And request { ShowProfile: 'false'}
    When method post
    Then status 200
    And match response.message == 'OK'
    * print 'UpdatePrivacy: Endpoint responded with status 200'
# Scenario: DeletePhoto
#     Given path '/members/DeletePhoto'
#     When method post
#     Then status 200
#     And match response.message == 'OK'
#     # * print 'DeletePhoto: Endpoint responded with status 200'

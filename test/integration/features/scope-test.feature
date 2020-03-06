@core
Feature:
	As Httpbin client I want to use variables in my feature files

# Read only app bits
	Scenario: ReadOnlyApp with read only scope while trying to read. Should be successful
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadOnlyApp.consumerKey` and secret `ScopeCaseReadOnlyApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I GET /scopecase/read
    Then response code should be 200
    
	Scenario: ReadOnlyApp with read only scope while trying to write. Should be fail with a 401
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadOnlyApp.consumerKey` and secret `ScopeCaseReadOnlyApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401

	Scenario: ReadOnlyApp without specifying scope at all while trying to read. Should succeed
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials with clientid `ScopeCaseReadOnlyApp.consumerKey` and secret `ScopeCaseReadOnlyApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I GET /scopecase/read
    Then response code should be 200

## Read/Write App bits
	Scenario: ReadWriteApp with read only scope while trying to read. Should be successful
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I GET /scopecase/read
    Then response code should be 200
    
	Scenario: ReadWriteApp with read only scope while trying to write. Should be fail with a 403
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 403

  Scenario: ReadWriteApp without specifying scope at all while trying to read. Should succeed 
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I GET /scopecase/read
    Then response code should be 200

  Scenario: ReadWriteApp without specifying scope at all while trying to write. Should succeed 
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I store the raw value $.access_token as myTokenPath in scenario scope
    And I store the value of body path `myTokenPath` as access token
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 200

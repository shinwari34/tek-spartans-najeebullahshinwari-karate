@Regression
Feature: Create new Account with Random Email

  Background: Setup test
    Given url BASE_URL

  @CreateAccount_2
  Scenario: Create Account using Java and random email
    * def dataGenerator = Java.type('data.GenerateData')
    * def email = dataGenerator.getEmail()
    Given path "/api/accounts/add-primary-account"
    Given request
      """
      {
        "email": "#(email)",
        "firstName": "Naeebullah",
        "lastName": "Shinwari",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "Married",
        "employmentStatus": "Test Engineer",
        "dateOfBirth": "1990-08-25"
      }
      """
    When method post
    Then print response
    Then status 201
    Then assert response.email == email
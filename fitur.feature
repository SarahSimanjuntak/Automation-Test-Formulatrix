@Formulatrix
Feature: feature
  @Register
  Scenario:
    Given Open PHPTravels
    Then Go To Register Page
    Then Compare URL


  @LoginSuccess
  Scenario:
    Given Open PHPTravels
    Then  Go To Login Page
    Then  Input True Password
    Then Compare After Login

  @LoginFailed
  Scenario:
    Given Open PHPTravels
    Then Go To Login Page
    Then Input Wrong Password
    Then Compare Failed Login

  @SearchSuccess
  Scenario:
    Given Open PHPTravels
    Then Go To Login Page
    Then Input True Password
    Then Go To Search
    Then Compare After Search

  @BookingSuccess
  Scenario:
    Given Open PHPTravels
    Then Go To Login Page
    Then Input True Password
    Then Go To Flights
    Then Go to Search
    Then Go to Book Now
    Then Input form Personal Information
    Then Input form Travellers Information
    Then Input form Payment Method
    Then Go To Confirm Booking

require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for :chrome
link = "https://www.phptravels.net/"
email = "sarahsimanjuntak89@gmail.com"
password = "test123"
wrongPassword = "test12345"
Given("Open PHPTravels") do
  driver.navigate.to link
end

Then("Go To Register Page") do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'regist' do
    @driver.get('https://www.phptravels.net/')
    @driver.manage.resize_to(1382, 744)
    @driver.find_element(:link_text, 'Signup').click
    sleep(3)
    @driver.find_element(:name, 'first_name').send_keys('Sarah')
    @driver.find_element(:name, 'last_name').send_keys('Simanjuntak')
    @driver.find_element(:name, 'phone').send_keys('081362132139')
    @driver.find_element(:name, 'email').click
    sleep(3)
    @driver.find_element(:name, 'email').send_keys('sarahsimanjuntak89@gmail.com')
    @driver.find_element(:name, 'password').click
    sleep(3)
    @driver.find_element(:name, 'password').send_keys('test123')
    @driver.find_element(:css, '.btn-default > .ladda-label').click
    sleep(3)
  end
end
Then("Compare URL") do
  @driver.get('https://www.phptravels.net/')
  @driver.manage.resize_to(1382, 744)
  @driver.find_element(:link_text, 'Login').click
  sleep(3)
end

Then("Go To Login Page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[2]/p').click
  driver.find_element(:xpath, '//*[@id="user_identity_textfield"]').send_keys email
  sleep(2)
  driver.find_element(:xpath, '//*[@id="submit_button"]').click
  sleep(2)

end
Then ("Input True Password") do
  @driver.find_element(:name, 'password').click
  sleep(3)
  @driver.find_element(:name, 'password').send_keys('test123')
  @driver.find_element(:name, 'password').send_keys(:enter)
  sleep(3)
end

Then ("Input Wrong Password") do
  @driver.action.move_to_element(element).perform
  @driver.find_element(:name, 'password').send_keys('test12345') wrongPassword
  @driver.find_element(:css, '.btn-lg').click
  sleep(3)
end

Then("Compare After Login") do
  @driver.find_element(:link_text, 'Home').click
  sleep(3)
  @driver.find_element(:css, '.mt-3:nth-child(3)').click
  sleep(3)
end

Then("Compare Failed Login") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://www.phptravels.net/login")
end

Then("Go To Search") do
  @driver.find_element(:link_text, 'Home').click
  sleep(3)
  element = @driver.find_element(:id, 'select2-hotels_city-container')
  @driver.action.move_to_element(element).click_and_hold.perform
  element = @driver.find_element(:css, '.select2-search__field')
  @driver.action.move_to_element(element).release.perform
  @driver.find_element(:css, 'body').click
  sleep(3)
  @driver.find_element(:css, '.select2-search__field').send_keys('jaka')
  @driver.find_element(:css, '.select2-search__field').send_keys(:enter)
  @driver.find_element(:id, 'submit').click
  sleep(3)
end

Then("I Book Flights") do
  @driver.get('https://www.phptravels.net/')
  @driver.manage.resize_to(1382, 744)
  @driver.find_element(:css, 'nav > ul > li:nth-child(3) > .waves-effect').click
  sleep(3)
  @driver.find_element(:css, '.col-lg-4:nth-child(3) .col-7').click
  sleep(3)
  @driver.find_element(:css, '.mix:nth-child(2) .theme-search-results-item-book strong').click
  sleep(3)
  element = @driver.find_element(:link_text, 'Back to Home')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:link_text, 'Back to Home').click
  sleep(3)
  element = @driver.find_element(:css, 'nav > ul > li:nth-child(3) > .waves-effect')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:css, 'nav > ul > li:nth-child(3) > .waves-effect').click
  sleep(3)
  element = @driver.find_element(:css, '.col-lg-4:nth-child(7) .deal-action-box')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:css, '.col-lg-4:nth-child(7) .deal-action-box').click
  sleep(3)
  element = @driver.find_element(:css, '.mix:nth-child(1) .btn')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:css, '.mix:nth-child(1) .btn').click
  sleep(3)
  element = @driver.find_element(:link_text, 'Back to Home')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:link_text, 'Back to Home').click
  sleep(3)
  @driver.close
  element = @driver.find_element(:css, 'nav > ul > li:nth-child(3) > .waves-effect')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:css, 'nav > ul > li:nth-child(3) > .waves-effect').click
  sleep(3)
  @driver.find_element(:css, '.col-lg-4:nth-child(1) .deal-action-box').click
  sleep(3)
  element = @driver.find_element(:css, '.header-area:nth-child(1) ul:nth-child(1) > li:nth-child(3) > .waves-effect:nth-child(1)')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:css, '.header-area:nth-child(1) ul:nth-child(1) > li:nth-child(3) > .waves-effect:nth-child(1)').click
  element = @driver.find_element(By.CSS_SELECTOR, 'body')
  @driver.action.move_to_element(element, 0, 0).perform
  element = @driver.find_element(:css, '.header-area:nth-child(1) ul:nth-child(1) > li:nth-child(3) > .waves-effect:nth-child(1)')
  @driver.action.move_to_element(element).perform
  element = @driver.find_element(By.CSS_SELECTOR, 'body')
  @driver.action.move_to_element(element, 0, 0).perform
  @driver.find_element(:css, '.col-lg-4:nth-child(8) .col-7').click
  sleep(3)
  @driver.find_element(:css, '.mix:nth-child(1) .theme-search-results-item-mask-link').click
  sleep(3)
  element = @driver.find_element(:css, '.mix:nth-child(1) .btn')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:name, 'title_1').click
  sleep(3)
  dropdown = @driver.find_element(:name, 'title_1')
  dropdown.find_element(:xpath, "//option[. = 'MISS']").click
  sleep(3)
  @driver.find_element(:name, 'firstname_1').click
  sleep(3)
  @driver.find_element(:name, 'firstname_1').send_keys('Sarah')
  @driver.find_element(:name, 'lastname_1').click
  sleep(3)
  @driver.find_element(:name, 'lastname_1').send_keys('Simanjuntak')
  @driver.find_element(:name, 'nationality_1').click
  sleep(3)
  dropdown = @driver.find_element(:name, 'nationality_1')
  dropdown.find_element(:xpath, "//option[. = 'Indonesia']").click
  sleep(3)
  @driver.find_element(:name, 'dob_month_1').click
  sleep(3)
  dropdown = @driver.find_element(:name, 'dob_month_1')
  dropdown.find_element(:xpath, "//option[. = '09 September']").click
  sleep(3)
  @driver.find_element(:name, 'dob_month_1').click
  sleep(3)
  dropdown = @driver.find_element(:name, 'dob_month_1')
  dropdown.find_element(:xpath, "//option[. = '02 February']").click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('-1')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('0')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('1')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  element = @driver.find_element(:name, 'dob_day_1')
  @driver.action.double_click(element).perform
  @driver.find_element(:name, 'dob_day_1').send_keys('2')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('3')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('4')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('5')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  @driver.find_element(:name, 'dob_day_1').send_keys('6')
  @driver.find_element(:name, 'dob_day_1').click
  sleep(3)
  element = @driver.find_element(:name, 'dob_day_1')
  @driver.action.double_click(element).perform
  @driver.find_element(:name, 'dob_day_1').send_keys('7')
  @driver.find_element(:name, 'dob_day_1').click
  @driver.find_element(:name, 'dob_day_1').send_keys('8')
  @driver.find_element(:name, 'dob_day_1').click
  @driver.find_element(:name, 'dob_day_1').send_keys('9')
  @driver.find_element(:name, 'dob_day_1').click
  @driver.find_element(:name, 'dob_day_1').send_keys('10')
  @driver.find_element(:name, 'dob_day_1').click
  @driver.find_element(:name, 'dob_day_1').send_keys('11')
  @driver.find_element(:name, 'dob_day_1').click
  @driver.find_element(:name, 'dob_year_1').click
  @driver.find_element(:name, 'dob_year_1').send_keys('1998')
  @driver.find_element(:name, 'passport_1').click
  @driver.find_element(:name, 'passport_1').send_keys('121245367888980')
  @driver.find_element(:name, 'passport_issuance_month_1').click
  dropdown = @driver.find_element(:name, 'passport_issuance_month_1')
  dropdown.find_element(:xpath, "//option[. = '04 April']").click
  @driver.find_element(:name, 'passport_issuance_day_1').send_keys('1')
  @driver.find_element(:name, 'passport_issuance_day_1').click
  @driver.find_element(:name, 'passport_issuance_day_1').send_keys('2')
  @driver.find_element(:name, 'passport_issuance_day_1').click
  @driver.find_element(:name, 'passport_issuance_day_1').send_keys('3')
  @driver.find_element(:name, 'passport_issuance_day_1').click
  element = @driver.find_element(:name, 'passport_issuance_day_1')
  @driver.action.double_click(element).perform
  @driver.find_element(:name, 'passport_issuance_year_1').click
  @driver.find_element(:name, 'passport_issuance_year_1').send_keys('2021')
  @driver.find_element(:name, 'passport_month_1').click
  dropdown = @driver.find_element(:name, 'passport_month_1')
  dropdown.find_element(:xpath, "//option[. = '11 November']").click
  @driver.find_element(:name, 'passport_day_1').send_keys('-1')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_day_1').send_keys('-2')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_day_1').send_keys('-1')
  @driver.find_element(:name, 'passport_day_1').click
  element = @driver.find_element(:name, 'passport_day_1')
  @driver.action.double_click(element).perform
  @driver.find_element(:name, 'passport_day_1').send_keys('0')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_day_1').send_keys('1')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_day_1').send_keys('2')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_day_1').send_keys('3')
  @driver.find_element(:name, 'passport_day_1').click
  element = @driver.find_element(:name, 'passport_day_1')
  @driver.action.double_click(element).perform
  @driver.find_element(:name, 'passport_day_1').send_keys('4')
  @driver.find_element(:name, 'passport_day_1').click
  @driver.find_element(:name, 'passport_year_1').click
  @driver.find_element(:name, 'passport_year_1').send_keys('2023')
  @driver.find_element(:css, '.gateway_bank-transfer img').click
  @driver.find_element(:css, '.custom-checkbox > label').click
  @driver.find_element(:id, 'booking').click
  element = @driver.find_element(:id, 'download')
  @driver.action.move_to_element(element).perform
  @driver.find_element(:id, 'download').click
  @driver.switch_to.frame(0)
  @driver.execute_script("window.scrollTo(0,1)")
  @driver.switch_to.default_content
  element = @driver.find_element(By.CSS_SELECTOR, 'body')
  @driver.action.move_to_element(element, 0, 0).perform
  element = @driver.find_element(:css, '.waves-effect > .info-content')
  @driver.action.move_to_element(element).perform
  element = @driver.find_element(By.CSS_SELECTOR, 'body')
  @driver.action.move_to_element(element, 0, 0).perform
end



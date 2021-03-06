# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('I am signing in') do
  $web_driver.find_element(ElementWarehouse::EMAIL_FIELD).send_keys(TestUser.email)
  sleep 3
  $web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).send_keys(TestUser.password)
  sleep 3
  $web_driver.find_element(ElementWarehouse::LOGIN_BUTTON).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::LOGIN_ACCOUNT_SELECT).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SELECT).click
  sleep 3
end

Then('I start a new conversation') do
	open_new_tab
  $web_driver.get(TestUser.qa_web_widget)
  wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
  $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys('Agent availability Test')
  sleep 3
  $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys(:return)
  sleep 3
  $web_driver.close.last
  $web_driver.switch_to.window( $web_driver.window_handles.first )
end

Then('I check if the conversation came through') do
  sleep 3
  $web_driver.find_element(ElementWarehouse::CONVERSATIONS_TAB).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::QA_INBOUND_TAB).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::QA_OUTBOUND_TAB).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::CONVO_BOTS_TAB).click
  sleep 3
end

Then('I resolve the conversation') do
  $web_driver.find_element(ElementWarehouse::QA_INBOUND_TAB).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::SELECT_INBOUND_CHAT).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::RESOLVE_DROP_DOWN).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::RESOLVE_BUTTON).click
  sleep 3
  $web_driver.find_element(ElementWarehouse::GO_BACK_TO_DASHBOARD).click
end
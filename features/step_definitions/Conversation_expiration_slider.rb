# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('I am on the Company Unit Settings page') do
	$web_driver.find_element(ElementWarehouse::EMAIL_FIELD).send_keys(TestUser.email)
	$web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).send_keys(TestUser.password)
	$web_driver.find_element(ElementWarehouse::LOGIN_BUTTON).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::LOGIN_ACCOUNT_SELECT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SELECT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::SETTINGS_TAB).click
	sleep 3
end

Then('I Adjust Conversation Expiry Slider by One hour') do
	scroll_to($web_driver.find_element(ElementWarehouse::CONVERSATION_RESOLVE_SLIDER))
	sleep 3
	$web_driver.find_element(ElementWarehouse::CONVERSATION_RESOLVE_SLIDER_TIME).click
end

Then('I initiate a conversation') do
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

Then('I check if the conversation has been Closed after one hour') do
	$web_driver.find_element(ElementWarehouse::CONVERSATION_HISTORY_TAB).click
end

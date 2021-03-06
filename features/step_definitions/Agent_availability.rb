# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('The Agent is not available') do
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
	$web_driver.find_element(ElementWarehouse::AGENT_IMAGE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::AVAILABILITY_TOGGLE).click
	sleep 5
end

Then('I make a conversation and check if it comes through') do
	open_new_tab
	sleep 3
	$web_driver.get(TestUser.qa_web_widget)
	sleep 3
	wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys('Agent availability Test')
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys(:return)
	$web_driver.close.last
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	sleep 2
	$web_driver.navigate.refresh
	sleep 5
	$web_driver.find_element(ElementWarehouse::CONVERSATIONS_TAB).click
	sleep 4
	$web_driver.page_source.include? 'Unassigned conversations in queue'
	sleep 4
end

Then('I switch back to available and check if the conversation comes through') do
	$web_driver.find_element(ElementWarehouse::AGENT_IMAGE_CONVERSATION_VIEW).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::AVAILABILITY_TOGGLE).click
	sleep 3
	$web_driver.navigate.refresh
	sleep 3
	$web_driver.find_element(ElementWarehouse::SELECT_INBOUND_CHAT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::RESOLVE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::RESOLVE_BUTTON).click
	sleep 3
end

Then('I set the time') do
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::SETTINGS_TAB).click
	sleep 3
	scroll_to($web_driver.find_element(ElementWarehouse::USER_INACTIVITY_TOGGLE))
	sleep 5
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_TOGGLE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_INPUT).click
	sleep 3
	$web_driver.action.key_down(:control).send_keys('a').key_down(:control).send_keys('c').key_up(:control).perform
	sleep 3
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_INPUT).send_keys(:backspace)
	sleep 3
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_INPUT).send_keys('1')
	sleep 6
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_INPUT_SAVE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::USER_INACTIVITY_TOGGLE).click
end
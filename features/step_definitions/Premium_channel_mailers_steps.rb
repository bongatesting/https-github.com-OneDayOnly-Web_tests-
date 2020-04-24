Given('I login')do
	$web_driver.navigate.to "https://#{ENV['HOST']}.hi.guru/"
end

Then('I add the premium channel')do
	$web_driver.find_element(ElementWarehouse::EMAIL_FIELD).click
	$web_driver.find_element(ElementWarehouse::EMAIL_FIELD).send_keys(TestUser.test_user_2_email)
	$web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).click
	$web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).send_keys(TestUser.hi_guru_password)
	$web_driver.find_element(ElementWarehouse::LOGIN_BUTTON).click
	sleep 10
	$web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::ADD_CHANNEL_BUTTON).click
	sleep 6
	$web_driver.find_element(ElementWarehouse::TWITTER_CHANNEL).click
	sleep 6
	$web_driver.find_element(ElementWarehouse::ADD_TWITTER_CHANNEL_BUTTON).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::CONFIRM_BUTTON).click
	sleep 6
	$web_driver.find_element(ElementWarehouse::TWITTER_EMAIL_INPUT).click
	$web_driver.find_element(ElementWarehouse::TWITTER_EMAIL_INPUT).type(TestUser.test_user_2)
	sleep 2
	$web_driver.find_element(ElementWarehouse::TWITTER_PASSWORD_INPUT).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::TWITTER_PASSWORD_INPUT).type(TestUser.new_password)
	$web_driver.find_element(ElementWarehouse::AUTHORIZE_APP_BUTTON).click
	sleep 10
	$web_driver.find_element(ElementWarehouse::ADD_BUTTON).click
	sleep 6
	$web_driver.execute_script( "window.open()" )
	$web_driver.switch_to.window( $web_driver.window_handles.last )
	$web_driver.get 'https://login.microsoftonline.com/'
	sleep 4
	$web_driver.find_element(ElementWarehouse::OUTLOOK_EMAIL_FIELD).send_keys(TestUser.test_user_2_email)
	sleep 2
	$web_driver.find_element(ElementWarehouse::OUTLOOK_NEXT_BUTTON).click
	sleep 4
	$web_driver.find_element(ElementWarehouse::OUTLOOK_PASSWORD_FIELD).type(TestUser.new_password)
	sleep 2
	$web_driver.find_element(ElementWarehouse::OUTLOOK_SIGN_IN_BUTTON).click
	sleep 2
	# if $web_driver.find_elements(ElementWarehouse::SKIP_FOR_NOW_TEXT).first
	# 	$web_driver.find_elements(ElementWarehouse::SKIP_FOR_NOW_TEXT).first.click
	# 	$stdout.puts 'Skip Option Displayed'.green
	# elsif $web_driver.find_elements(ElementWarehouse::OUTLOOK_STAY_SIGNED_IN_NO_BUTTON).first
	# 	$web_driver.find_elements(ElementWarehouse::OUTLOOK_STAY_SIGNED_IN_NO_BUTTON).first.click
	# 	$stdout.puts 'Stay Signed in Displayed'.blue
	# end
	# $stdout.flush
	# sleep 2
	$web_driver.find_element(ElementWarehouse::OUTLOOK_ICON).click
	sleep 10
	$web_driver.switch_to.window( $web_driver.window_handles.last )
	wait_for_twitter_email_1
	sleep 2
	$web_driver.find_element(ElementWarehouse::PREMIUM_MAILER).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::PREMIUM_MAILER_TEXT)
end

Then('I delete the premium channel')do
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	$web_driver.find_element(ElementWarehouse::CHANNEL_OPTIONS).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::DELETE_CHANNEL).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::CONFIRM_DELETE_BUTTON).click
	sleep 10
	$web_driver.switch_to.window( $web_driver.window_handles.last )
	wait_for_twitter_email_2
	$web_driver.find_element(ElementWarehouse::PREMIUM_MAILER_2).click
	sleep 2
	$web_driver.find_element(ElementWarehouse::PREMIUM_MAILER_TEXT)
end
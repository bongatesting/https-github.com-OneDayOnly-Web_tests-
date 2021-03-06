# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('I am applying for a Job post') do
	$web_driver.get('https://www.ilabquality.com/careers/')
	scroll_to($web_driver.find_element(ElementWarehouse::SELECT_COUNTRY))
	sleep 3
	$web_driver.find_element(ElementWarehouse::SELECT_COUNTRY).click
end

Then('I fill in the form and apply for the job') do
	$web_driver.find_element(ElementWarehouse::SELECT_JOB_POSITION).click
	sleep 4
	scroll_to($web_driver.find_element(ElementWarehouse::ILAB_APPLY_ONLINE))
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_APPLY_ONLINE).click
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_APPLICANT_NAME_FIELD).send_keys('Bonga Fati')
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_EMAIL_FIELD).send_keys('automationAssessment@iLABQuality.com')
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_PHONE_FIELD).send_keys('0835687859')
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_MESSAGE_FILED).send_keys('I would like to apply for the QA Test Analyst position')
	sleep 4
	$web_driver.find_element(ElementWarehouse::ILAB_SUBMIT_BUTTON).click
	sleep 4
	$web_driver.page_source.include? 'You need to upload at least one file.'
	sleep 5
end
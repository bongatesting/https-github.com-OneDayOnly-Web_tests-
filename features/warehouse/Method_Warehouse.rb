# frozen_string_literal: true

module MethodWarehouse
end

def backup_long_press
  Appium::TouchAction.new.press(x: 280, y: 660).wait(1000).release.perform
end

def scroll_down
  swipe(start_x: 0, start_y: 1418, end_x: 0, end_y: 541)
end

def scroll_to(element)
  $web_driver.execute_script("arguments[0].scrollIntoView();",element)
end

def scroll_up
  swipe(start_x: 530, start_y: 340, end_x: 530, end_y: 1300)
end

def browser_scroll
  $web_driver.execute_script('window.scrollTo(0, document.body.scrollHeight)')
end

def scroll_to_element(element, locator = nil)
  script_string = 'var viewPortHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);' \
                  'var elementTop = arguments[0].getBoundingClientRect().top;' \
                  'window.scrollBy(0, elementTop-(viewPortHeight/2));'
  element = element.nil? ? find(locator) : element
  execute_script(script_string, element)
end

# def scroll_in_page
#   $web_driver.find_element(class: 'device-list-container').click
#   scroll = $web_driver.find_element(xpath: ".//*[contains(., 'Panic Position')]")
#   scroll.send_keys(:page_down)
# end

def scroll_in_dashboard
  scroll = $web_driver.find_element(ElementWarehouse::RESPONSIVENESS_TITLE)
  scroll.Location_once_scrolled_into_view
end

def open_new_tab
  $web_driver.execute_script('window.open()')
  sleep 1
  $web_driver.switch_to.window($web_driver.window_handles.last)
end

def wait_for_widget
  until $web_driver.find_element(ElementWarehouse::FASTCOMM_WIDGET).displayed?
    sleep 2 # check if message received
  end
rescue StandardError
  wait_for_widget # this block get's executed if there is any kind of exception error
end

def check_for_first_reply
  sleep 10 until $web_driver.find_element(ElementWarehouse::REPLY_CHAT_GENERIC_1).displayed?
    if $web_driver.find_elements(ElementWarehouse::CONVO_ASSIGNED_TEXT).first
      assignee = $web_driver.find_elements(ElementWarehouse::CONVO_ASSIGNED_TEXT).text
      $stdout.puts 'Conversation assigned to: '.blue + assignee.green
      check_for_second_reply
    elsif $web_driver.find_elements(ElementWarehouse::REPLY_CHAT_GENERIC_1).first
      $stdout.puts 'Conversation assigned text not displayed'.red
    end
rescue StandardError
  check_for_first_reply # this block get's executed if there is any kind of exception error
end

def check_for_second_reply
  sleep 10 until $web_driver.find_element(ElementWarehouse::REPLY_CHAT_GENERIC_2).displayed?
rescue StandardError
  check_for_second_reply # this block get's executed if there is any kind of exception error
end

def check_for_resolved
  until $web_driver.find_element(ElementWarehouse::CONVERSATION_AGENT_RESOLVED).displayed?
    sleep 10 # check if message received
  end
rescue StandardError
  check_for_resolved # this block get's executed if there is any kind of exception error
end

def wait_for_email
  until $web_driver.find_element(ElementWarehouse::RECEIVED_MAIL).displayed?
    sleep 10 # check if message received
  end
rescue StandardError
  wait_for_email # this block get's executed if there is any kind of exception error
end

def wait_for_twitter_email_1
  until $web_driver.find_element(ElementWarehouse::PREMIUM_MAILER).displayed?
    sleep 10 # check if message received
  end
rescue StandardError
  wait_for_twitter_email_1 # this block get's executed if there is any kind of exception error
end

def wait_for_twitter_email_2
  until $web_driver.find_element(ElementWarehouse::PREMIUM_MAILER_2).displayed?
    sleep 10 # check if message received
  end
rescue StandardError
  wait_for_twitter_email_2 # this block get's executed if there is any kind of exception error
end

def wait_for_enter_name_field
  begin
    until ($web_driver.find_element(ElementWarehouse::ENTER_NAME_FIELD)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_enter_name_field# this block get's executed if there is any kind of exception error
  end
end

def wait_for_your_role_option
  begin
    until ($web_driver.find_element(ElementWarehouse::YOUR_ROLE_OPTION)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_your_role_option# this block get's executed if there is any kind of exception error
  end
end

def wait_for_sign_up_checkbox
  begin
    until ($web_driver.find_element(ElementWarehouse::SIGN_UP_CHECKBOX)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_sign_up_checkbox# this block get's executed if there is any kind of exception error
  end
end

def wait_for_company_unit
  begin
    until ($web_driver.find_element(ElementWarehouse::LOGIN_CU_SELECT)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_company_unit# this block get's executed if there is any kind of exception error
  end
end

def wait_for_download_icon
  begin
    until ($web_driver.find_element(ElementWarehouse::DOWNLOAD_ICON)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_download_icon# this block get's executed if there is any kind of exception error
  end
end

def wait_for_public_chat
  begin
    sleep 10 until ($web_driver.find_element(ElementWarehouse::PUBLIC_CHAT)).displayed?
    end
  rescue
    nil
end

def wait_for_account_login_select
  begin
    until ($web_driver.find_element(ElementWarehouse::LOGIN_ACCOUNT_SELECT)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_account_login_select# this block get's executed if there is any kind of exception error
  end
end

def wait_for_allow_notifications
  begin
    until ($web_driver.find_element(ElementWarehouse::ALLOW_NOTIFICATION)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_allow_notifications# this block get's executed if there is any kind of exception error
  end
end

def wait_for_browser_notifications
  begin
    until ($web_driver.find_element(ElementWarehouse::BROWSER_NOTIFICATION)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_browser_notifications# this block get's executed if there is any kind of exception error
  end
end

def wait_for_search_field
  begin
    until ($web_driver.find_element(ElementWarehouse::SEARCH_FIELD)).displayed?
      sleep 10 # check if message received
    end
  rescue
    wait_for_search_field# this block get's executed if there is any kind of exception error
  end
end

# scroll_in_page
# $web_driver.find_element(ElementWarehouse::RESPONSIVENESS_TITLE).click
# scroll.send_keys(:page_down)


# Upload file
# elem = $web_driver.execute_script(js, elem)
# elem.sendKeys("/path/to/file")

# To save a screenshot on specific step:
# # $web_driver.save_screenshot (Dir.pwd + "/tmp/screenshots/" + "Failed_sc_#{Time.now.strftime('screenshot__%d_%m_%Y__%H_%M_%S')}.png")

# Wait for a specific element to show up
# wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# wait.until { driver.find_element(:id => "foo") }

##----Touch Actions Method----##
# Appium::TouchAction.new.long_press(x: 500, y: 520, duration: 2000).perform
# Appium::TouchAction.new.press(x: 280, y: 530).wait(2000).release.perform
# Appium::TouchAction.new.tap(x: 76, y: 139, count: 1).release.perform

##----Scroll Actions Method----##
# Appium::TouchAction.new.scroll(10, 100).perform
# scroll_to_exact('your text you are looking for here').click

# ##----Swipe notifications bar down----##
# swipe(start_x: 520, start_y: 55, end_x: 520, end_y: 1160)
# ##----Swipe notifications bar up----##
# swipe(start_x: 520, start_y: 1150, end_x: 520, end_y: 55)

# ##----Wait Method----##
# wait_true{find_element(ElementWarehouse::SELECT_SEARCH_CHANNEL).click}
# wait_until{find_element(ElementWarehouse::ACTION_BUTTON).click}
# wait = Selenium::WebDriver::Wait.new(:timeout => 15)

# ##----Native Keyboard Method----##
# hide_keyboard if is_keyboard_shown
# driver.press_keycode(66) - - - - Pressing Enter on Keyboard

# ##----Find Element by Index Method----## Just Change the instance to the index (ie: instance(1) or instance(2))---
# INDEX_1 = find_element(:uiautomator, 'new UiSelector().className("android.view.ViewGroup").instance(0)').click

# ##-----Find Element by certain Text within the String-----##
# find_element(uiautomator: 'new UiSelector().textContains("co.za")')
# find('faq')
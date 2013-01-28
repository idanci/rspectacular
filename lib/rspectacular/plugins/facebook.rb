if defined?(Capybara::Driver::Base)
  RSpec.configure do |config|
    config.after(:each, :facebook => true) do
      visit 'https://www.facebook.com'

      if Capybara.current_session.has_link? idsf('the Facebook account menu')
        click_link   idsf('the Facebook account menu')
        click_button 'Log Out'

        page.driver.browser.switch_to.alert.accept
      end
    end
  end
end

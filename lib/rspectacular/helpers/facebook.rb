def fill_in_facebook_login_form(options = {})
  facebook_user = options[:with]

  sleep 1

  within sf('the Facebook login form') do
    fill_in               'Email',    :with => facebook_user['email']
    fill_in               'Password', :with => facebook_user['password']
    click_link_or_button  'Log In'
  end
end

def log_in_to_facebook(user)
  ###
  # We use this URL due to how selenium throws an error if you
  # interact with items that are off the visible area of the
  # page
  #
  visit 'https://www.facebook.com/login.php'

  sleep 3

  fill_in               'Email',     :with => user['email']
  fill_in               'Password',  :with => user['password']

  click_link_or_button  'Log In'
end

def log_out_of_facebook
  click_link   idsf('the Facebook account menu')
  click_button 'Log Out'
end

def authenticate_with_facebook
  visit '/users/auth/facebook'
end

def click_facebook_tab(tab_name)
  find(:xpath, %Q{.//span[starts-with(., '#{tab_name}')]/../..}).click()
end

def remove_app_from_authorized_apps_at_facebook(app_name)
  visit 'http://www.facebook.com/settings?tab=applications'

  page.should_not have_content 'You have not authorized any apps to interact with your Facebook account.'
  page.should     have_content app_name

  find("input[type='button'][title='Remove']").click()

  sleep 1

  click_link_or_button 'Remove'

  sleep 1

  page.should_not have_content app_name

  log_out_of_facebook
end

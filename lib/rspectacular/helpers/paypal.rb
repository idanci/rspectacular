def log_in_to_paypal_sandbox(email, password)
  visit 'https://developer.paypal.com'

  if page.has_button? 'Log In'
    fill_in               'Email',    :with => email
    fill_in               'Password', :with => password
    click_link_or_button  'Log In'
  end
end

def log_out_of_paypal
  visit 'https://www.paypal.com/us/cgi-bin/webscr?cmd=_logout'
end

def log_out_of_paypal_sandbox
  visit 'https://developer.paypal.com'

  if page.has_link? 'Log Out'
    click_link 'Log Out'
  end
end

def fill_in_paypal_login_form(email, password)
  fill_in               'Email',           :with => email
  fill_in               'PayPal password', :with => password
  click_link_or_button  'Log In'

  check                 'esignOpt'
  click_link_or_button  'Agree and Continue'
end

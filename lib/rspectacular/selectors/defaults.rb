module RSpectacular
  Selectors = {}

  Selectors.merge!(
    /the Facebook application/ => lambda do
      frame_element = find 'html#facebook div#pagelet_app_runner iframe'
      frame_element[:id]
    end,

    /the flash(.*)/ => lambda do |*args|
      flash_type       = args[0][/the flash(.*)/, 1]
      flash_type_class = flash_type.strip
      flash_type_class = flash_type_class.empty? ? '' : ".#{flash_type_class}"

      ".flash#{flash_type_class} p"
    end,

    ###
    # Facebook
    #
    /the Facebook login form/             => 'html#facebook form#login_form',
    /the Facebook page timeline nav bar/  => 'html#facebook #fbTimelineNavTopRow',
    /the Facebook account menu/           => '#navAccountLink',

    ###
    # PayPal
    #
    /the "Pay with PayPal" button/        => 'input[alt="Check out with PayPal"]',

    ###
    # Forms
    #
    /the errors for (.*)/                 => lambda { "#{sf $1}+div.error" },

    ###
    # Windows
    #
    /the most recently opened window/     => lambda { page.driver.browser.window_handles.last },
    /the alert dialog/                    => lambda { page.driver.browser.switch_to.alert },

    ###
    # Date Picker Buttons
    #
    /the date picker button for today/    => '.ui-datepicker-today',

    ###
    # Model Links
    #
    /the (.*) button for/                 => lambda { "##{$1.gsub(/ /, '_')}_#{args[0].class.name.underscore}_#{args[0].id}_link" }
  )
end

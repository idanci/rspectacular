Capybara.javascript_driver = :selenium

Capybara.default_host = Chirrpy::CONFIG[:host_with_port]
Capybara.app_host     = Chirrpy::CONFIG[:base_url]
Capybara.server_port  = Chirrpy::CONFIG[:port]

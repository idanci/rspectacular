module  OmniAuth
module  MockAuthentications
module  Ebay
  def self.authentication
    OmniAuth::AuthHash.new(
      'provider'    => 'ebay',
      'uid'         => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      'info'        =>
      {
        'ebay_id'     => 'my_username',
        'ebay_token'  => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        'email'       => 'username@example.com',
        'full_name'   => 'Gorby Thunderhorse',
        'country'     => 'US'
      },
      'credentials' => {},
      'extra'       => {
        'internal_return_to' => nil
      }
    )
  end
end
end
end

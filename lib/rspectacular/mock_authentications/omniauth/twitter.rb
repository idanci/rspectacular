module  OmniAuth
module  MockAuthentications
module  Twitter
  def self.user
    {
      'provider'    => 'twitter',
      'uid'         => '100002971692646',
      'credentials' => {
        'token' => 'my_twitter_token'
      },
      'info'        => {
        'name'        => 'Sharon Letuchysky',
        'email'       => nil,
        'nickname'    => nil,
        'first_name'  => 'Sharon',
        'last_name'   => 'Letuchysky',
        'location'    => nil,
        'description' => nil,
        'image'       => 'http://graph.facebook.com/100002971692646/picture?type=square',
        'phone'       => nil,
        'urls'        => {
          'Facebook' => 'http://www.facebook.com/profile.php?id=100002971692646',
          'Website'  => nil
        }
      },
      'extra'       => {
        'user_hash' => {
          'id'           => '100002971692646',
          'name'         => 'Sharon Ambiggjcaccg Letuchysky',
          'first_name'   => 'Sharon',
          'middle_name'  => 'Ambiggjcaccg',
          'last_name'    => 'Letuchysky',
          'link'         => 'http://www.facebook.com/profile.php?id=100002971692646',
          'gender'       => 'female',
          'locale'       => 'en_US',
          'updated_time' => '2011-09-11T17:00:51+0000'
        }
      }
    }
  end
end
end
end

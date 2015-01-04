CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIYJTMEBHFWV6I3PA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'gepc'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  #config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  
end

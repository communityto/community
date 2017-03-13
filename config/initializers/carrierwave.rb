CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id: Figaro.env.aws_access_key_id!,
    aws_secret_access_key: Figaro.env.aws_secret_access_key!
  }
  config.fog_directory  = 'community.toronto'
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

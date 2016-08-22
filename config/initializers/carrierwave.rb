CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'us-east-1',
      path_style: true
  }

  case Rails.env
    when 'development'
      config.fog_directory  = 'protospace-images-uploader'
      config.asset_host = 'https://s3.amazonaws.com/protospace-images-uploader'
    when 'production'
      config.fog_directory  = 'protospace-images-uploader'
      config.asset_host = 'https://s3.amazonaws.com/protospace-images-uploader'
    when 'test'
      config.storage = :file
  end
end

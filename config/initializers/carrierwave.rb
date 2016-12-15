# config/initiliazers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => "#{ENV['AWS_ACCESS_KEY_ID']}",
    :aws_secret_access_key => "#{ENV['AWS_SECRET_ACCESS_KEY']}",
    :region                => "#{ENV['S3_REGION']}",
    :path_style            => true
  }

  config.fog_directory =  "#{ENV['S3_BUCKET_NAME']}"
  config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku


  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
      
  config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
end
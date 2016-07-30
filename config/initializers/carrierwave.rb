if Rails.env.test?
    CarrierWave.configure do |config|
        config.storage = :file
    end
else
    CarrierWave.configure do |config|
        config.storage = :fog
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
        region: 'us-east-1'
      }

        case Rails.env
        when 'development'
            config.fog_directory  = 'protospace.images/development'
            config.asset_host = 'https://s3.amazonaws.com/protospace.images/development'
        when 'production'
            config.fog_directory  = 'protospace.images/production'
            config.asset_host = 'https://s3.amazonaws.com/protospace.images/production'
        end
    end
end

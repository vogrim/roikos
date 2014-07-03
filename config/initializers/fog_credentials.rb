CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID']'AKIAIEGZHQE5T3SWC34A',
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']'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',
  }
  config.fog_directory  = 'roikos-crm'
end
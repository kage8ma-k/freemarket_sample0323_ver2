require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # config.storage = :fog
  # config.fog_provider = 'fog/aws'
  # config.fog_credentials = {
  #   provider: 'AWS',

  #   region: 'ap-northeast-1'
  # }

  # config.fog_directory  = 'frema-img'
  # config.asset_host = 'arn:aws:iam::232623227866:user/free_app'
end

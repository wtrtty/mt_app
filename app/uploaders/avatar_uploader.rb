class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  process resize_to_fit: [100, 100]
end

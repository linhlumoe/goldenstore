class ImageUploader < BaseUploader
  version :thumbnail do
    resize_to_fit(100, 100)
  end
end

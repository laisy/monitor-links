class Screenshot < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :link
end

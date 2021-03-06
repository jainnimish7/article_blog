class Image < ActiveRecord::Base
  belongs_to :article
  has_attached_file :photo, styles: {
      thumb: "100x100#",
      small: "150x150>",
      medium: "200x200",
      large: "1024x768" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end

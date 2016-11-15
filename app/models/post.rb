class Post < ApplicationRecord
  #you are checking if files are present in a loop
  validates :image, presence: true


  #we are re-sizing any image that we accept to the normal.
  has_attached_file :image, styles: {:medium => "640x"}
  #allows content type of the file assigned
  validates_attachment_content_type :image, :content_type=>/\Aimage\/.*\Z/
end

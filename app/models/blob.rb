class Blob < ApplicationRecord
  belongs_to :user
  has_attached_file :blob_data
  validates_attachment_presence :blob_data
  do_not_validate_attachment_file_type :blob_data
  attr_accessor :user_id
end

class Blob < ApplicationRecord
  belongs_to :user
  has_attached_file :blob_data,
                    :url => "/blobs/get/:id",
                    :path => "hosted_data/blobs/:id/:basename.:extension"
  validates_attachment_presence :blob_data
  do_not_validate_attachment_file_type :blob_data
  attr_accessor :user_id
end

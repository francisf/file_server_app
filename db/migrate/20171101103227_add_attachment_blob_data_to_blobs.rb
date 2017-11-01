class AddAttachmentBlobDataToBlobs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :blobs do |t|
      t.attachment :blob_data
    end
  end

  def self.down
    remove_attachment :blobs, :blob_data
  end
end

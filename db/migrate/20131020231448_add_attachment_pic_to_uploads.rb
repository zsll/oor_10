class AddAttachmentPicToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :uploads, :pic
  end
end

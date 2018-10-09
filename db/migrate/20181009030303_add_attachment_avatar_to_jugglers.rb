class AddAttachmentAvatarToJugglers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :jugglers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :jugglers, :avatar
  end
end

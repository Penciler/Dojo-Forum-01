class ModifyReplyUpdateAt < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :reply_update_at
  	add_column :posts, :reply_update_at, :datetime, :default => Time.now
  end
end

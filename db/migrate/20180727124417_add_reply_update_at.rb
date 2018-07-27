class AddReplyUpdateAt < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :reply_update_at, :text, :default => 'nil'
  end
end

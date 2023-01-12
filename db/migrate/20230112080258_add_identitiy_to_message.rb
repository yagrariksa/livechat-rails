class AddIdentitiyToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :sender, :string
    add_column :messages, :pc, :string
  end
end

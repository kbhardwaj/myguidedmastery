class AddDetailsToNotebooks < ActiveRecord::Migration
  def change
    add_column :notebooks, :access, :string
    add_column :notebooks, :user_id, :integer
  end
end

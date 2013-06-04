class AddNotebookIdToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :notebook_id, :integer
  end
end

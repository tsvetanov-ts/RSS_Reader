class AddIndexToEntriesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :entries, :title
  end
end

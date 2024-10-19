class AddTimeToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :time, :string
  end
end

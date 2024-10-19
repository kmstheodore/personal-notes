class AddDefaultToCompleteInNotes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :notes, :complete, from: nil, to: false
  end
end

class ChangeComplete < ActiveRecord::Migration
  def change
    remove_column(:repairs, :completed)

    change_table :repairs do |t|
      t.boolean :completed, default: false
    end
  end
end

class ChangeColumnName < ActiveRecord::Migration
  def change
    change_table :repairs do |t|
      t.rename :description, :repair_description
  end
end
end

class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.datetime :date_completed
      t.boolean :completed
      t.timestamps null: false
    end

    change_table :users do |t|
      t.string :aptnum
      t.string :phone
    end
  end
end

class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :body
      t.integer :assigned_to
      t.datetime :completed_at
      t.references :user
      t.references :list

      t.timestamps
    end
    add_index :items, :user_id
    add_index :items, :list_id
  end
end

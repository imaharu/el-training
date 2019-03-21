class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.datetime :closed_on
      t.integer :status, default: 1
      t.integer :priority, default: 0 # 0は未設定

      t.timestamps
    end
  end
end

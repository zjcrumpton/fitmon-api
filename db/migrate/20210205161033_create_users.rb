class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :goal
      t.integer :days_per_week
      t.string :gender
      t.integer :age
      t.integer :weight
      t.string :height
      t.string :experience

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :index, unique: true
      t.string :password_digest, null: false
      t.string :invoke
      t.string :active_record

      t.timestamps
    end
  end
end

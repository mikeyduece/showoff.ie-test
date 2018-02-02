class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :profile_pic
      t.string :username
      t.string :bio

      t.timestamps
    end
  end
end

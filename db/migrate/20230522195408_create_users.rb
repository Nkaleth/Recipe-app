class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_avatar, default: '/assets/user_avatar-svgrepo-com.svg'
      t.timestamps
    end
  end
end

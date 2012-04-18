class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :handle
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

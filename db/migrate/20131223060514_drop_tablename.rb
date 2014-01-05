class DropTablename < ActiveRecord::Migration
  def up
    drop_table :sessions
  end

  def down
    create_table :sessions do |t|
      t.string :session_id
      t.integer :user_id
      t.text :data

      t.timestamps        
    end
    add_index :tablenames, :anothertable_id
  end
end

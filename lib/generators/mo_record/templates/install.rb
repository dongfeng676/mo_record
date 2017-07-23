class CreateLoggedMos < ActiveRecord::Migration[5.0]
  def change
    create_table :logged_mos do |t|
      t.integer :target_id
      t.string :target_type
      t.text :log_content
      t.string :action
      t.integer :version

      t.timestamps
    end
  end
end

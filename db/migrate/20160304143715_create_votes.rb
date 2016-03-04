class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.integer :voteable_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

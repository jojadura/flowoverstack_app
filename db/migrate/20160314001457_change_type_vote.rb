class ChangeTypeVote < ActiveRecord::Migration
   
  def up
    change_table :votes do |t|
      t.change :voteable_type, :string
    end
  end

  def down
    change_table :votes do |t|
      t.change :voteable_type, :integer
    end
  end
end
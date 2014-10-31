class CreateFocus < ActiveRecord::Migration
  def change
    create_table :focus do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateKeypaths < ActiveRecord::Migration
  def change
    create_table :keypaths do |t|
      t.string :name

      t.timestamps
    end
  end
end

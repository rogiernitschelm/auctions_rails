class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|
      t.references :user, null: false

      t.timestamps
    end
  end
end

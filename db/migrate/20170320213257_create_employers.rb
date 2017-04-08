class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.references :user, null: false

      t.string :company_name, null: false
      t.string :company_location, null: false
      t.string :company_business, null: false

      t.string :chamber_of_commerce, null: false
      t.boolean :recruitment_agency, default: false, null: false

      t.timestamps
    end
  end
end

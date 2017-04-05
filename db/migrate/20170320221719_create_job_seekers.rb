class CreateJobSeekers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_seekers do |t|
      t.references :user, null: false

      t.timestamps
    end
  end
end

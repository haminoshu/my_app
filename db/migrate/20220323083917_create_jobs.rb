class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :jobname, null: false, default: ""
      t.text :feature,   null: false
      t.timestamps
    end
  end
end

class CreateAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :avatars do |t|
      t.integer    :age,    null: false
      t.text       :hobby,  null: false
      t.text       :motto,  null: false
      t.references :user,   foreign_key: true
      t.timestamps
    end
  end
end

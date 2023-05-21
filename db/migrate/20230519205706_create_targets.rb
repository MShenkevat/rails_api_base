class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.float :radius
      t.integer :topic_id

      t.timestamps
    end
  end
end

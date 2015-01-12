class CreateUserChallenges < ActiveRecord::Migration
  def change
    create_table :user_challenges do |t|
      t.boolean :success
      t.references :user
      t.references :challenge

      t.timestamps null: false
    end
  end
end

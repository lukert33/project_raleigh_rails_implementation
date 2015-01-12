class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :html_display
      t.references :page
      t.references :success_page
      t.references :fail_page

      t.timestamps null: false
    end
  end
end

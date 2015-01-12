class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :body
      t.references :next_page

      t.timestamps null: false
    end
  end
end

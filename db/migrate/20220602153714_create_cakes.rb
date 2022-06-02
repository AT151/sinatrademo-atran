class CreateCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :cakes do |t|
      t.string :name, null: false, default: ''
    end
    
    add_index :cakes, :name, unique: true
  end
end

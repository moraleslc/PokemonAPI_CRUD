class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string "name"
      t.string "pokemon_type"
      t.integer "level"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end

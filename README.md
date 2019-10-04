# Pokedex README

This is a Pokemon Database with all credit going to https://github.com/fanzeyi/pokemon.json
for the dataset

setup:

* bundle

* rails db:create

* rails db:migrate

* run tasks:
rake import_json:import_types
rake import_json:import_pokemon
rake import_json:import_items
rake import_json:import_moves
rake import_json:import_sprites
rake import_json:import_images

* rails s

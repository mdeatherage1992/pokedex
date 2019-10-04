require 'json'
namespace :import_json do

  task :import_types => :environment do
    parsed = File.open('/Users/matthewdeatherage/desktop/pokemon_api/lib/tasks/types.json')
    json = JSON.load(parsed)
    json.each do |row|
      type = PokeType.create(english_name: row["english"], japanese_name: row["japanese"], chinese_name: row["chinese"])
      end
  end

  task :import_pokemon => :environment do
    parsed = File.open('/Users/matthewdeatherage/desktop/pokemon_api/lib/tasks/pokedex.json')
    json = JSON.load(parsed)
    json.each do |row|
      if row["id"] < 10
        image_id = "00" + row["id"].to_s + "MS"
      end
      if row["id"] >= 10 && row["id"] < 100
        image_id = "0" + row["id"].to_s + "MS"
      end
      if row["id"] >= 100
        image_id = row["id"].to_s + "MS"
      end
      english_name = row["name"]["english"]
      japanese_name = row["name"]["japanese"]
      chinese_name = row["name"]["chinese"]
      french_name = row["name"]["french"]
      types = row["type"]
      hp = row["base"]["HP"]
      attack = row["base"]["Attack"]
      defense = row["base"]["Defense"]
      sp_attack = row["base"]["Sp. Attack"]
      sp_defense = row["base"]["Sp. Defense"]
      speed = row["base"]["Speed"]
      pokemon = Pokemon.create(
        image_id: image_id,
        english_name: english_name,
        japanese_name: japanese_name,
        chinese_name: chinese_name,
        french_name: french_name,
        hp: hp,
        attack: attack,
        defense: defense,
        sp_attack: sp_attack,
        sp_defense: sp_defense,
        speed: speed
      )
      types.each do |t|
        if  PokeType.find_by(english_name: t)
          type = PokeType.find_by(english_name: t)
        else
          type = PokeType.new(english_name: t)
        end
        pokemon_type = PokemonType.create(poke_type_id: type.id, pokemon_id: pokemon.id)
      end
    end
  end

  task :import_items => :environment do
    parsed = File.open('/Users/matthewdeatherage/desktop/pokemon_api/lib/tasks/items.json')
    json = JSON.load(parsed)
    json.each do |row|
      item = Item.create(english_name: row["name"]["english"],japanese_name: row["name"]["japanese"],chinese_name: row["name"]["chinese"])
      end
  end
  task :import_moves => :environment do
    parsed = File.open('/Users/matthewdeatherage/desktop/pokemon_api/lib/tasks/moves.json')
    json = JSON.load(parsed)
    json.each do |row|
      type = PokeType.find_by(english_name: row["type"])
      move = Move.create(accuracy: row["accuracy"], move_type: row["type"], poke_type_id: type.id, jname: row["jname"],
        cname: row["cname"], name: row["ename"], category: row["category"], power: row["power"], pp: row["pp"]
       )
      end
    end

    task :import_sprites => :environment do
      Dir.foreach('/Users/matthewdeatherage/desktop/pokemon_api/lib/sprites') do |item|
        next if item == '.' or item == '..'
        file =  File.open("/Users/matthewdeatherage/desktop/pokemon_api/lib/sprites/#{item}")
        if Pokemon.find_by(image_id: item.split('.png')[0])
        pokemon = Pokemon.find_by(image_id: item.split('.png')[0])
        pokemon.sprite.attach(
          filename: item,
          io: file)
        pokemon.save!
        else
        puts item
        end
      end
  end

  task :import_images => :environment do
    Dir.foreach('/Users/matthewdeatherage/desktop/pokemon_api/lib/images') do |item|
      next if item == '.' or item == '..'
      file =  File.open("/Users/matthewdeatherage/desktop/pokemon_api/lib/images/#{item}")
      if Pokemon.find_by(image_id: item.split('.png')[0] + 'MS')
      pokemon = Pokemon.find_by(image_id: item.split('.png')[0] + 'MS')
      pokemon.picture.attach(
        filename: item,
        io: file)
      pokemon.save!
      else
      puts item
      end
    end
end

end

Element.find_or_create_by(name: 'Blaze')
Element.find_or_create_by(name: 'Frost')
Element.find_or_create_by(name: 'Radiant')
Element.find_or_create_by(name: 'Shock')
Element.find_or_create_by(name: 'Umbral')

20.times do
  name = Faker::Games::LeagueOfLegends.masteries
  perk = Perk.find_or_initialize_by(name: name)
  perk.desc = name
  6.times do |i|
    perk.send("point_#{i+1}=", "+#{i+1}")
  end
  perk.save!
end

5.times do
  Location.find_or_create_by(name: Faker::Movies::LordOfTheRings.location)
end

30.times do
  name = Faker::Games::Pokemon.name
  behemoth = Behemoth.find_or_initialize_by(name: name)
  behemoth.locations << Location.all.sample
  elements = Element.all.shuffle
  behemoth.damage_types = [elements.first]
  behemoth.weakness_types = [elements.second]
  behemoth.save
end

Armor.armor_types.each do |atype, _|
  [:titan, :god, :primordial, :hero].each do |deity|
    5.times do
      name = "#{atype} of #{Faker::Ancient.send(deity)}".titleize
      elements = Element.all.shuffle
      armor = Armor.find_or_initialize_by(name: name)
      armor.attributes = {
        name: name,
        armor_type: atype.to_sym,
        elemental_resistance: elements[0],
        elemental_weakness: elements[1],
        elemental_resistance_amount: rand(30),
        elemental_weakness_amount: rand(30),
        perk: Perk.all.sample,
        perk_amount: rand(2) + 1,
        base_armor: rand(30) + 10,
        cell_slot_type: Armor.cell_slot_types.keys.sample
      }
      armor.save
    end
  end
end

Weapon.weapon_types.each do |wtype, _|
  [:titan, :god, :primordial, :hero].each do |deity|
    5.times do
      name = "#{wtype} of #{Faker::Ancient.send(deity)}".titleize
      elements = Element.all.shuffle
      weapon = Weapon.find_or_initialize_by(name: name)
      weapon.attributes = {
        name: name,
        weapon_type: wtype.to_sym,
        elemental_power: elements[0],
        elemental_power_amount: rand(30),
        perk: Perk.all.sample,
        perk_amount: rand(2) + 1,
        base_power: rand(30) + 10,
        max_power: rand(40) + 50,
        cell_slot_type_one: Armor.cell_slot_types.keys.sample,
        cell_slot_type_two: Armor.cell_slot_types.keys.sample,
      }
      weapon.save
    end
  end
end


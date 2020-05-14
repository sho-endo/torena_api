if @include_menu_names
  json.array! @parts do |part|
    menu_array = []
    part.menus.each do |menu|
      menu_hash = {}
      menu_hash[:id] = menu.id
      menu_hash[:name] = menu.name
      menu_array.push menu_hash
    end

    json.id part.id
    json.name part.name
    json.menus menu_array
  end
else
  json.array! @parts do |part|
    json.id part.id
    json.name part.name
  end
end

if @include_menu_names
  json.parts do
    json.array! @parts do |part|
      menu_names = []
      part.menus.each do |menu|
        menu_names.push menu.name
      end

      json.id part.id
      json.name part.name
      json.menus menu_names
    end
  end
else
  json.parts do
    json.array! @parts do |part|
      json.id part.id
      json.name part.name
    end
  end
end

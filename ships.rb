class Ship
  attr_accessor :name, :water_out, :zagr, :kind, :port

  def initialize name = '', water_out = 0, kind = "unknown", max_ships = 0, port
    @name = name
    @water_out = water_out
    @zagr = false
    @kind = kind
    @max_ships = max_ships
    @port = port
  end
  def zagruzka weight 
    count = 0
    while count < weight
      @water_out += 10
      puts water_out
      count += 10
      sleep(1)
    end
    @zagr = true
  end
  def razgruzka
    @zagr = false
  end  
  def state
    if(zagr) then "загружен" else "не загружен" end
  end
  def ship_max_ships
    if(@kind == 'P')
        p @max_ships.to_s + ' количество пассажиров'
      elsif (@kind == 'G')
          p @max_ships.to_s + ' тонн груза'
      else p @max_ships.to_s + ' вместимость чего-то'
    end
  end
end

class Port
  attr_accessor :name, :ships, :port_volume
  def initialize name, port_volume
    @name = name
    @ships = []
    @port_volume = port_volume
  end
  def getting_ship ship
    if ship.port == self    
      if (!@ships.include?(ship))
        if(@ships.count == port_volume)
          p "Порт " + @name.to_s + " полон"
          else
            @ships << ship
            p "Порт " + @name.to_s + " принял: " + ship.name
        end 
      else
        p ship.name + ": такой корабль уже есть"
      end
    else
      p "корабль " + ship.name + " не может быть прянят, он следует в порт " + ship.port.name
    end
  end
  def sending_ship ship
      if (@ships.include?(ship))
        @ships.delete ship
        p "коробль " + ship.name + " отправлен"
      else
        p "коробля " + ship.name + " в порту нет"
      end
  end
  def print_ships 
    @ships.each do |ship|
      puts ship.name
    end
  end
end
port = Port.new("artur", 4)
port2 = Port.new("pearl-harbor", 4)
ship = Ship.new("avrora", 100, "G", 300, port)
ship2 = Ship.new("avrora2", 100, "P", 150, port2)
ship3 = Ship.new("avrora3", 100, "?", 100, port)
ship4 = Ship.new("avrora4", 200, "P", 1100, port2)
ship5 = Ship.new("avrora5", 200, "P", 1100, port)
port.getting_ship(ship)
port2.getting_ship(ship2)
port.getting_ship(ship3)
port.sending_ship(ship)
port2.getting_ship(ship4)
port2.getting_ship(ship5)
port.print_ships
puts "*************"
# port.getting_ship(ship)
# port.getting_ship(ship2)
# port.getting_ship(ship2)
# port.getting_ship(ship2)
# port.print_ships
# puts "*************"
# port.sending_ship(ship2)
# port.print_ships


# ДЗ Раздели корабли на пассажирские и грузовые
# у пасажирских вместимость пасажиров, а у грузовых грузы 
# В порту ограничить места, для кораблей, если мы добавляем корабль и порт перегружен, ругаемся
# В корабли добавим свойство Порт, должен храниться объект порт
# Создать репозиторий на гит хабе
# каждое задание отдельным коммитом
# Наследование: грузовой и пассажирский.

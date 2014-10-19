class Ship
  attr_accessor :name, :water_out, :zagr, :kind

  def initialize name = '', water_out = 0, kind = "unknown", vmestimost = 0
    @name = name
    @water_out = water_out
    @zagr = false
    @kind = kind
    @vmestimost = vmestimost
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
  def ship_vmestimost
    if(@kind == 'P')
        p @vmestimost.to_s + ' количество пассажиров'
      elsif (@kind == 'G')
          p @vmestimost.to_s + ' тонн груза'
      else p @vmestimost.to_s + ' вместимость чего-то'
    end
  end
end

class Port
  attr_accessor :name, :ships
  def initialize name
    @name = name
    @ships = []
  end
  def priem ship
    if (!@ships.include?(ship))
      @ships << ship
    else
      p ship.name + ": такой корабль уже есть"
    end
  end
  def otpravka ship
        @ships.delete ship
  end
  def print_ships 
    @ships.each do |ship|
      puts ship.name
    end
  end
end
ship = Ship.new("avrora", 100, "G", 300)
ship2 = Ship.new("avrora2", 100, "P", 150)
ship3 = Ship.new("avrora3", 100, "?", 100)
port = Port.new("artur")
port.priem(ship)
port.priem(ship2)
port.priem(ship3)
port.priem(ship3)
port.print_ships
puts "*************"
ship.ship_vmestimost
ship2.ship_vmestimost
ship3.ship_vmestimost
# port.priem(ship)
# port.priem(ship2)
# port.priem(ship2)
# port.priem(ship2)
# port.print_ships
# puts "*************"
# port.otpravka(ship2)
# port.print_ships


# ДЗ Раздели корабли на пассажирские и грузовые
# у пасажирских вместимость пасажиров, а у грузовых грузы 
# В порту ограничить места, для кораблей, если мы добавляем корабль и порт перегружен, ругаемся
# В корабли добавим свойство Порт, должен храниться объект порт
# Создать репозиторий на гит хабе
# каждое задание отдельным коммитом
# Наследование: грузовой и пассажирский.
